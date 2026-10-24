## How to use flake

* NixOS
- Eable flake by adding experimental features `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nix/nix.conf` file 
```
sudo nixos-rebuild test --flake .#tag 
```

```
sudo nixos-rebuild run --flake .#tag 
```

* HomeManager 

- First time use: 
  - Enable flake by adding experimental features `experimental-features = nix-command flakes fetch-tree` in `/etc/nix/nix.conf` and `~/.conf/nix/nix.conf`
  - Run by installing home-manager: `nix run github:nix-community/home-manager/master -- switch -b hm-backup --flake .#wsl
`  

```
home-manager switch --flake .#tag
```

```
home-manager build --flake .#tag
```

`tag` arguement in `flake.nix` is used to pass value to HM modules.

## NixOS Deployment
- substitute the `boot.loader.*` and `hardware-configuration.nix` config in `configuration.nix` with current machine's default config in `/etc/nixos/`.
- Use `nixos-rebuild boot` to save as next bootable os if the test pass however ui crashes.
- See [GPG key setup](references/gpg-key.md) and any host-specific README for secret key deployment.

## Configured Machines

For non-NixOS machines, only HomeManager is deployed; For NixOS machines, `home.nix` is used to control the Home Manager Options for the user, along with `nixosModules/` system-level config. 

| folder name | os | argument tag |
| :--- | :---: | :---: |
| tyeli | nixos | #tyeli |
| ls_ubuntu | ubuntu24.04 | #ls_ubuntu |
| [wsl](wsl/home.nix) | Ubuntu on WSL (x86_64) | #wsl |
| uno_q | debian (aarch) | #uno_q |
| brews_nixos | nixos | #brews |
| [macbook](macbook/README.md) | macOS (Apple Silicon) | #macbook |

## Update Packages

```
# Update pinned nixpkgs and Home Manager versions
nix flake update

# Build without activating
home-manager build --flake .#macbook

# If the build succeeds, activate
home-manager switch -b hm-backup --flake .#macbook
```

## Zsh Customization
- Every flake entry enables the shared Home Manager Zsh configuration. Install a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) locally to display the prompt icons.
- Edit `homeManagerModules/zsh.nix` for common settings or a machine's tag list and `lib.mkIf` section for its own aliases and other Zsh settings.

## Writing Style
Option-gated modules
- Each module exposes an `enable` option.
- Modules are activated via `*.enable = true` and imported in `default.nix` file.
- Config is wrapped in `lib.mkIf config.<path>.enable`.
- This repo uses toggle-based Nix modules.
- Default settings are in `default.nix` files. Machine-specific settings are in `home.nix` or `nixos-env.*` in `configuration.nix` file.

## Config with AI
Install the SKILL in `.opencode/skills/nix-flake-config`
```
git submodule update --init
```

## Clean old system generations
`nix-collect-garbage --delete-old`
