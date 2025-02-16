-- return {
--     {
--         "rose-pine/neovim",
--         priority = 1000,
--         config = function()
--             require("rose-pine").setup({
--                 styles = {
--                     bold = false,
--                     italic = false,
--                     transparency = true
--                 },
--                 highlight_groups = {
--                     TelescopeBorder = { fg = "overlay", bg = "overlay" },
--                     TelescopeNormal = { fg = "subtle", bg = "overlay" },
--                     TelescopeSelection = { fg = "text", bg = "highlight_med" },
--                     TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
--                     TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
-- 
--                     TelescopeTitle = { fg = "base", bg = "love" },
--                     TelescopePromptTitle = { fg = "base", bg = "pine" },
--                     TelescopePreviewTitle = { fg = "base", bg = "iris" },
-- 
--                     TelescopePromptNormal = { fg = "text", bg = "surface" },
--                     TelescopePromptBorder = { fg = "surface", bg = "surface" },
--                 },
--             })
--             vim.cmd([[colorscheme rose-pine]])
--         end,
--     },
-- }

return {
  {
    "sho-87/kanagawa-paper.nvim",
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        terminalColors = true,
        -- overrides = function(colors)
        --   local theme = colors.theme
        --   return {
        --     TelescopeTitle = { fg = theme.ui.special, bold = true },
        --     TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        --     TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        --     TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        --     TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        --     TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        --     TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        --     Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        --     PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        --     PmenuSbar = { bg = theme.ui.bg_m1 },
        --     PmenuThumb = { bg = theme.ui.bg_p2 },
        --   }
        -- end,
      })
      vim.cmd([[colorscheme kanagawa-paper]])
    end,
  },
}

-- return {
--     {
--         "alexvzyl/nordic.nvim",
--         priority = 1000,
--         config = function()
--             vim.cmd([[colorscheme nordic]])
--         end,
--     },
-- }

-- return {
--     {
--         "mellow-theme/mellow.nvim",
--         priority = 1000,
--         config = function()
--             vim.cmd([[colorscheme mellow]])
--         end
--     }
-- }
