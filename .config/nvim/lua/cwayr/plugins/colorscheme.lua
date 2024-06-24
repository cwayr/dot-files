return {
    {
        "rose-pine/neovim",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                styles = {
                    bold = false,
                    italic = false,
                    transparency = true
                },
                highlight_groups = {
                    TelescopeBorder = { fg = "overlay", bg = "overlay" },
                    TelescopeNormal = { fg = "subtle", bg = "overlay" },
                    TelescopeSelection = { fg = "text", bg = "highlight_med" },
                    TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

                    TelescopeTitle = { fg = "base", bg = "love" },
                    TelescopePromptTitle = { fg = "base", bg = "pine" },
                    TelescopePreviewTitle = { fg = "base", bg = "iris" },

                    TelescopePromptNormal = { fg = "text", bg = "surface" },
                    TelescopePromptBorder = { fg = "surface", bg = "surface" },
                },
            })
            vim.cmd([[colorscheme rose-pine]])
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

-- return {
--     {
--         "Yazeed1s/minimal.nvim",
--         priority = 1000,
--         config = function()
--             vim.cmd([[colorscheme minimal]])
--         end,
--     },
-- }

-- return {
--     {
--         "sho-87/kanagawa-paper.nvim",
--         priority = 1000,
--         config = function()
--             vim.cmd([[colorscheme kanagawa-paper]])
--         end,
--     },
-- }
