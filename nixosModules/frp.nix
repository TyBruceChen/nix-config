{ pkgs, lib, config, ... }:

let
  cfg = config.nixos-env;

  enabledForUser = users:
    builtins.elem cfg.username users;
in
{
  options.nixos-env.frp.enable = lib.mkEnableOption
    "Enable frp service, merge them (only one user should be enabled)";

  config = lib.mkIf cfg.frp.enable {
    services.frp.instances =
      lib.optionalAttrs (enabledForUser [ "tyeli" ]) {
        ssh = {
          enable = true;
          role = "client";

          settings = {
            serverAddr = "us-west.tybruce.com";
            serverPort = 9009;

            proxies = [
              {
                name = "ssh";
                type = "tcp";
                localIP = "127.0.0.1";
                localPort = 22;
                remotePort = 9010;
              }
            ];
          };
        };
      }
      // lib.optionalAttrs (enabledForUser [ "brews" ]) { #`//` here is the merge operator
        ssh = {
          enable = true;
          role = "client";

          settings = {
            serverAddr = "us-west.tybruce.com";
            serverPort = 9011;

            proxies = [
              {
                name = "ssh";
                type = "tcp";
                localIP = "127.0.0.1";
                localPort = 22;
                remotePort = 9012;
              }
            ];
          };
        };
      };
  };
}
