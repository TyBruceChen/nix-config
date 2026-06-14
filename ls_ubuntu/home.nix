{
  config,
  pkgs,
  lib,
  nixosConfig ? null,
  ...
}: {
  home.username = "tydaniel-bybruce";
  home.homeDirectory = "/home/tydaniel-bybruce";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    #nodejs_24
  ];

  #tmux.enable = true; 
  hm.ssh-config.enable = true;
  hm.zsh.enable = true;
  home.sessionVariables = {
    #EDITOR = "nvim";
    #NIXPKGS_ALLOW_UNFREE = 1;
  };

  programs = {
    #bash.enable = true;
    home-manager.enable = true;
    git.enable = true;
  };
}
