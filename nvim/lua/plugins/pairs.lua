return {
	-- auto insert matching ) ] } ' " ` and handle deletions
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- smarter pairing with treesitter
				fast_wrap = {}, -- enables <M-e> to fast-wrap selection
			})

			-- integrate with nvim-cmp so confirmed completions add () for functions
			local ok_cmp, cmp = pcall(require, "cmp")
			if ok_cmp then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- auto-close and auto-rename html/tsx tags (optional, but handy)
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
