# Keybindings

Quick reference for keybindings across all configured apps.

## AeroSpace (Window Manager)

### Main Mode

| Key | Action |
| --- | --- |
| Alt+H/J/K/L | Focus window left/down/up/right |
| Alt+Shift+H/J/K/L | Move window left/down/up/right |
| Alt+Shift+Left/Down/Up/Right | Join panes left/down/up/right |
| Alt+Space | Toggle fullscreen |
| Alt+Shift+F | Toggle floating/tiling |
| Alt+/ | Cycle layout (tiles, h/v) |
| Alt+, | Cycle layout (accordion, h/v) |
| Alt+=/- | Resize +/- 50 |
| Alt+Shift+=/- | Resize +/- 100 |
| Ctrl+1-7 | Switch to workspace 1-7 |
| Cmd+F1-F7 | Move window to workspace 1-7 |
| Alt+Tab | Previous workspace |
| Alt+Shift+Tab | Move workspace to next monitor |
| Alt+R | Enter resize mode |
| Alt+Shift+; | Enter service mode |

### Resize Mode

| Key | Action |
| --- | --- |
| =/- | Resize +/- 50 |
| Shift+=/- | Resize +/- 100 |
| Alt+Shift+H/J/K/L | Join left/down/up/right, return to main |
| Esc | Return to main mode |

### Service Mode

| Key | Action |
| --- | --- |
| Esc | Reload config, return to main |
| R | Flatten workspace tree |
| F | Toggle floating/tiling |
| Backspace | Close all windows except current |

## Ghostty (Terminal)

Prefix: **Ctrl+B**

| Key | Action |
| --- | --- |
| Ctrl+B > - | Split down |
| Ctrl+B > \\ | Split right |
| Ctrl+B > Arrow | Focus split in direction |
| Ctrl+B > N/P | Focus previous/next split |
| Ctrl+B > = | Equalize splits |
| Ctrl+B > Z | Toggle split zoom |
| Ctrl+B > X | Close surface |
| Ctrl+B > C | New tab |
| Ctrl+B > T | Toggle tab overview |
| Ctrl+B > Shift+$ | Rename surface |

## Zellij (Multiplexer)

### Tmux Mode (Ctrl+A)

| Key | Action |
| --- | --- |
| Ctrl+A | Send literal Ctrl+A |
| H/J/K/L or Arrows | Move focus |
| " / ' / - | Split down |
| % / ; / \\ | Split right |
| C | New tab |
| N/P | Next/previous tab |
| 1-9 | Go to tab N |
| T | Rename tab |
| Z | Toggle fullscreen |
| R | Enter resize mode |
| O | Session manager |
| [ / ] | Move pane backward/forward |
| X | Close pane |
| D | Detach |
| Space | Next swap layout |

### Pane Mode (Alt+P)

| Key | Action |
| --- | --- |
| H/J/K/L or Arrows | Move focus |
| D | New pane down |
| R | New pane right |
| S | New pane stacked |
| N | New pane (auto direction) |
| E | Toggle embed/floating |
| F | Toggle fullscreen |
| I | Toggle pinned |
| W | Toggle floating panes |
| Z | Toggle pane frames |
| C | Rename pane |
| P | Switch focus |
| X | Close pane |

### Tab Mode (Alt+T)

| Key | Action |
| --- | --- |
| H/K or Left/Up | Previous tab |
| J/L or Down/Right | Next tab |
| 1-9 | Go to tab N |
| N | New tab |
| R | Rename tab |
| S | Toggle sync |
| B | Break pane |
| [ / ] | Break pane left/right |
| X | Close tab |
| Tab | Toggle tab |

### Resize Mode (Alt+Z)

| Key | Action |
| --- | --- |
| h/j/k/l or Arrows | Increase size in direction |
| H/J/K/L (shift) | Decrease size in direction |
| +/= | Increase |
| - | Decrease |

### Move Mode (Alt+M)

| Key | Action |
| --- | --- |
| H/J/K/L or Arrows | Move pane in direction |
| N / Tab | Cycle pane forward |
| P | Cycle pane backward |

### Scroll Mode (Alt+S)

| Key | Action |
| --- | --- |
| J/K or Down/Up | Scroll down/up |
| H/L or Left/Right | Page up/down |
| D/U | Half page down/up |
| Ctrl+B/F | Page up/down |
| PageUp/PageDown | Page up/down |
| Ctrl+C | Scroll to bottom, exit |
| E | Edit scrollback |
| S | Enter search mode |

### Search Mode

| Key | Action |
| --- | --- |
| N/P | Search down/up |
| C | Toggle case sensitivity |
| W | Toggle wrap |
| O | Toggle whole word |

### Session Mode (Alt+W)

| Key | Action |
| --- | --- |
| W | Session manager |
| C | Configuration |
| P | Plugin manager |
| A | About |
| S | Share |
| D | Detach |

### Shared (All Modes Except Locked)

| Key | Action |
| --- | --- |
| Alt+Arrows | Move focus (or tab for left/right) |
| Alt+N | New pane |
| Alt+F | Toggle floating panes |
| Alt+I/O | Move tab left/right |
| Alt+[/] | Previous/next swap layout |
| Alt+Q | Quit |
| Alt+G | Lock mode |
| Alt+Y | Room finder |
| Ctrl+A | Tmux mode |
| Esc | Return to normal |
| Enter | Return to normal |

> **Note:** Alt+H/J/K/L and Alt+=/- are commented out due to
> [AeroSpace conflict](https://github.com/nikitabobko/AeroSpace/issues/412).
> Use Alt+Arrow keys and Alt+Z resize mode instead.

## Karabiner (Key Remapping)

| Key | Action |
| --- | --- |
| Left Cmd ⇄ Left Opt | Swap (specific keyboards) |
| Right Option | F13 (all keyboards) |

## Yazi (File Manager)

| Key | Action |
| --- | --- |
| Enter | Smart enter (open file or enter dir) |
| F | Find file (fzf) |
| Shift+F | Find file (ripgrep) |
| Z | Jump (zoxide) |
| Shift+T | Toggle max preview |
| Ctrl+O | Open Finder here |
| Y | Yank + copy path to clipboard |
| P | Paste into hovered/cwd |
| G > R | cd to git root |
| Ctrl+P | Quick Look preview |

## Known Conflicts

AeroSpace captures Alt+key combos at the OS level.
The following Zellij bindings are **commented out** pending [per-app keybinds](https://github.com/nikitabobko/AeroSpace/issues/412):

| Key | AeroSpace | Zellij (disabled) |
| --- | --- | --- |
| Alt+H/J/K/L | Focus window | Move focus/tab |
| Alt+=/- | Resize window | Resize pane |

Workarounds: use **Alt+Arrow keys** for navigation and **Alt+Z** for resize mode.
