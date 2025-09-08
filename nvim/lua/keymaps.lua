-- global keymaps

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", opts)

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
-- map("n", "<leader>x", ":bd!<CR>", opts)
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

map("n", "<leader>cc", ":CopilotChatToggle<CR>", opts)
-- normal mode maps
map("n", "<leader>ce", ":CopilotChatExplain<CR>", opts)
map("n", "<leader>cr", ":CopilotChatReview<CR>", opts)
map("n", "<leader>cf", ":CopilotChatFix<CR>", opts)
map("n", "<leader>cd", ":CopilotChatDocs<CR>", opts)
map("n", "<leader>ct", ":CopilotChatTests<CR>", opts)
map("n", "<leader>cm", ":CopilotChatCommit<CR>", opts)
-- visual mode
map("v", "<leader>ce", ":CopilotChatExplain #selection<CR>", opts)
map("v", "<leader>cr", ":CopilotChatReview #selection<CR>", opts)
map("v", "<leader>cf", ":CopilotChatFix #selection<CR>", opts)
map("v", "<leader>cd", ":CopilotChatDocs #selection<CR>", opts)
map("v", "<leader>ct", ":CopilotChatTests #selection<CR>", opts)
map("v", "<leader>cc", ":CopilotChatCommit #selection<CR>", opts)
