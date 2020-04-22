function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color fe5a1d
    printf '%s' $USER
    set_color normal
    printf '@'

    set_color efd19f
    echo -n (prompt_hostname)
    set_color normal
    printf '('

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    printf ')$ '
end
