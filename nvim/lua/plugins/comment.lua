return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("Comment").setup()
		-- keymaps
		local map, opts = vim.keymap.set, { noremap = true, silent = true }
		-- toggle comment for current line
		map("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.current()
		end, opts)
		-- toggle comment for selection
		map("v", "<leader>/", function()
			-- use ESC to make sure we leave visual mode first
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, opts)
	end,
}
