{
	pkgs,
	lib,
	config,
	...
}:{
	options.openssh.enable = lib.mkEnableOption "ssh server";
	config = lib.mkIf config.openssh.enable{
		services.openssh = {
	          enable = true;
        	  settings = {
          	    AllowUsers = ["tyeli"];
		    PermitRootLogin = "no";
          	    PasswordAuthentication = false;
        	  };
  		};

  		users.users.tyeli = {
        	  openssh.authorizedKeys.keys = [
		    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAybMbbEzlZXgbc27CjcqN2ZpC0Ir/BPm5frPI9Gf3WB ty_bruce.chen@outlook.com"
        	  ];
  		};
	};
}
