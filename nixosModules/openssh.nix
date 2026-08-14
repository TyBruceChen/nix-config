{
	pkgs,
	lib,
	config,
	...
}:{
	options.nixos-env.openssh.enable = lib.mkEnableOption "ssh server";
	config = lib.mkIf config.nixos-env.openssh.enable{
		services.openssh = {
		enable = true;
 		settings = {
		AllowUsers = [ "${config.nixos-env.username}" ];
		PermitRootLogin = "no";
		PasswordAuthentication = false;
		};

		};
	};
}
