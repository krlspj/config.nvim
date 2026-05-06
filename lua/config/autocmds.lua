vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- treat tpp files as cpp
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tpp",
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})

vim.api.nvim_create_user_command("LGHere", function()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.expand("%:p:h"),
  })
end, {})
