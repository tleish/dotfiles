# tleish dotfiles
OSX, Homebrew, fish, git, Slate.


## Features

- Bootstrap script (`bootstrap.bash`) that syncs dotfiles to home dir, installs latest fish with Homebrew if missing and applies fish settings (universal vars)
- [fish](https://github.com/fish-shell/fish-shell) config (`.config/fish`) 
- Homebrew bundle (`brew bundle install`)

Borrow heavily from @sgoumaz's [dotfiles](https://github.com/sgoumaz/dotfiles).


## Installation

Prerequisite: Homebrew.

1. `./bootstrap.bash` (or `./bootstrap.bash -f` to avoid the confirmation prompt)
2. If necessary, add fish to the system shells and make it your default shell:
    - Add `/usr/local/bin/fish` to `/etc/shells`
    - `chsh -s /usr/local/bin/fish`


## Thanks

Original inspiration from https://github.com/sgoumaz/dotfiles.
