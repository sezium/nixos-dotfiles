{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;

    historyLimit = 1000;
    keyMode = "vi";
    terminal = "xterm-256color";

    extraConfig = ''
      unbind C-b

      # default shell 
      set -g default-command ${pkgs.zsh}/bin/zsh


      # required by yazi to work properly
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      set -s escape-time 0
      set -as terminal-features ",kitty*:RGB"

      set -g @resurrect-dir '~/.tmux/resurrect'
      set -g @continuum-restore 'on'

      bind -n M-z select-window -t 1
      bind -n M-x select-window -t 2
      bind -n M-c select-window -t 3
      bind -n M-v select-window -t 4
      bind -n M-b select-window -t 5
      bind -n M-n select-window -t 6
      bind -n M-m select-window -t 7

      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5
      bind -n M-k resize-pane -U 3
      bind -n M-j resize-pane -D 3

      bind -n M-H split-window -v -c "#{pane_current_path}"
      bind -n M-V split-window -h -c "#{pane_current_path}"

      bind -n M-t new-window

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      bind -n M-q kill-pane
      bind -n M-Q kill-window
      bind -n M-s kill-session
      '';

    plugins = with pkgs;
    [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank # Copy to system clipboard
      tmuxPlugins.gruvbox # -- 
      tmuxPlugins.better-mouse-mode # Mouse support
      tmuxPlugins.tmux-fzf
      tmuxPlugins.copycat


      tmuxPlugins.resurrect
      tmuxPlugins.continuum
    ];
  };
}
