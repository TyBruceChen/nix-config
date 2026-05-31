{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    no-sleep.enable = lib.mkEnableOption "Enable no sleep";
  };
  config = lib.mkIf config.no-sleep.enable {
	systemd.sleep.settings.Sleep = {
      	AllowSuspend = "no";
      	AllowHibernation = "no";
      	AllowHybridSleep = "no";
      	AllowSuspendThenHibernate = "no";
    	};
    networking.networkmanager.wifi.powersave = false;

  };
}
