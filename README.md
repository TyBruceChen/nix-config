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

## Nix configs

|folder name|os|argument tag|
- tyeli: nixos #tyeli
- ls_ubuntu: ubuntu24.04 #ls_ubuntu
- uno_q: debian (aarch) #uno_q
- brews_nixos: nixos #brews
