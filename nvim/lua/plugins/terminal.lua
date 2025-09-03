return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { { "<A-h>", desc = "toggle terminal" } },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<A-h>]],   -- alt+h to toggle
      direction = "horizontal",   -- change to "float" if you prefer
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = false,      -- hides instead of killing shell
    })

    -- better window nav from terminal too
    local map, opts = vim.keymap.set, { noremap = true, silent = true }
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
}

