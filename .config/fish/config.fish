# File:   config.fish
# Author: Travis Cyronek

# enable vi-like keybindings, and disable the (ugly) vim-mode prompt
#fish_vi_key_bindings
#function fish_mode_prompt
#end

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias r="/Library/Frameworks/R.framework/Resources/bin/R"

# paths
set PATH $PATH "/Applications/Julia-1.3.app/Contents/Resources/julia/bin"
set PATH $PATH "/Applications/Stata/StataSE.app/Contents/MacOS"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
