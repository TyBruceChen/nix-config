{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      local_server = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          homePath = ./tyeli/home.nix;
          tag = "tyeli";
        };
        modules = [
          ./tyeli/configuration.nix
          inputs.home-manager.nixosModules.default
          ./nixosModules
        ];
      };
    };

    #home-manager configurations:
    homeManagerModules.default = import ./homeManagerModules; 
    homeConfigurations = {
    ls_ubuntu = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        modules = [
          ./ls_ubuntu/home.nix
          self.homeManagerModules.default
        ];
        extraSpecialArgs = {
          inherit inputs;
          tag = "ls_ubuntu";
        };
      };
    uno_q = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-linux";
        };
        modules = [
          ./uno_q/home.nix
          self.homeManagerModules.default
        ];
        extraSpecialArgs = {
          inherit inputs;
          tag = "uno_q";
        };
      };
    };

  }; 
}
