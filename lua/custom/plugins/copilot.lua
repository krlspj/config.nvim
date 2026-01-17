local enabled = (vim.env.AI_COPILOT == "true")
enabled = true

if not enabled then
	return {}
end
print("Copilot is enabled")
return {
	-- INFO: review integration with copilot-lsp NES (next edit suggestion)
	--{
	--	"zbirenbaum/copilot.lua",
	--	dependencies = {
	--		{
	--			"copilotlsp-nvim/copilot-lsp",
	--			config = function()
	--				vim.g.copilot_nes_debounce = 1000
	--			end,
	--		},
	--	},
	--	cmd = "Copilot",

	--	-- It's often better to load on InsertEnter or VeryLazy for NES
	--	event = "InsertEnter",
	--	config = function()
	--		require("copilot").setup({
	--			-- Ensure suggestion and panel are disabled if you ONLY want NES
	--			-- as they can sometimes conflict visually
	--			suggestion = { enabled = false },
	--			panel = { enabled = false },
	--			nes = {
	--				enabled = true,
	--				keymap = {
	--					accept_and_goto = "<leader>p",
	--					accept = false,
	--					dismiss = "<Esc>",
	--				},
	--			},
	--		})
	--	end,
	--},
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			{
				"copilotlsp-nvim/copilot-lsp",
				config = function()
					vim.g.copilot_nes_debounce = 1000
				end,
			},
		},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				--nes = {
				--	enabled = true,
				--	keymap = {
				--		accept_and_goto = "<leader>p",
				--		accept = false,
				--		dismiss = "<Esc>",
				--	},
				--},
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = { position = "bottom", ratio = 0.4 },
				},
				suggestion = {
					enabled = true,
					auto_trigger = true, -- Shows ghost text automatically
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						-- We map these here so they don't conflict with blink.cmp
						accept = "<M-l>", -- Use Alt+l to accept
						next = "<M-]>", -- Use Alt+] for next suggestion
						prev = "<M-[>", -- Use Alt+[ for prev suggestion
						dismiss = "<C-]>",
					},
				},
			})

			-- If wanna use Tab, then check if a suggestion is visible
			vim.keymap.set("i", "<Tab>", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, { desc = "Copilot Accept (Tab)" })

			-- IMPORTANT: Fix for blink.cmp or nvim-cmp users
			-- This ensures Copilot ghost text isn't hidden by your completion menu
			vim.g.copilot_suggestion_hidden = false
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup({})

			-- Keymaps
			vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatOpen<CR>", { desc = "CopilotChat - Open" })
			vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatToggle<CR>", { desc = "CopilotChat - Toggle" })
			vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatModels<CR>", { desc = "CopilotChat - Models" })
		end,
	},
}
