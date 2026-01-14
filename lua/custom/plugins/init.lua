-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--local foo = function()
--  print 'hello from autopairs'
--end
--foo()
return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'declancm/maximize.nvim',
    config = function()
      -- Initialize the plugin
      require('maximize').setup()

      -- Now set the keymap after the plugin is initialized
      vim.keymap.set('n', '<leader>mm', ':Maximize<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {},
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'morhetz/gruvbox',
    priority = 1000,
    config = function() end,
  },
  {
    'Mofiqul/dracula.nvim',
    config = function()
      local dracula = require 'dracula'
      dracula.setup {
        --variant = "soft",
        colors = {
          bg = '#1F1F1F',
        },
        overrides = {
          CursorLine = { bg = '#2a2a2a' },
          SpecialChar = { fg = '#ff5555' },
          Special = { fg = '#09ff00', bold = false },
          -- SpecialChar = { fg = "#00ffee" },
        },
      }
    end,
  },
  -- 42 header --
  {
    'vinicius507/header42.nvim',
    config = function()
      local header = require 'header42'
      header.setup {
        login = 'cpujades',
        email = 'cpujades@student.42barcel',
      }
    end,
  },
}
