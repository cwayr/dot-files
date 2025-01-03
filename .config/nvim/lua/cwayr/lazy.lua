local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "cwayr.plugins" }, { import = "cwayr.plugins.lsp" } }, {
  install = {
    colorscheme = { "rose-pine" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})


-- plugin save:
--
-- return {
--     "folke/noice.nvim",
--     event = "VeryLazy",
--     opts = {
--         lsp = {
--             -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--             override = {
--                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--                 ["vim.lsp.util.stylize_markdown"] = true,
--                 ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--             },
--         },
--         presets = {
--             bottom_search = true, -- use a classic bottom cmdline for search
--             command_palette = true, -- position the cmdline and popupmenu together
--             long_message_to_split = true, -- long messages will be sent to a split
--             inc_rename = false, -- enables an input dialog for inc-rename.nvim
--             lsp_doc_border = false, -- add a border to hover docs and signature help
--         },
--     },
--     dependencies = {
--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--         "MunifTanjim/nui.nvim",
--         {
--             "rcarriga/nvim-notify",
--             config = function ()
--                 require("notify").setup({
--                     timeout = 1000,
--                     render = "wrapped-compact",
--                     animation = "fade",
--                     fps = 40,
--                     max_width = 40,
--                     background_colour = "#000000",
--                 })
--             end
--         }
--     }
-- }
