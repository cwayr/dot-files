return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "markdown",
          "query",
          "json",
          "html",
          "yaml",
          "bash",
          "css",
          "lua",
          "vim",
          "tsx",
          "zig",
          "c"
        },
      })
    end,
  },
}
