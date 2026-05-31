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

  	};
}
