vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- open Lazy.nvim
vim.keymap.set("n", "<leader>z", ':Lazy<CR>')
vim.keymap.set("v", "<leader>z", ':Lazy<CR>')

-- with lines highlighted, move around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append below line to end but retain cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumping but keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms will stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over content without losing paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
-- allows copies to go into the + register (system clipboard)
-- this needs a clipboard tool installed: sudo apt install xclip
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- deleting to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- makes ctrl-c the same as Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- block erroneous typing of "Q"
vim.keymap.set("n", "Q", "<nop>")

-- allow switching of projects
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- 
--vim.keymap.set("n", "<leader>f", function()
--    vim.lsp.buf.format()
--end)

-- quickfix navigation
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

-- start replacing word you're on
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- this will set execute bit
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true})

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
