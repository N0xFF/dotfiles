if [ ! -x "$(command -v stow)" ] || [ ! -x "$(command -v eza)" ] || [ ! -x "$(command -v delta)" ] || [ ! -x "$(command -v starship)" ]; then
  sudo pacman -Syy
  sudo pacman -S --noconfirm --needed stow eza git-delta starship ttf-firacode-nerd
fi
