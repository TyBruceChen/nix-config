{ lib, config, ... }:

{
  options.hm.gpg.enable = lib.mkEnableOption "GPG agent";

  config = lib.mkIf config.hm.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
    };
  };
}
