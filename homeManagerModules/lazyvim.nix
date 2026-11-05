{ config, lib, pkgs, inputs, ... }:

{
  options.hm.lazyvim.enable = lib.mkEnableOption "LazyVim configuration";

  config = lib.mkIf config.hm.lazyvim.enable {
    home.packages = with pkgs; [
      neovim
      git
      curl
      ripgrep
      fd
      fzf
      tree-sitter
      stdenv.cc
    ];

    xdg.configFile."nvim" = {
      source = inputs.lazyvim-starter;  #github:LazyVim/starter
      recursive = true;
    };
  };
}
