{pkgs, ... }:
{  
    home.sessionPath = [
        "$HOME/develop/flutter/bin"
    ];



    programs.zsh = {
        enable = true;
        enableCompletion = true;

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        history.size = 10000;
        history.path = "$HOME/.zshhistory";

        shellAliases = {

            yz = "yazi";
            vif = "~/scripts/vif.sh";
            zvif = "~/scripts/zvif.sh";
            vig = "~/scripts/vig.sh";

            se = "sudoedit";

            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";

            cp = "cp -v";
            rm = "rm -v";

        };

        initContent = ''

# enable vi mode 
            bindkey -v

# Bind Ctrl + P to previous history search
            bindkey '^P' history-search-backward

# Bind Ctrl + N to next history search
            bindkey '^N' history-search-forward

# Bind Ctrl + Backspace to remove the last word
            bindkey '^H' backward-kill-word

# autocomplete with shift + tab
            bindkey '^[[Z' vi-forward-char
# move it into tmux



###########################################
# UNBIND THESE KEYS IN CONFLICT WITH TMUX # 
########################################### 

# Unbind Ctrl+Shift+H (backward-delete-char)

# bindkey -r '\e[1;6H'

# Unbind Ctrl+Shift+L (clear-screen)
# bindkey -r '\e[1;6L'

# Unbind Ctrl+Shift+J (down-arrow search or custom binding)
# bindkey -r '\e[1;6J'

# Unbind Ctrl+Shift+L (again)
# bindkey -r '\e[1;6L'

            '';
    };
}
