if status is-interactive
# Commands to run in interactive sessions can go here
    oh-my-posh init fish --config ~/.config/ohmyposh/ohmyposh.toml | source
    fzf --fish | source

    # -a = --add
    abbr -a nv nvim

    abbr -a gs "git status"
    abbr -a gco "git checkout"
    abbr -a ga "git add"
    abbr -a gc "git commit"
    abbr -a gd "git diff"
    
    # -x = --export
    set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --strip-cwd-prefix --exclude .git"
    set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -x FZF_ALT_C_COMMAND "fd --type d --hidden --strip-cwd-prefix --exclude .git"
    set -x FZF_DEFAULT_OPTS "--popup center,70%,70% \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi" 
    
    #NOTE: fuzzy completion nvim**, cd**, ssh** is activated using SHIFT+TAB in Fish

    set -x FZF_CTRL_T_OPTS " --style default \
  --walker-skip .git,node_modules,target\
  --preview 'bat -n --color=always {}' \
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

    # Set date/time as default prefix in history search
    set -gx FZF_CTRL_R_OPTS "--with-nth 1,3.. --bind 'alt-t:change-with-nth(2..|3..|1,3..)'"
    set -x FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

    alias ll="eza --long --icons=always --smart-group --git -a --extended"
    alias ls="eza --long --icons=always --no-filesize --no-user --git --no-time --no-permissions"
    set -x EZA_CONFIG_DIR $HOME/.config/eza/catppuccin-mocha.yml
    set -x LS_COLORS "$(vivid generate catppuccin-mocha)"

    zoxide init fish | source
    alias cd="z"

    # has an error
    # ~/.local/try.rb init ~/Work/tries | source

    set -x BAT_THEME "Catppuccin Mocha"
    abbr -a --position anywhere -- --help '--help | bat -plhelp --no-paging'
    abbr -a --position anywhere -- -h '-h | bat -plhelp --no-paging'
    # in the case where -h is not a shorthand of --help, it can be escaped \-h (like with ls) or it is possible Fish CTRL+Space binding to insert a space without expanding the abbreviation
    
    function batcp -d "Pipe bat output to clipboard (wl-copy)"
        if test $XDG_BACKEND = wayland
            bat $argv | wl-copy
        else if test $XDG_BACKEND = x11
            bat $argv | xclip
        end
    end
end
