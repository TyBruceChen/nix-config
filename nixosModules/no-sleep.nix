{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixos-env.no-sleep.enable = lib.mkEnableOption "Disable sleep";
  };
  config = lib.mkIf config.nixos-env.no-sleep.enable {
	systemd.sleep.settings.Sleep = {
      	AllowSuspend = "no";
      	AllowHibernation = "no";
      	AllowHybridSleep = "no";
      	AllowSuspendThenHibernate = "no";
    	};
    networking.networkmanager.wifi.powersave = false;

  };
}
