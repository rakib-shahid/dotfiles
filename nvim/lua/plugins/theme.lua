return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
				treesitter = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				which_key = true,
				bufferline = true,
				lualine = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
