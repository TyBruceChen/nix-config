{lib, config,  pkgs, tag, ...}:
let
  gpgSignTags = [ "brews" "ls_ubuntu"];
  useGpg = builtins.elem tag gpgSignTags;
in
{	
	options.hm.git.enable = lib.mkEnableOption "git config";
	config = lib.mkIf config.hm.git.enable {
	programs.git = {
        enable = true;
        settings = { 
          user = {
            name = "TyBruceChen";
            email = "tianyi.bruce.chen@gmail.com";
          };
          init = {
            defaultBranch = "main";
          };
          #pull = {
          #  rebase = true;
          #};
        };
	ignores = [
		  ".DS_Store"
		];

      signing = if useGpg then {
        key = "41A76F2A9138E3BF";
        signByDefault = true;
      } else {
        format = "ssh";
        signByDefault = false;
      };

      extraConfig = if useGpg then {
        commit.gpgsign = true;
        gpg.program = "${pkgs.gnupg}/bin/gpg";
      } else {
        gpg.format = "ssh";
      };

	};
	
	};
}
