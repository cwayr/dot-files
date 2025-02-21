return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local keymap = vim.keymap

		telescope.load_extension("fzf")

    telescope.setup({
      extensions = {
        fzf = {}
      },
      defaults = {
        path_display = { "truncate" },
        layout_strategy = "vertical",
        layout_config = {
          width = 0.7,
          height = 0.95,
          preview_height = 0.6
        },
        file_ignore_patterns = { ".git/" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=false<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "View keymaps" })
    keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current buffer search" })
    keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commit history" })
    keymap.set("n", "<leader>fj", "<cmd>Telescope command_history<cr>", { desc = "NVIM command history" })
  end,
}
