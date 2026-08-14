{pkgs, lib, config, ...}:{
	options.nixos-env.frp.enable = lib.mkEnableOption "Enable frp client service for tyeli nixos device to aws us-west frp server";
	config = lib.mkIf config.nixos-env.frp.enable {
	  services.frp.instances = {
	  ssh = {
	  	enable = true;
		role = "client";
		settings = {	
proxies = [
    {
      localIP = "127.0.0.1";
      localPort = 22;
      name = "ssh";
      remotePort = 9010;
      type = "tcp";
    }
  ];
  serverAddr = "us-west.tybruce.com";
  serverPort = 9009;

		};
	    };
	  };
	};
}
