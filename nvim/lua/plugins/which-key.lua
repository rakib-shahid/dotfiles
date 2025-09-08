return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = function(ctx)
			return ctx.plugin and 0 or 150
		end,

		win = {
			border = "rounded",
			padding = { 1, 2 },
			zindex = 1000,
			wo = { winblend = 10 },
			no_overlap = true,
			title = true,
			title_pos = "center",
		},

		layout = {
			width = { min = 22 },
			spacing = 6,
		},

		plugins = {
			spelling = { enabled = true, suggestions = 10 },
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
			marks = true,
			registers = true,
		},

		-- expand groups automatically when they are small
		expand = 8,

		-- a little quieter
		notify = false,
		show_help = true,
		show_keys = true,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function(_, opts)
		require("which-key").setup(opts)

		-- group names for a clean menu
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "+file" },
			{ "<leader>g", group = "+git" },
			{ "<leader>l", group = "+lsp" },
			{ "<leader>t", group = "+test/term" },
			{ "<leader>w", group = "+windows" },
			{ "<leader>b", group = "+buffers" },
			{ "<leader>s", group = "+search" },
			{ "<leader>c", group = "+code" },
			{ "<leader>q", group = "+session" },
		})
	end,
}
