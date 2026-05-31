{pkgs, lib, config, ...}:{
	options.frp.enable = lib.mkEnableOption "Enable frp client service";
	config = lib.mkIf config.frp.enable {
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
