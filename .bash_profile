# File:    .bash_profile
# Author:  Travis Cyronek
# Date:    5 April 2020


# dotfiles (use "dotfiles" instead of "git" for dotfile management)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Julia (type "julia")
export PATH="/Applications/Julia-1.3.app/Contents/Resources/julia/bin:$PATH"

# R (type "R")
alias R="/Library/Frameworks/R.framework/Resources/bin/R"

# Stata (type "statase")
export PATH="/Applications/Stata/StataSE.app/Contents/MacOS:$PATH"

# Python
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/traviscyronek/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/traviscyronek/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/traviscyronek/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/traviscyronek/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
