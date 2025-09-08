require("config.lazy")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo" -- e.g. ~/.local/state/nvim/undo
vim.opt.undolevels = 10000 -- depth of the history
vim.opt.undoreload = 10000 -- lines to save for diff-based reloads

-- ensure directory exists
vim.fn.mkdir(vim.o.undodir, "p")

require("options")
require("keymaps")
