{lib, ...}:{
	imports = [
		./openssh.nix
		./no-sleep.nix
		./frp.nix
	];
	openssh.enable = lib.mkDefault true;	
	no-sleep.enable = lib.mkDefault true;
	frp.enable = lib.mkDefault true;
}
