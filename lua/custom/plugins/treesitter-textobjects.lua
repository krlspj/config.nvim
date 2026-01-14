return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'go' }, -- Ensures Go parser is installed (auto_install is already true in main config)
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- Adds to jumplist for Ctrl+O to jump back
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[m'] = '@function.outer', -- Optional: Alias to match Vim's [m for methods
          },
          goto_next_start = {
            [']f'] = '@function.outer',
            [']m'] = '@function.outer',
          },
        },
      },
    }
  end,
}
