{
    config,
    pkgs,
    lib, 
    tag,
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
        # Apple supplies the Darwin login shell; Home Manager supplies its configuration.
        package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null;

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
          newF = "print -rl -- *(D.om[1,5]N)";
          rebuild-nix = if pkgs.stdenv.hostPlatform.isDarwin then
            "home-manager switch --flake ${lib.escapeShellArg "${config.home.homeDirectory}/nix-config#${tag}"}"
          else "${rebuild-nix}";
          rcat = "command cat";
          cat = "bat";
          workF = "cd ~/Documents/codes/";
          osF = if pkgs.stdenv.hostPlatform.isDarwin then
            "cd ~/nix-config/"
          else "cd ~/Documents/nix-config/";
        } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
          shelltree = "pstree -s -p \"$$\"";
          core-keeper-id = "sudo docker exec -it core-keeper cat /home/steam/core-keeper-dedicated/GameID.txt";
        };

        initContent = lib.mkMerge [
          (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (lib.mkBefore ''
            # Run after macOS path_helper and the user's Homebrew login profile.
            typeset -U path
            path=(${lib.escapeShellArg "${config.home.profileDirectory}/bin"} $path)
          ''))
          ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
            source ${p10k}

            export GPG_TTY="$(tty)"

            printf "Current live tmux session:"
            out="$(tmux ls 2>/dev/null)"
            if [ -z "$out" ]; then
              printf 'None\n'
            else
              printf '\n%s\n' "$out"
            fi

            echo 'Use reset command to clear gibberish behavior'
          ''
        ];
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
