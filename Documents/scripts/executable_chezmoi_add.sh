#!/bin/bash

echo "Script starting..."

cd ~/.local/share/chezmoi/ || { echo "Failed to change directory"; exit 1; }

dirs=(
  ~/.config/hypr/
  ~/.config/nvim/
  ~/.config/foot/
  ~/.config/yazi/
  ~/Documents/scripts/
)

# Function to show changes
show_changes() {
    echo "Changes to be committed:"
    git status -s
    git diff --cached
}

read -p "Apply changes to ${dirs[*]}? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Continuing..."
    for dir in "${dirs[@]}"
    do
        chezmoi add -r "$dir"
    done
else
    echo "Exiting..."
    exit 0
fi

git add .

# Show changes before committing
show_changes

read -p "Do you want to commit these changes? (y/n): " commit_answer

if [[ "$commit_answer" == "y" || "$commit_answer" == "Y" ]]; then
    # Commit and push changes
    if ! git diff-index --quiet HEAD --; then
        echo "Enter commit message: "
        read -r commit_message  # Read commit message from user input
        git commit -m "$commit_message" || { echo "Git commit failed"; exit 1; }
        
        echo "Pushing changes..."
        git push || { echo "Git push failed"; exit 1; }
    else
        echo "No changes to commit."
    fi
else
    echo "Changes not committed. Exiting..."
    exit 0
fi

echo "Script completed successfully."


