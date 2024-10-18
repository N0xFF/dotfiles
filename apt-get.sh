if [ ! -x "$(command -v stow)" ] || [ ! -x "$(command -v eza)" ] || [ ! -x "$(command -v delta)" ]; then
  sudo apt update
fi

if [ ! -x "$(command -v stow)" ]; then
  sudo apt install -y stow
fi

# A modern alternative to ls
# https://github.com/eza-community/eza
if [ ! -x "$(command -v eza)" ]; then
  sudo apt install -y gpg
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --yes --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt update
  sudo apt install -y eza
fi

# A syntax-highlighting pager for git, diff, grep, and blame output
# https://github.com/dandavison/delta
if [ ! -x "$(command -v delta)" ]; then
  wget -P /tmp https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
  sudo dpkg -i /tmp/git-delta_0.18.2_amd64.deb
fi
