#!/bin/bash

# Function to handle errors
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

# Perform an initial re-add to ensure chezmoi's state is up-to-date
echo "Performing initial re-add..."
chezmoi re-add || error_exit "Failed to perform initial re-add."

# Get the list of managed files and directories by chezmoi
echo "Retrieving managed files and directories..."
managed_files=$(chezmoi managed)

# Loop through each managed file or directory
echo "Checking for deleted files or directories..."
while IFS= read -r file; do
  # Check if the file or directory exists in the home directory
  if [ ! -e "$HOME/$file" ]; then
    echo "Detected missing file or directory: $file"

    # Use chezmoi forget to remove it from management
    chezmoi forget "$file" || echo "Failed to forget $file."
  fi
done <<<"$managed_files"

# Function to add files recursively
add_files_recursively() {
  local dir="$1"
  echo "Adding files from directory: $dir"
  find "$HOME/$dir" -type f | while read -r file; do
    relative_path="${file#$HOME/}"
    if ! chezmoi managed | grep -q "^$relative_path$"; then
      echo "Adding new file: $relative_path"
      chezmoi add "$file" || echo "Failed to add $file."
    fi
  done
}

# Loop through directories in the home directory to add new files
echo "Adding new files from managed directories..."
chezmoi managed | grep '/$' | while read -r dir; do
  if [ -d "$HOME/$dir" ]; then
    add_files_recursively "$dir"
  fi
done

# Perform a final add for any untracked changes in the home directory
echo "Performing final add for untracked changes..."
chezmoi add "$HOME" || error_exit "Failed to perform final add."

# Display the updated list of managed files and compare with the initial list
echo "Retrieving updated list of managed files..."
updated_managed_files=$(chezmoi managed)

if [ "$managed_files" != "$updated_managed_files" ]; then
  echo "Changes detected in managed files. New files or directories have been added."
  diff <(echo "$managed_files") <(echo "$updated_managed_files")
else
  echo "No changes detected in managed files after final add."
fi

echo "Script completed successfully."
