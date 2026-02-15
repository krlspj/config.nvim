return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		-- New standalone setup - no longer uses nvim-treesitter.configs!
		require("nvim-treesitter-textobjects").setup({
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]m"] = "@function.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[m"] = "@function.outer",
				},
			},
		})
	end,
}
