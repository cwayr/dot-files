local wezterm = require('wezterm')
local action = wezterm.action

local config = {
    -- disable_default_key_bindings = true,
    automatically_reload_config = true,
    front_end = 'WebGpu',
    enable_scroll_bar = false,
    default_cursor_style = 'BlinkingBar',

    -------- text --------
    font = wezterm.font_with_fallback({ 'BerkeleyMono Nerd Font' }),
    font_size = 12,
    line_height = 1.2,

    -------- colors --------
    color_scheme = 'rose-pine',

    -------- window --------
    window_decorations = 'RESIZE',
    initial_cols = 100,
    initial_rows = 30,
    window_padding = {
        left = 25,
        right = 25,
        top = 25,
        bottom = 10,
    },

    -------- tab bar --------
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = true,

    -------- keymaps --------
    keys = {
        -- Add and remove panes
        { key = '|', mods = 'CTRL|SHIFT', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '_', mods = 'CTRL|SHIFT', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'w', mods = 'CTRL', action = action.CloseCurrentPane { confirm = false } },

        -- Navigate panes
        { key = 'h', mods = 'CTRL|SHIFT', action = action.ActivatePaneDirection 'Left' },
        { key = 'l', mods = 'CTRL|SHIFT', action = action.ActivatePaneDirection 'Right' },
        { key = 'k', mods = 'CTRL|SHIFT', action = action.ActivatePaneDirection 'Up' },
        { key = 'j', mods = 'CTRL|SHIFT', action = action.ActivatePaneDirection 'Down' },

        -- Resize panes
        { key = 'h', mods = 'CTRL|SHIFT|ALT', action = action.AdjustPaneSize { 'Left', 5 } },
        { key = 'l', mods = 'CTRL|SHIFT|ALT', action = action.AdjustPaneSize { 'Right', 5 } },
        { key = 'k', mods = 'CTRL|SHIFT|ALT', action = action.AdjustPaneSize { 'Up', 5 } },
        { key = 'j', mods = 'CTRL|SHIFT|ALT', action = action.AdjustPaneSize { 'Down', 5 } },
        { key = 'z', mods = 'CTRL|SHIFT', action = action.TogglePaneZoomState }, -- Maximize

        -- Create and switch tabs
        { key = 't', mods = 'CTRL|SHIFT', action = action.SpawnTab 'DefaultDomain' },
        { key = 'Tab', mods = 'CTRL', action = action.ActivateTabRelative(1) },
        { key = 'Tab', mods = 'CTRL|SHIFT', action = action.ActivateTabRelative(-1) },

        -- Workspaces
        {
            key = 'n',
            mods = 'CTRL|SHIFT',
            action = action.PromptInputLine {
                description = wezterm.format {
                    { Attribute = { Intensity = 'Bold' } },
                    { Text = 'New workspace' }
                },
                action = wezterm.action_callback(function(window, pane, line)
                    if line then
                        window:perform_action(action.SwitchToWorkspace { name = line }, pane)
                    end
                end)
            }
        },
        {
            key = 'i',
            mods = 'CTRL|SHIFT',
            action = action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }
        },
        {
            key = '{',
            mods = 'CTRL|SHIFT',
            action = action.SwitchWorkspaceRelative(-1)
        },
        {
            key = '}',
            mods = 'CTRL|SHIFT',
            action = action.SwitchWorkspaceRelative(1)
        }
    }
}

return config
