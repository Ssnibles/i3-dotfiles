# Run fastfetch as welcome message
function fish_greeting
    pokeget abra --hide-name > ~/.config/fastfetch/logos/pokemon_logo.txt # Output pokeget to file to be displayed as fastfetch logo
    fastfetch --config ~/.config/fastfetch/main.jsonc # Run custom fastfetch config
    cp /dev/null ~/.config/pokemon_logo.txt # Clear the pokemon_logo file
end

function fetch
  fish_greeting # Run fish_greeting function when using fetch
end
