# dotfiles (Ubuntu, bash)

## Requirments

A [Nerd Font](https://www.nerdfonts.com/) installed and enabled in your terminal
(for example, try the [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)).

The script will try to install next packages:

- [`stow`](https://github.com/aspiers/stow).
- [`eza`](https://github.com/eza-community/eza).
- [`delta`](https://github.com/dandavison/delta).
- [`starship`](https://starship.rs).

## Setup

```sh
git clone https://github.com/N0xFF/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Codespaces

Enable Dotfiles in [settings](https://github.com/settings/codespaces).
