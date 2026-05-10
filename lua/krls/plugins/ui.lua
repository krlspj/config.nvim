local function gh(repo) return 'https://github.com/' .. repo end

-- guess-indent
vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

-- nvim-web-devicons
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

-- gitsigns
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- which-key
vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
    { "<leader>f", group = "File directory" },
    { "<leader>fg", desc = "Live grep in file directory" },
    { "<leader>ff", desc = "Find files in file directory" },
    { "<leader>fw", desc = "Find Word in directory (grep_string)" },
    { "[f", desc = "Previous function start" },
    { "]f", desc = "Next function start" },
    { "<leader>c", group = "Code" },
    { "<leader>sp", desc = "[S]how file directory [P]ath" },
  },
}

-- tokyonight
vim.pack.add { gh 'folke/tokyonight.nvim' }
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}

-- todo-comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

-- mini.nvim
vim.pack.add { gh 'nvim-mini/mini.nvim' }
require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}
require('mini.surround').setup()
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
statusline.section_location = function() return '%2l:%-2v' end
