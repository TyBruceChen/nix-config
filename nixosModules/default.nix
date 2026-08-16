{lib, ...}:{
	imports = [
		./openssh.nix
		./no-sleep.nix
		./frp.nix
    ./docker.nix
  ];

	config = {
	nixos-env.openssh.enable = lib.mkDefault true;	
	nixos-env.no-sleep.enable = lib.mkDefault true;
	nixos-env.frp.enable = lib.mkDefault false;
  nixos-env.docker.enable = lib.mkDefault false;
  };

	options.nixos-env.username = lib.mkOption {
    		type = lib.types.str;
    		default = "tyeli";
  	};		
}
