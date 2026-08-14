{pkgs, ...}: {
  imports = [
    ./../homeManagerModules
  ];

  home.username = "tyeli";
  home.homeDirectory = "/home/tyeli";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
	btop
  ];

  hm.zsh.enable = true;
  hm.ssh-config.enable = true;
  programs.home-manager.enable = true;
}
