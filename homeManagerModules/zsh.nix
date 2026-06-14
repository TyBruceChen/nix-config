{
    config,
    pkgs,
    lib, 
    ...
  }:  
 let
    rebuild-nix = pkgs.writeShellScript "rebuild-nix.sh" (
      builtins.readFile ./data/rebuild.sh
    ); 
    p10k =
      pkgs.writeText ".p10k.zsh" (builtins.readFile ./data/.p10k16.zsh);
 in {
  options.hm.zsh.enable = lib.mkEnableOption "zsh customization";
  config = lib.mkIf config.hm.zsh.enable {
      home.packages = with pkgs; [nh alejandra];
      programs.zsh = {
        enable = true;

        oh-my-zsh = {
          enable = true;
          theme = "";
          plugins = [
            "git"
            "sudo"
          ];
        };

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        plugins = [
          {
            name = "zsh-nix-shell";
            file = "nix-shell.plugin.zsh";
            src = pkgs.fetchFromGitHub {
              owner = "chisui";
              repo = "zsh-nix-shell";
              rev = "v0.8.0";
              sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
            };
          }
        ];

        shellAliases = {
          l = "eza --group-directories-first --icons=auto -la";
          rebuild-nix = "${rebuild-nix}";
          rcat = "command cat";
          cat = "bat";
        };

        initContent = ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
            source ${p10k}
        '';
      };

      home.sessionVariables = {
        DISABLE_AUTO_TITLE = "true";
      };
      home.sessionPath = [
        "${config.home.homeDirectory}/.local/bin"
      ];
      programs.eza.enable = true;
      programs.bat = {
        enable = true;
        config = {
          paging = "never";
          style = "plain";
        };
  };
  };
}
