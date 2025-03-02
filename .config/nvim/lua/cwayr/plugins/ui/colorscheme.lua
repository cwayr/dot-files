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
        overrides = function(colors)
          return {
            Normal = { bg = "#181820" } -- darker bg
          }
        end,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        terminalColors = true,
      })
      vim.cmd([[colorscheme kanagawa-paper]])
    end,
  },
}

-- return {
--   {
--     "dgox16/oldworld.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme oldworld]])
--     end,
--   },
-- }

-- return {
--   {
--     "ramojus/mellifluous.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme mellifluous]])
--     end,
--   },
-- }

-- return {
--   {
--     "kdheepak/monochrome.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme monochrome]])
--     end,
--   },
-- }

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
