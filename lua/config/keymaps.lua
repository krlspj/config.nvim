vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Custom keymaps
vim.keymap.set("n", "<leader>vd", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "[V]iew [D]iagnostic" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Search in current file's directory
vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.expand("%:p:h"),
  })
end, { desc = "Live grep in file directory" })

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("%:p:h"),
  })
end, { desc = "Find files in file directory" })

vim.keymap.set("n", "<leader>sp", function()
  print("File directory: " .. vim.fn.expand("%:p:h"))
end, { desc = "Show file directory path" })

vim.keymap.set("n", "<leader>fr", function()
  require("telescope.builtin").lsp_references({})
end, { desc = "Find references to this function" })

vim.keymap.set("n", "[[", function()
  vim.fn.search([[\v^func]], "bW")
end, { silent = true })

vim.keymap.set("n", "]]", function()
  vim.fn.search([[\v^func]], "W")
end, { silent = true })
