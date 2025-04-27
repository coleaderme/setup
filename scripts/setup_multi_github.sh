#!/usr/bin/sh

# Bash script to set up multiple GitHub accounts on one machine

# Prompt for user inputs
read -p "Enter Personal GitHub Email: " PERSONAL_EMAIL
read -p "Enter Work GitHub Email: " WORK_EMAIL

# File paths for SSH keys
PERSONAL_KEY="$HOME/.ssh/id_rsa_personal"
WORK_KEY="$HOME/.ssh/id_rsa_work"

# Generate SSH keys
echo "Generating SSH keys..."
ssh-keygen -t rsa -b 4096 -C "$PERSONAL_EMAIL" -f "$PERSONAL_KEY" -N ""
ssh-keygen -t rsa -b 4096 -C "$WORK_EMAIL" -f "$WORK_KEY" -N ""

# Start ssh-agent and add keys
echo "Adding SSH keys to the agent..."
eval "$(ssh-agent -s)"
ssh-add "$PERSONAL_KEY"
ssh-add "$WORK_KEY"

# Backup existing SSH config if it exists
SSH_CONFIG="$HOME/.ssh/config"
if [ -f "$SSH_CONFIG" ]; then
    cp "$SSH_CONFIG" "$SSH_CONFIG.backup"
    echo "Existing SSH config backed up to config.backup"
fi

# Write new SSH config
echo "Writing new SSH config..."
cat > "$SSH_CONFIG" <<EOL
# Personal GitHub account
Host github.com-personal
    HostName github.com
    User git
    IdentityFile $PERSONAL_KEY

# Work GitHub account
Host github.com-work
    HostName github.com
    User git
    IdentityFile $WORK_KEY
EOL

# Set proper permissions for the SSH config file
chmod 600 "$SSH_CONFIG"

# Final instructions
echo "[+] SSH keys generated and configured."
echo "Next steps:"
echo "1. Add the following public keys to the correct GitHub accounts:"
echo "   - Personal: $(cat ${PERSONAL_KEY}.pub)"
echo "   - Work: $(cat ${WORK_KEY}.pub)"
echo ""
echo "2. Clone repos using:"
echo "   - Personal: git@github.com-personal:username/repo.git"
echo "   - Work: git@github.com-work:company/repo.git"
echo ""
echo "3. Set user.email and user.name inside each repo manually."
echo "Done!"
