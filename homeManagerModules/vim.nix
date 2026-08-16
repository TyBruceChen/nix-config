{ lib, config, ... }:

{
  options.hm.vim.enable = lib.mkEnableOption "vim config";

  config = lib.mkIf config.hm.vim.enable {
    programs.vim = {
      enable = true;
      defaultEditor = true;
      settings = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };
      extraConfig = ''
        set tabstop=2
        set shiftwidth=2
        set expandtab
      '';
    };
  };
}
