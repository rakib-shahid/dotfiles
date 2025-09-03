-- global keymaps

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", opts)
map("n", ".", ";", opts)

-- nvim-tree toggle on ctrl+n
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- quick saves and quits
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- lazy sync
map("n", "<leader>ps", ":Lazy sync<CR>", opts)

-- buffer navigation
map("n", "<leader>x", ":bd!<CR>", opts)
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
