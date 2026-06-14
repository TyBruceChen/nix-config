{lib, ...}:{
    programs.git = {
        enable = lib.mkDefault false;
        settings = { 
          user = {
            name = "tybruce";
            email = "ty_bruce.chen@outlook.com";
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
        signing = {
	  format = "ssh";
        #  signByDefault = config.git.sign;
        };
      };
}
