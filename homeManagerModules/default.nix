{ lib, ...}:{
  imports = [
	./git.nix	
	./zsh.nix
	./docker
        ./git.nix
        ./ssh-config.nix
        ./tmux-config.nix
  ];
  hm.ssh-config.enable = lib.mkDefault false;
  hm.tmux.enable = lib.mkDefault true;
  hm.docker.enable = lib.mkDefault false;
  hm.zsh.enable = lib.mkDefault false;	
}
