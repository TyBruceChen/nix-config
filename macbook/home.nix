{config, pkgs, ...}: {
  home.username = "tianyi.bruce.chen";
  home.homeDirectory = "/Users/tianyi.bruce.chen";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    tailscale
  ];

  hm.git.enable = true;
  hm.vim.enable = true;
  hm.tmux.enable = true;
  hm.zsh.enable = true;
  # The shared agent uses Linux/GNOME pinentry; keep Mac agent setup separate.
  hm.gpg.enable = false;
  programs.gpg.enable = true;
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
