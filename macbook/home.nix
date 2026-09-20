{config, pkgs, ...}: {
  home.username = "tianyi.bruce.chen";
  home.homeDirectory = "/Users/tianyi.bruce.chen";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree 
  ];

  hm.ssh-config.enable = true;
  hm.git.enable = true;
  hm.vim.enable = true;
  hm.tmux.enable = true;
  hm.zsh.enable = true;
  hm.gpg.enable = true;
  # Docker Desktop, OrbStack, or Colima must be managed separately on macOS.
  hm.docker.enable = false;

  programs.home-manager.enable = true;
  programs.zsh.dotDir = config.home.homeDirectory;
  # Preserve the existing .zprofile, which already runs brew shellenv.
  home.file."${config.lib.zsh.dotDirRel}/.zprofile".enable = false;
  programs.zsh.envExtra = ''
    . "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"
  '';
}
