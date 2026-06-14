{ config, lib, ... }:

{
  options.hm.tmux.enable = lib.mkEnableOption "tmux config";

  config = lib.mkIf config.hm.tmux.enable {
    programs.tmux = {
      enable = true;
      extraConfig = ''
        # Set different prefix for remote (nested) sessions, e.g., Ctrl+a
        set-option -g prefix C-q
        unbind-key C-b
        bind-key C-q send-prefix

        # Use Vi-mode for copy navigation
        setw -g mode-keys vi

        # Explicitly map keys for copy mode
        bind -T copy-mode-vi 'v' send -X begin-selection
        bind -T copy-mode-vi 'y' send -X copy-selection-and-cancel
        bind -T copy-mode-vi Enter send -X copy-selection-and-cancel

        # Enable OSC 52 clipboard support
        set -s set-clipboard on
        set-option -g detach-on-destroy off
      '';
    };
  };
}
