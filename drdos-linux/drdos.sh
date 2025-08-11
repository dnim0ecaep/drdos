#!/bin/bash
# install help
#Requires "eza"
cat << 'EOF' >> ~/.bashrc
alias ls='eza -l --grid --icons --time-style=long-iso --group-directories-first'
PS1='\[\e[1;36m\]\w\n\[\e[0m\]❯ '
EOF




sudo cp drdos-help.sh /usr/local/bin/drdos-help
sudo chmod +x /usr/local/bin/drdos-help

sudo cp menu-maker /usr/local/bin/
sudo chmod +x /usr/local/bin/menumaker


sudo apt install fd-find eza bat micro mc ncdu btop tealdeer


tldr --update




# Define the aliases
ALIASES=$(cat <<'EOF'
# Custom Aliases
alias copy='cp -iv'
alias move='mv -iv'
alias del='rm -iv'
alias cls='clear'
alias type='bat --paging=never'
alias edit='mc'
alias find='fd'
alias help='tldr'
alias attrib='lsattr'
alias mem='free -h'
alias chkdsk='df -h'
alias tasklist='ps aux'
alias taskkill='kill'
EOF
)

# Append to bash.bashrc
if ! grep -q "# Custom Aliases" /etc/bash.bashrc; then
  echo "$ALIASES" | sudo tee -a /etc/bash.bashrc > /dev/null
fi

# Append to zshrc
#ZSHRC="/etc/zsh/zshrc"
#if ! grep -q "# Custom Aliases" "$ZSHRC"; then
#  echo "$ALIASES" | sudo tee -a "$ZSHRC" > /dev/null
#fi

echo "Aliases added to /etc/bash.bashrc and /etc/zsh/zshrc."

