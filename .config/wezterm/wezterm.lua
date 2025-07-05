-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font'
config.use_fancy_tab_bar = false

config.default_prog = { 'C:/Windows/System32/wsl.exe' }

config.launch_menu = {
  {
    label = 'WSL',
    args = { 'C:/Windows/System32/wsl.exe' }
  },
  {
    label = 'Git Bash',
    args = { 'C:/Program Files/Git/usr/bin/bash.exe', '-i', '-l' }
  },
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'PowerShell',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' },

    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
}

config.keys = {
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

-- Finally, return the configuration to wezterm:
return config
