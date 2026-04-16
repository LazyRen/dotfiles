# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment

My primary environments: macOS (personal) and Linux (remote dev servers via SSH). Tools: Fish shell, Neovim (LazyVim), Zellij, Ghostty, AeroSpace, Starship prompt, OneDark theme. Languages: Python, Shell/Fish, Lua (neovim config), YAML, some C++/Rust. Always consider cross-platform differences when relevant.

## Communication Style

When I ask a quick question, give a concise answer first. Don't start with lengthy explanations or background — get to the point, then elaborate if I ask.

Don't make edits I didn't ask for. If I ask for proofreading, only proofread. If I ask a question, answer the question — don't also apply fixes or refactor code unless explicitly requested.

Check CLAUDE.md for environment details before answering. I use Fish shell (not bash/zsh), LazyVim (not vanilla nvim), and my dotfiles use sed-based templating. Make sure answers account for these specifics.

## Approach

Before making any changes, outline 2-3 possible approaches with pros/cons. Tell me which one you'd recommend and why. Wait for my approval before proceeding. If your first approach fails, stop and reassess rather than trying variations.

## Accuracy

Before suggesting a feature, keybinding, or API exists, verify it in the actual documentation or source code. Never fabricate keybindings, config options, or tool capabilities. If unsure, say so.

## Dotfiles

My dotfiles use a templating system (sed-based, no complex logic). Don't assume template engines with hex-to-RGB conversion or advanced features — check the existing templating approach first before making changes.

## Config Editing Rules

When editing config files (Neovim, Zellij, Fish, AeroSpace), always read the existing file structure first. Pay attention to nesting levels, load order, and which file is project-level vs global. Don't overwrite existing sections — append or merge carefully.

## Overview

Dotfiles repository managing configurations for: Ghostty, Fish, Starship, Zellij, (and optionally Wezterm, Zsh). Uses GNU Stow for symlink management.

## Setup & Installation

```bash
./setup.sh
```

`setup.sh` runs four steps in order:
1. Reads active app list from `config.yaml`
2. Installs Homebrew packages from `brew/list.yaml` (skipped if `brew` not found)
3. Installs Oh My Zsh if `zsh` is in the app list
4. Stows all apps via `stow --restow -t ~`
5. Runs per-app `setup.sh` hooks (e.g., `fish/setup.sh` bootstraps fisher, `zellij/setup.sh` downloads WASM plugins)

## Architecture

### Config

- `config.yaml` — single source of truth for which apps to stow. Comment out a line to disable.
- `brew/list.yaml` — Homebrew formulas and casks (casks are macOS-only).

### Stow Layout

Each package directory mirrors `$HOME`. Stow creates symlinks from `$HOME` into the repo:

```
<package>/.config/<app>/       →  ~/.config/<app>/
zsh/.oh-my-zsh/custom/         →  ~/.oh-my-zsh/custom/
starship/.config/starship.toml →  ~/.config/starship.toml
```

Packages with `setup.sh` hooks need a `.stow-local-ignore` file (includes stow defaults + `setup\.sh`) since it replaces stow's built-in ignore list.

### Fish Shell

- `config.fish` initializes: brew, zoxide, starship, fzf, atuin, mise
- Fisher plugin manager with plugins defined in `fish_plugins` (done, autopair, sponge)
- `fish/setup.sh` bootstraps fisher and installs plugins
- Gerrit functions (`gpg`, `gpgwip`, `gpgready`) wrap `git push` for code review — **not** related to GPG encryption

### Cross-Application Conventions

- **Font**: JetBrainsMono Nerd Font
- **Theme**: OneDark / One-Half-Dark family
- **Navigation**: Vim-style (hjkl) keybindings in multiplexers/terminals
