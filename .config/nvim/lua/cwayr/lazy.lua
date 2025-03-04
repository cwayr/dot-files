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

require("lazy").setup({
    { import = "cwayr.plugins.lsp" },
    { import = "cwayr.plugins.git" },
    { import = "cwayr.plugins.ai" },
    { import = "cwayr.plugins.ui" },
    { import = "cwayr.plugins.nav" },
    { import = "cwayr.plugins.util" },
    -- { import = "cwayr.plugins.toggle" }
  },
  {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})
