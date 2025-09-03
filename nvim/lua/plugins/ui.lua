return {
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- buffer tabs (tabline)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_close_icon = false,
          always_show_bufferline = true,
          offsets = { { filetype = "NvimTree", text = "Explorer", separator = true } },
        },
      })
      local map, opts = vim.keymap.set, { noremap = true, silent = true }
      map("n", "<S-l>", ":bnext<CR>", opts)
      map("n", "<S-h>", ":bprevious<CR>", opts)
      map("n", "<leader>x", ":bd<CR>", opts) -- close current buffer
    end,
  },

  -- statusline (optional but nice)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({ options = { theme = "tokyonight" } })
    end,
  },
}

