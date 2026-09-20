{ lib, config, pkgs, ... }:

{
  options.hm.gpg.enable = lib.mkEnableOption "GPG agent";

  config = lib.mkIf config.hm.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      pinentry.package = if pkgs.stdenv.hostPlatform.isDarwin then
        pkgs.pinentry_mac
      else pkgs.pinentry-gnome3;
      enableSshSupport = false;
      # Cache for 30 days of inactivity, capped at 30 days since entry creation.
      # Agent restarts/reboots clear the in-memory cache earlier.
      defaultCacheTtl = 2592000;
      maxCacheTtl = 2592000;

      # If you also use gpg-agent for SSH keys
      defaultCacheTtlSsh = 2592000;
      maxCacheTtlSsh = 2592000; 
    };
  };
}
