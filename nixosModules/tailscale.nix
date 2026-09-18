{
  lib,
  config,
  ...
}: {
  options.nixos-env.tailscale.enable = lib.mkEnableOption "Enable Tailscale";

  config = lib.mkIf config.nixos-env.tailscale.enable {
    services.tailscale.enable = true;
  };
}
