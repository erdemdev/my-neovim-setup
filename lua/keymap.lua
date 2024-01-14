-- Change leader key.
vim.g.mapleader = " "

-- Source current file.
-- vim.keymap.set("n", "<leader><leader>", function()
-- 	vim.cmd("so")
-- end)

-- Exit the insert mode.
vim.keymap.set("i", "jj", "<Esc>")

-- Break the line.
vim.keymap.set("n", "K", "a<CR><escape>k$")

-- Merge with the line below while keeping the cursor at the same position.
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen while jumping to the end of file when G pressed.
vim.keymap.set({ "n", "v" }, "G", "Gzz")

-- Move selected lines up and down in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen while jumping up and down.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen while scrolling found text.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without adding replaced text to the register.
vim.keymap.set("x", "p", [["_dP]])

-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<A-p>", '"*p')
vim.keymap.set("i", "<A-p>", '<esc>"*p')

-- Add selected text to the clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete wihout adding text to the register.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable quitting shortcut.
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix keymaps
-- vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- BUFFER REPLACEMENT
-- Replace hovered word.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Replace visual selection.
vim.keymap.set("v", "<leader>d", "y:<C-f>i%s/<esc>pa//gI<C-c><C-c>:<C-p><Left><Left><Left>")

-- TODO: Convert current file to an executable.
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

