{pkgs, ...}: {
  imports = [
    ./../home-manager
  ];

  home.username = "tyeli";
  home.homeDirectory = "/home/tyeli";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
	btop
  ];

  programs.home-manager.enable = true;
}
