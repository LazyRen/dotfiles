# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Stack

| Tool | Purpose |
|------|---------|
| [Ghostty](https://ghostty.org/) | Terminal emulator |
| [Fish](https://fishshell.com/) | Shell |
| [Starship](https://starship.rs/) | Prompt |
| [Zellij](https://zellij.dev/) | Terminal multiplexer |
| [Atuin](https://atuin.sh/) | Shell history |
| [Mise](https://mise.jdx.dev/) | Runtime version manager |

## Install

```bash
git clone https://github.com/LazyRen/dotfiles.git
cd dotfiles
# Edit config.yaml to enable/disable apps before running
./setup.sh
```

`config.yaml` controls which apps are installed. Comment out any app to skip it.

`setup.sh` will:
1. Install Homebrew packages from `brew/list.yaml`
2. Symlink configured apps to `$HOME` via stow

## Structure

```
config.yaml          # Apps to install (comment out to disable)
brew/list.yaml       # Homebrew formulas and casks
setup.sh             # Main installer

fish/                # Fish shell + fisher plugins
ghostty/             # Ghostty terminal
starship/            # Starship prompt
zellij/              # Zellij multiplexer + WASM plugins
wezterm/             # Wezterm terminal (optional)
zsh/                 # Zsh + oh-my-zsh (optional)
```

Each directory mirrors `$HOME` for stow (e.g., `fish/.config/fish/` → `~/.config/fish/`).

## Adding a new app

1. Create `<app>/.config/<app>/` with your config files
2. Add `- <app>` to `config.yaml`
3. Run `./setup.sh`

If the app needs post-stow setup, add an executable `setup.sh` in the app directory and create a `.stow-local-ignore` file (see `fish/.stow-local-ignore` for reference).
