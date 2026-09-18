{ lib, config, pkgs, ... }:

{
  options.hm.gpg.enable = lib.mkEnableOption "GPG agent";

  config = lib.mkIf config.hm.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
  	  pinentryPackage = pkgs.pinentry-gnome3; #pinentry-gtk2 removed
      enableSshSupport = false;
      # 30 days, in seconds
      defaultCacheTtl = 2592000;
      maxCacheTtl = 2592000;

      # If you also use gpg-agent for SSH keys
      defaultCacheTtlSsh = 2592000;
      maxCacheTtlSsh = 2592000; 
    };
  };
}
