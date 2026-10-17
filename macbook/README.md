## Current Deployed Machine

- MacBook, Apple Silicon (`aarch64-darwin`)
- macOS with standalone Home Manager
- Username: `tianyi.bruce.chen`
- Flake target: `#macbook`

## Configuration

- [home.nix](home.nix): CLI tools, Git, SSH, GPG, Vim, tmux, and Zsh customization.
- [Brewfile](Brewfile): macOS applications, fonts, and native development tools.
- Apple's `/bin/zsh` remains the login shell; Docker is managed separately.
- [config_detail.md](config_detail.md): setup, package ownership, recovery, and System Data cleanup.

## Apply

From the repository root:

```bash
home-manager switch -b hm-backup --flake .#macbook
brew bundle --file=./macbook/Brewfile
```

## Secret Keys

- SSH
- GPG: see [references/gpg-key.md](../references/gpg-key.md).
