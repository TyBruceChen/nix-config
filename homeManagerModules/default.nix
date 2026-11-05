{ lib, ...}:{
  imports = [
	./git.nix	
	./zsh.nix
	./docker 
	./ssh-config.nix
	./tmux-config.nix
	./gpg.nix
  	./vim.nix
    ./lazyvim.nix
  ];
  hm.vim.enable = lib.mkDefault true;
  hm.lazyvim.enable = lib.mkDefault false;
  hm.git.enable = lib.mkDefault true;
  hm.ssh-config.enable = lib.mkDefault false;
  hm.tmux.enable = lib.mkDefault true;
  hm.docker.enable = lib.mkDefault false;
  hm.zsh.enable = lib.mkDefault false;
  hm.gpg.enable = lib.mkDefault false;	
}
