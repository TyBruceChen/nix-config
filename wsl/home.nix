{ ... }: {
  home.username = "ty_br";
  home.homeDirectory = "/home/ty_br";
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    ffmpeg
    codex
  ];

  hm.ssh-config.enable = true;
  hm.git.enable = true;
  hm.gpg.enable = true;
  hm.tmux.enable = true;
  hm.vim.enable = false;

  programs.home-manager.enable = true;
}
