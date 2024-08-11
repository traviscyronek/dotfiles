local wezterm = require('wezterm')
local config = wezterm.config_builder()
local canonical_solarized = require('canonical_solarized')


config.default_prog = { 'C:/Users/Travis/scoop/apps/git/current/bin/bash.exe', '-l' }


config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 12


canonical_solarized.apply_to_config(config)
config.color_scheme = 'Canonical Solarized Dark'


config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true


config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
    -- open new panes with "leader |" or "leader _"
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '_',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- close pane with "leader q"
    {
        key = 'q',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- move focus to pane with "leader (hjkl)"
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left' ,
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down' ,
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up' ,
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right' ,
    },
    -- resend leader when leader is active
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
}


return config
