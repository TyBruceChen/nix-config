{
  config,
  pkgs,
  lib,
  nixosConfig ? null,
  ...
}: {
  home.username = "arduino";
  home.homeDirectory = "/home/arduino";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    #nodejs_24
  ];

  #tmux.enable = true;
  #git.sign = false;

  home.sessionVariables = {
    #EDITOR = "nvim";
    #NIXPKGS_ALLOW_UNFREE = 1;
  };

  programs = {
    #bash.enable = true;
    home-manager.enable = true;
  };
}

