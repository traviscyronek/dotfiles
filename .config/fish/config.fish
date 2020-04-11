# enable vi-like keybindings, and disable the (ugly) vim-mode prompt
fish_vi_key_bindings

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias r="/Library/Frameworks/R.framework/Resources/bin/R"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
