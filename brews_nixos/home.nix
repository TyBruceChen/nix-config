{pkgs, username, ...}:
let
  opencodePackage =
    if pkgs.opencode.version == "2.2.5" then
      pkgs.opencode.overrideAttrs (old: {
        node_modules = old.node_modules.overrideAttrs (_: {
          outputHash = "sha256-prx9dX7kUvs/E3zopkaPk5LXh3xJAy5sZeum/W8L7cA=";
        });
      }) #not required for future when version != 2.2.5
    else pkgs.opencode;
in
{
  imports = [
    ./../homeManagerModules
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    btop
    psmisc  #process monitor
    #opencodePackage
    p7zip
    go
    bun
    codex
    pandoc  #doc file converter
    texliveFull #latex - pdf render engine
    rustup
    # optional C compiler/linker often needed for building crates
    gcc
    gnumake
    zip
    unzip
    verilator
  ];
	hm.ssh-config.enable = true;
	hm.docker.enable = true;
  hm.tmux.enable = true;
	hm.zsh.enable = true;
  hm.gpg.enable = true;
  hm.lazyvim.enable = true;
	programs.home-manager.enable = true;
}
