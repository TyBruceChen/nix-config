{ config, lib, tag, ... }:

let
  ctrlQTags = [ "brews" "tydaniel" "tyeli" "uno_q" "ls_ubuntu"];
  useCtrlQ = builtins.elem tag ctrlQTags;
  prefix = if useCtrlQ then "C-q" else "C-b";
  otherPrefix = if useCtrlQ then "C-b" else "C-q";
in
{
  options.hm.tmux.enable = lib.mkEnableOption "tmux config";

  config = lib.mkIf config.hm.tmux.enable {
    programs.tmux = {
      enable = true;
      extraConfig = ''
        set-option -g prefix ${prefix}
        unbind-key ${otherPrefix}
        bind-key ${prefix} send-prefix

        # Use Vi-mode for copy navigation
        setw -g mode-keys vi
        set -g mouse on

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
