{pkgs, username, ...}: {
  imports = [
    ./../homeManagerModules
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
	btop		
  ];
	hm.ssh-config.enable = true;
	hm.docker.enable = true;
  	hm.tmux.enable = true;
	hm.zsh.enable = true;
	hm.gpg.enable = true;
	programs.home-manager.enable = true;
}
