return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap
        local harpoon = require("harpoon.ui")

        keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
        keymap.set("n", "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Toggle harpoon quick menu" })

        keymap.set("n", "<A-h>", function() harpoon.nav_file(2) end)
        keymap.set("n", "<A-g>", function() harpoon.nav_file(1) end)
        keymap.set("n", "<A-n>", function() harpoon.nav_file(3) end)
        keymap.set("n", "<A-m>", function() harpoon.nav_file(4) end)
    end,
}
