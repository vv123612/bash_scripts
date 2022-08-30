# https://unix.stackexchange.com/questions/533072/how-to-save-command-as-well-as-output-of-that-command-to-a-file

# Define command
# mycmd=(some_command -o "some option")
mycmd=(ls -la "/home/vitaly")

# Print command
echo "${mycmd[@]}"

# Run command
"${mycmd[@]}" 