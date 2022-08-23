local keymap = vim.keymap

-- Turn off highlight on double ESC
keymap.set("", "<esc><esc>", ":noh<return>")

-- Navigate in split view
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")
