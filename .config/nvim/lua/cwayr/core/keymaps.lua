vim.g.mapleader = " "
local keymap = vim.keymap

------------------- General -------------------

keymap.set("i", "jk", "<ESC>") -- jk to exit insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlight

keymap.set("n", "x", '"_x') -- delete single character without copying into register
keymap.set("n", "<leader>p", "\"_dP") -- delete text without overwriting copy buffer
keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]]) -- yank line to system clipboard
keymap.set({"n", "v"}, "<leader>p", [["+p]]) -- paste from system clipboard
keymap.set("n", "<leader>P", [["+P]]) -- paste before cursor from system clipboard

-- move lines of text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- code folding
keymap.set("n", "<leader>z", function()
    if vim.fn.foldclosed('.') ~= -1 then
        vim.cmd('normal! zv')
    else
        vim.cmd('normal! $zf%')
    end
end)

-- open netrw
keymap.set("n", "<leader>e", "<cmd>Ex<CR>")

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("v", "j", "jzz")
keymap.set("v", "k", "kzz")
keymap.set("n", "G", "Gzz")

------------------- Windows -------------------

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window
keymap.set("n", "<leader>sn", "<C-w>w") -- go to next split
keymap.set("n", "<leader>sp", "<C-w>W") -- go to previous split

------------------- Zellij collision remaps -------------------

-- by default, all zellij collisions will change ctrl -> ctrl+alt
-- additional plugin changes: harpoon

keymap.set("n", "<C-A-o>", "<C-o>", { noremap = true }) -- remap ctrl+o -> alt+o
keymap.set("n", "<C-o>", "<Nop>", { noremap = true }) -- unmap ctrl+o

keymap.set("n", "<C-A-t>", "<C-t>", { noremap = true }) -- remap ctrl+t -> alt+t
keymap.set("n", "<C-t>", "<Nop>", { noremap = true }) -- unmap ctrl+t
