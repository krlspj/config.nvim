local isActive = false
if not isActive then
	return {}
end

print("Sidekick enabled")
return {
	-- ============================================================
	-- GitHub Copilot LSP (REQUIRED for NES)
	-- ============================================================
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false }, -- Must be false for LSP mode
				panel = { enabled = false },
				filetypes = {
					yaml = true,
					markdown = true,
					help = false,
					gitcommit = true,
					gitrebase = false,
					["*"] = true,
				},
			})
		end,
	},

	-- REQUIRED: The actual LSP - must load BEFORE your main LSP setup
	{
		"copilotlsp-nvim/copilot-lsp",
		dependencies = { "zbirenbaum/copilot.lua" },
		-- Don't lazy load - must be available during LSP setup
		lazy = false,
		priority = 999, -- Load early
	},

	-- ============================================================
	-- Sidekick (NES + CLI Integration)
	-- ============================================================
	{
		"folke/sidekick.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"zbirenbaum/copilot.lua",
			"copilotlsp-nvim/copilot-lsp",
		},
		opts = {
			nes = {
				enabled = true,
				debounce = 120,
				diff = { inline = "words" },
			},
			copilot = {
				status = {
					enabled = true,
					level = vim.log.levels.WARN,
				},
			},
			cli = {
				watch = true,
				mux = {
					enabled = true,
					backend = vim.env.ZELLIJ and "zellij" or "tmux",
				},
			},
		},
		keys = {
			{
				"<Tab>",
				function()
					if require("sidekick").nes_jump_or_apply() then
						return ""
					end
					if vim.lsp.inline_completion.get() then
						return ""
					end
					return "<Tab>"
				end,
				mode = "i",
				expr = true,
				desc = "NES / Copilot / Fallback",
			},
		},
	},
}
