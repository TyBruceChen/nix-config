{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixos-env.docker.enable = lib.mkEnableOption
      "Enable Docker";
  };

  config = lib.mkIf config.nixos-env.docker.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
    };
    users.users.${config.nixos-env.username}.extraGroups = [
      "docker"  # add the user to the Unix group named docker. Docker's daemon socket usually owned by root:docker.
    ];
  };
}
