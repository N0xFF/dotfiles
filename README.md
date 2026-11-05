# dotfiles (Ubuntu, Bash)

Personal shell settings with a simple installer.

## Before you start

Install and enable a [Nerd Font](https://www.nerdfonts.com/font-downloads) in
your terminal.

## Setup

```sh
git clone https://github.com/N0xFF/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The script will try to install next packages:

- [`stow`](https://github.com/aspiers/stow).
- [`eza`](https://github.com/eza-community/eza).
- [`delta`](https://github.com/dandavison/delta).
- [`starship`](https://starship.rs).

The script also creates symlinks in your home directory for the relevant files
in `~/.dotfiles`. Customize them in `~/.dotfiles`.

## Codespaces

Enable dotfiles in your [Codespaces settings](https://github.com/settings/codespaces).
