#!/usr/bin/env zsh

# Ensure ~/.zshrc exists
touch ~/.zshrc

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Install it from https://brew.sh"
  exit 1
fi

# Install custom scripts
sudo cp drdos-help.sh /usr/local/bin/drdos-help
sudo chmod +x /usr/local/bin/drdos-help

sudo cp menu-maker /usr/local/bin/menumaker
sudo chmod +x /usr/local/bin/menumaker

# Install dependencies
brew update
brew install --cask font-fira-code-nerd-font
brew install \
  python@3.11 \
  fd \
  eza \
  bat \
  micro \
  tldr \
  midnight-commander \
  ncdu \
  btop

# Add aliases if not already present
if ! grep -q "# Custom Aliases" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

# Custom Aliases
alias copy='cp -iv'
alias move='mv -iv'
alias del='rm -iv'
alias cls='clear'
alias type='bat --paging=never'
alias edit='mc'
alias find='fd'
alias help='tldr'
alias attrib='ls -lO'
alias mem='vm_stat && top -l 1 | grep PhysMem'
alias chkdsk='df -h'
alias tasklist='ps aux'
alias taskkill='kill'
alias dir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso'
alias ddir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso --grid'
alias ls='eza --color=always --icons --long --group-directories-first'
EOF
  echo "Aliases added to ~/.zshrc"
else
  echo "Aliases already exist in ~/.zshrc"
fi


# Set prompt with color81 path and white dollar sign
if ! grep -q "PROMPT=" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc
setopt prompt_subst
PROMPT='%F{green}%n@%m%f:%F{81}%~%f %F{white}$%f '
EOF
  echo "Prompt customized in ~/.zshrc"
fi

# Set EXA_COLORS for eza
if ! grep -q "EXA_COLORS=" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

# Custom eza colors
export EXA_COLORS="uu=38;5;240:gu=38;5;240:sn=38;5;46:da=38;5;208"
EOF
  echo "EXA_COLORS added to ~/.zshrc"
fi

# Scripting - (Yellow)11 - html,CSS,JS, TS,Py, C,SH,ZSH
# Config files (Dull Yellow) 3 - json,yaml,yml,toml,conf,env 
# Text files (Dull Yellow) 3 - txt , md 
# Compressed (Brown) 94 - zip, 7z, rar, tar, gz, bz2 ,tar, tz.xz, tar.zst, tgz.gz,tar.bz2,tar.xz,tar.zst,jar,war 
# Executables (Green) 46 - bin , com, exe 
# Install files (dark green) 64 - *.deb,rpm,apk,pkg,msi=,dmg,appimage
# Image (Teal) 45 - jpg,png,svg,webp,ico
# Office Documents (Orange) 208- ppt,odp,pptx,csv,xls,ods,xlsx,pdf,docx,odt
# Video (blue) 33- mp4,mkv,mov,webm
# Audio (blue)33-  mp3,wav,flac,ogg=
# Hidden files (grey)240 - 


# Set LS_COLORS for core utilities
if ! grep -q "# Custom file colors" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

# Custom file colors
export LS_COLORS="\
di=38;5;8:\
*.html=38;5;11:*.css=38;5;11:*.js=38;5;11:*.ts=38;5;11:*.py=38;5;11:*.c=38;5;11:*.sh=38;5;11:*.zsh=38;5;11:*.zsh=38;5;11:\
*.json=38;5;3:*.yaml=38;5;3:*.yml=38;5;3:*.toml=38;5;3:*.conf=38;5;3:*.env=38;5;3:\
*.txt=38;5;3:*.md=38;5;3:\
*.zip=38;5;94:*.7z=38;5;94:*.rar=38;5;94:*.tar=38;5;94:*.gz=38;5;94:*.bz2=38;5;94:\
*.xz=38;5;94:*.lz=38;5;94:*.lzma=38;5;94:*.zst=38;5;94:*.tgz=38;5;94:*.tar.gz=38;5;94:\
*.tar.bz2=38;5;94:*.tar.xz=38;5;94:*.tar.zst=38;5;94:*.jar=38;5;94:\
*.exe=38;5;46:*.com=38;5;46:*.bin=38;5;46:\
*.deb=38;5;46:*.rpm=38;5;46:*.apk=38;5;46:*.pkg=38;5;46:*.msi=38;5;46:*.dmg=38;5;46:*.appimage=38;5;46:\
*.jpg=38;5;45:*.png=38;5;45:*.svg=38;5;45:*.webp=38;5;45:*.ico=38;5;45:\
*.ppt=38;5;208:*.odp=38;5;208:*.pptx=38;5;208:*.csv=38;5;208:*.xls=38;5;208:*.ods=38;5;208:*.xlsx=38;5;208:*.pdf=38;5;208:*.docx=38;5;208:*.odt=38;5;208::*.doc=38;5;208:\
*.mp4=38;5;33:*.mkv=38;5;33:*.mov=38;5;33:*.webm=38;5;33:\
*.mp3=38;5;33:*.wav=38;5;33:*.flac=38;5;33:*.ogg=38;5;33:\
.*=38;5;240:"
EOF
  echo "LS_COLORS added to ~/.zshrc"
fi

# Apply changes
echo "Sourcing ~/.zshrc"
source ~/.zshrc


echo "✅ All done! Terminal is configured."

