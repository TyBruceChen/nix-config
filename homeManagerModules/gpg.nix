{ lib, config, pkgs, ... }:

{
  options.hm.gpg.enable = lib.mkEnableOption "GPG agent";

  config = lib.mkIf config.hm.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
	pinentryPackage = pkgs.pinentry-gtk2;
  	enableSshSupport = false;
    };
  };
}
