#!/bin/bash

sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list



#!/usr/bin/env bash

# Ensure ~/.bashrc exists
touch ~/.bashrc

# Install dependencies (Debian/Ubuntu style)
sudo apt update
sudo apt install -y \
  python3.11 \
  fd-find \
  eza \
  bat \
  micro \
  tldr \
  mc \
  ncdu \
  btop \
  fonts-firacode

# Ensure /usr/local/bin exists
sudo mkdir -p /usr/local/bin

# Install custom scripts
sudo cp drdos-help.sh /usr/local/bin/drdos-help
sudo chmod +x /usr/local/bin/drdos-help

sudo cp menu-maker /usr/local/bin/menumaker
sudo chmod +x /usr/local/bin/menumaker

# Add aliases if not already present
if ! grep -q "# Custom Aliases" ~/.bashrc 2>/dev/null; then
cat <<'EOF' >> ~/.bashrc

# Custom Aliases
alias copy='cp -iv'
alias move='mv -iv'
alias del='rm -iv'
alias cls='clear'
alias type='bat --paging=never'
alias edit='mc'
alias find='fdfind'
alias help='tldr'
alias attrib='ls -l'
alias mem='free -h && top -b -n1 | grep Mem'
alias chkdsk='df -h'
alias tasklist='ps aux'
alias taskkill='kill'
alias dir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso'
alias ddir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso --grid'
alias ls='eza --color=always --icons --long --group-directories-first'
EOF
  echo "Aliases added to ~/.bashrc"
else
  echo "Aliases already exist in ~/.bashrc"
fi

# Set LS_COLORS for core utilities
if ! grep -q "# Custom file colors" ~/.bashrc 2>/dev/null; then
cat <<'EOF' >> ~/.bashrc

# Custom file colors
export LS_COLORS="\
di=38;5;8:\
*.html=38;5;11:*.css=38;5;11:*.js=38;5;11:*.ts=38;5;11:*.py=38;5;11:*.c=38;5;11:*.sh=38;5;11:*.zsh=38;5;11:\
*.json=38;5;3:*.yaml=38;5;3:*.yml=38;5;3:*.toml=38;5;3:*.conf=38;5;3:*.env=38;5;3:\
*.txt=38;5;3:*.md=38;5;3:\
*.zip=38;5;94:*.7z=38;5;94:*.rar=38;5;94:*.tar=38;5;94:*.gz=38;5;94:*.bz2=38;5;94:*.xz=38;5;94:*.lz=38;5;94:*.lzma=38;5;94:*.zst=38;5;94:*.tgz=38;5;94:*.tar.gz=38;5;94:*.tar.bz2=38;5;94:*.tar.xz=38;5;94:*.tar.zst=38;5;94:*.jar=38;5;94:*.war=38;5;94:\
*.exe=38;5;46:*.com=38;5;46:*.bin=38;5;46:\
*.deb=38;5;46:*.rpm=38;5;46:*.apk=38;5;46:*.pkg=38;5;46:*.msi=38;5;46:*.dmg=38;5;46:*.appimage=38;5;46:\
*.jpg=38;5;45:*.png=38;5;45:*.svg=38;5;45:*.webp=38;5;45:*.ico=38;5;45:\
*.ppt=38;5;208:*.odp=38;5;208:*.pptx=38;5;208:*.csv=38;5;208:*.xls=38;5;208:*.ods=38;5;208:*.xlsx=38;5;208:*.pdf=38;5;208:*.docx=38;5;208:*.odt=38;5;208:*.doc=38;5;208:\
*.mp4=38;5;33:*.mkv=38;5;33:*.mov=38;5;33:*.webm=38;5;33:\
*.mp3=38;5;33:*.wav=38;5;33:*.flac=38;5;33:*.ogg=38;5;33:\
.*=38;5;240:"
EOF
  echo "LS_COLORS added to ~/.bashrc"
fi

# Set a colorful PS1 prompt
if ! grep -q "PS1=" ~/.bashrc 2>/dev/null; then
cat <<'EOF' >> ~/.bashrc

# Custom PS1 prompt
PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[38;5;81m\]\w\[\e[0m\] \[\e[37m\]$\[\e[0m\] '
EOF
  echo "Prompt customized in ~/.bashrc"
fi

# Apply changes
echo "Sourcing ~/.bashrc"
source ~/.bashrc

echo "✅ All done! Terminal is configured."

