{ config, lib, pkgs, ... }:
{
  # 1. Declare the option switch
  options.hm.docker.enable = lib.mkEnableOption "docker-compose files";

  # 2. Define the configuration that activates ONLY when the option is true
  config = lib.mkIf config.hm.docker.enable {
    home.packages = with pkgs; [
      docker-compose
    ];

    # This creates a symlink pointing directly to your local file
    xdg.configFile."docker/open-webui/docker-compose.yml".source = ./open-webui.yml;
    xdg.configFile."docker/core-keeper/docker-compose.yml".source = ./core-keeper.yml;

    home.sessionVariables = {
      DOCKER_HOST = "unix:///var/run/docker.sock";
    };
  };
}
