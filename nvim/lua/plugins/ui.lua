return {
	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					bufferline = true,
					lualine = true,
					treesitter = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					which_key = true,
					notify = true,
					mini = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- buffer tabs (tabline)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			local catppuccin_ok, catppuccin_bl = pcall(function()
				return require("catppuccin.groups.integrations.bufferline").get()
			end)

			require("bufferline").setup({
				highlights = catppuccin_ok and catppuccin_bl or nil,
				options = {
					diagnostics = "nvim_lsp",
					show_close_icon = false,
					always_show_bufferline = true,
					offsets = { { filetype = "NvimTree", text = "Explorer", separator = true } },
				},
			})

			local function smart_close()
				local listed = vim.tbl_filter(function(b)
					return vim.api.nvim_get_option_value("buflisted", { buf = b })
				end, vim.api.nvim_list_bufs())
				if #listed > 1 then
					vim.cmd("bp | bd #")
				else
					vim.cmd("enew | bd #")
				end
			end

			local map, opts = vim.keymap.set, { noremap = true, silent = true }
			map("n", "<S-l>", "<cmd>bnext<CR>", opts)
			map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
			map("n", "<leader>x", smart_close, opts)
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					section_separators = "",
					component_separators = "",
					globalstatus = true,
				},
			})
		end,
	},
}
