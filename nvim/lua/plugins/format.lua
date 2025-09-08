return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				notify_on_error = false,
				format_on_save = function(_)
					return { timeout_ms = 1500, lsp_fallback = true }
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					java = { "google-java-format" },
				},
			})
		end,
	},

	-- ensure external formatters get installed automatically
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"isort",
					"black",
					"prettier",
					"clang-format",
					"rustfmt",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
