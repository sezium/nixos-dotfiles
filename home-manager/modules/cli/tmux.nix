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

      # split (spostati da M-H/M-V perche' ora usati per lo swap)
      bind -n M-s split-window -v -c "#{pane_current_path}"
      bind -n M-a split-window -h -c "#{pane_current_path}"
      bind -n M-t new-window

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      bind -n M-q kill-pane
      bind -n M-Q kill-window
      # NOTA: kill-session era su M-s, ora libero perche' M-s e' split-window.
      # Scegli un altro tasto, es. M-Q maiuscolo e' gia' preso da kill-window.
      # bind -n M-? kill-session

      # Alt+Shift+hjkl: scambia il pane attivo con quello adiacente nella direzione
      bind -n M-H swap-pane -t '{left-of}'
      bind -n M-J swap-pane -t '{down-of}'
      bind -n M-K swap-pane -t '{up-of}'
      bind -n M-L swap-pane -t '{right-of}'

      # Ctrl+hjkl: gestito automaticamente da tmuxPlugins.vim-tmux-navigator
      # (non ridefinire qui C-h/j/k/l, altrimenti si sovrascrivono i bind del plugin,
      # che ha gia' una regex piu' completa: supporta fzf, nvim con wrapper, ecc.)
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
