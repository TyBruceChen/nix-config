{...}:{
	programs.git = {
        enable = true;
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
        #signing = {
        #  signByDefault = config.git.sign;
        #};
      };
}
