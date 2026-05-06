return {
  { "NMAC427/guess-indent.nvim" },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
    end,
  },
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end,
  },
  { "lewis6991/gitsigns.nvim" },
}
