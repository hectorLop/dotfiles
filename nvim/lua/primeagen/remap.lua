vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Very useful, move the selected code up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Moves the line below to the current line and separated by an space
vim.keymap.set("n", "J", "mzJ`z")

-- Paste selection without losing it
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy selection to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", function ()
   vim.lsp.buf.format()
end)

-- Search and replace the actual word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Escape from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Split windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Navigate buffers
vim.keymap.set("n", "+", ":bn<cr>")
vim.keymap.set("n", "_", ":bp<cr>")
vim.keymap.set("n", "bd", ":bd<cr>")


