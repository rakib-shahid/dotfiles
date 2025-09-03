return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "bash", "python", "javascript", "typescript", "json", "yaml", "markdown", "html", "css", "cpp", "rust" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

