## How to use flake

* NixOS 
```
sudo nixos-rebuild test --flake .#tag 
```

```
sudo nixos-rebuild run --flake .#tag 
```

* HomeManager (first install it)
```
home-manager switch --flake .#tag
```

```
home-manager build --flake .#tag
```

## Deployed Machines

For non-NixOS machines, only HomeManager is deployed; For NixOS machines, `home.nix` is used to control the Home Manager Options for the user, along with `nixosModules/` system-level config. 

| folder name | os | argument tag |
| :--- | :---: | :---: |
| tyeli | nixos | #tyeli |
| ls_ubuntu | ubuntu24.04 | #ls_ubuntu |
| uno_q | debian (aarch) | #uno_q |
| brews_nixos | nixos | #brews |

## Writing Style
Option-gated modules
- Each module exposes an `enable` option.
- Modules are activated via `*.enable = true` and imported in `default.nix` file.
- Config is wrapped in `lib.mkIf config.<path>.enable`.
- This repo uses toggle-based Nix modules.
- Default settings are in `default.nix` files. Machine-specific settings are in `home.nix` or `nixos-env.*` in `configuration.nix` file.
