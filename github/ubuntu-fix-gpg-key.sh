# --
# ubuntu-fix-gpg-key.sh
# Source: https://github.com/cli/cli/issues/9569
# --

# Check for wget, if not installed, install it
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings

# Set keyring path based on existence of /usr/share/keyrings/githubcli-archive-keyring.gpg
# If it is in the old location, use that, otherwise always use the new location.
if [ -f /usr/share/keyrings/githubcli-archive-keyring.gpg ]; then
    keyring_path="/usr/share/keyrings/githubcli-archive-keyring.gpg"
else
    keyring_path="/etc/apt/keyrings/githubcli-archive-keyring.gpg"
fi

echo "replacing keyring at ${keyring_path}"

# Download and set up the keyring
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee "$keyring_path" > /dev/null \
    && sudo chmod go+r "$keyring_path"

# Idempotently add the GitHub CLI repository as an apt source
echo "deb [arch=$(dpkg --print-architecture) signed-by=$keyring_path] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Update the package lists, which should now pass
sudo apt update