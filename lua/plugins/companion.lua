local isActive = false

if isActive then
  return {
    {
      'olimorris/codecompanion.nvim',
      -- tag to avoid breaking changes
      -- tag = 'v17.33.0',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
      opts = {
        -- NOTE: The log_level is in `opts.opts`
        opts = {
          log_level = 'DEBUG', -- or "TRACE"
        },
      },
    },
  }
else
  return {}
end
