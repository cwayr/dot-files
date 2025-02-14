local wezterm = require('wezterm')
local action = wezterm.action

-------- bottom right status --------

wezterm.on('update-right-status', function(window, pane)
    local cells = {}

    local workspace_name = window:active_workspace()
    table.insert(cells, { Background = { Color = '#393552' } })
    table.insert(cells, { Text = ' ' .. workspace_name .. ' ' })

    local cwd_uri = pane:get_current_working_dir()
    local path_parts = {}
    for part in string.gmatch(cwd_uri.file_path, "[^/]+") do
        table.insert(path_parts, part)
    end
    -- Remove the first two directories
    table.remove(path_parts, 1)
    table.remove(path_parts, 1)
    local new_path = '/' .. table.concat(path_parts, '/')

    table.insert(cells, { Background = { Color = '#1f1d2e' } })
    table.insert(cells, { Text = ' ' .. new_path .. ' ' })

    window:set_right_status(wezterm.format(cells))
end)

local function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

wezterm.on(
    'format-tab-title',
    function(tab)
        local title = tab_title(tab)
        if tab.is_active then
            return {
                { Background = { Color = '#393552' } },
                { Foreground = { Color = '#e0def4' } },
                { Text = ' ' .. title .. ' ' },
            }
        else -- inactive tab
            return {
                { Background = { Color = '#191724' } },
                { Foreground = { Color = '#6e6a86' } },
                { Text = ' ' .. title .. ' ' },
            }
        end
    end
)

local config = {
    -- disable_default_key_bindings = true,
    automatically_reload_config = true,
    front_end = 'WebGpu',
    enable_scroll_bar = false,
    default_cursor_style = 'BlinkingBar',
    warn_about_missing_glyphs = false,

    -------- text --------
    font = wezterm.font_with_fallback({ 'BerkeleyMono Nerd Font' }),
    adjust_window_size_when_changing_font_size = false,
    font_size = 12,
    line_height = 1.1,

    -------- colors --------
    color_scheme = 'rose-pine',

    -------- window --------
    window_decorations = 'RESIZE',
    window_background_opacity = 1.0,
    initial_cols = 100,
    initial_rows = 30,
    window_frame = {
        font = wezterm.font({ family = 'BerkeleyMono Nerd Font' }),
        active_titlebar_bg = '#191724',
        inactive_titlebar_bg = '#191724',
        font_size = 12.0,
        border_left_width = '44px',
        border_right_width = '44px',
    },
    window_padding = { left = 0, right = 0, top = 60, bottom = 0 },

    -------- tab bar --------
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
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
        { key = 't', mods = 'CTRL', action = action.SpawnTab 'DefaultDomain' },
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
