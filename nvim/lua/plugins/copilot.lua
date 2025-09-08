return {
	{
		-- Copilot suggestions
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = {
			panel = {
				auto_refresh = false,
				keymap = {
					accept = "<CR>",
					jump_prev = "[[",
					jump_next = "]]",
					refresh = "gr",
					open = "<M-CR>",
				},
			},
			suggestion = {
				auto_trigger = false,
				keymap = {
					accept = "<M-l>",
					prev = "<M-[>",
					next = "<M-]>",
					dismiss = "<C-]>",
				},
			},
		},
	},
	-- Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = master },
		},
		-- build = "make tiktoken",
		opts = {
			model = "gpt-4.1",
			resources = {
				"buffer",
			},
			temperature = 0.1,
			auto_insert_mode = true,
			window = {
				border = "rounded",
				width = 0.5,
				layout = "float",
				title = "Copilot Chat",
				zindex = 1,
			},
			headers = {
				user = "User",
				assistant = "Copilot",
				tool = "Tool",
			},
			separator = "---",
			auto_fold = true,
		},
	},
	-- Copilot Autocompletion
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("copilot_cmp").setup({
				formatters = {
					insert_text = require("copilot_cmp.format").format_insert_text,
				},
			})
		end,
	},
}
