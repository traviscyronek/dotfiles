local wezterm = require('wezterm')
local config = wezterm.config_builder()
local canonical_solarized = require('canonical_solarized')
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")


config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '-l' }


config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 12


canonical_solarized.apply_to_config(config)
config.color_scheme = 'Canonical Solarized Dark'


config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true


tabline.setup({
  options = {
    icons_enabled = true,
    --theme = 'Solarized (dark) (terminal.sexy)',
    theme = 'Solarized Dark (Gogh)',
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { '' },
    tabline_y = { 'datetime' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})
tabline.apply_to_config(config)
config.window_decorations = "TITLE | RESIZE"


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
    -- create a new tab
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
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
