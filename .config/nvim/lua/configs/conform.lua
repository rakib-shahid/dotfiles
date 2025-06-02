local options = {
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },

    c = { "clang_format" },
    cpp = { "clang_format" },
    python = { "black" },
    java = { "google_java_format" },
  },
}

return options
