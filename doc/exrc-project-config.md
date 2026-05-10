# Project-Local Neovim Configuration (EXRC)

Instead of polluting your global Neovim configuration (`krls/plugins/lsp.lua`) with project-specific settings (like Go build tags or custom Python interpreters), this Neovim setup is configured to use the native `exrc` feature (`vim.o.exrc = true`).

## How it works

When you launch Neovim in a project directory, it automatically looks for a file named `.nvim.lua` at the root of that workspace. If it finds one, it prompts you to "trust" it (for security) and then executes it. This allows you to augment your Neovim environment strictly for that specific project.

## Example: Configuring Go Build Tags (`gopls`)

If you are working on a Go project that requires specific build tags (e.g., `debug` and `auditlog`), create a `.nvim.lua` file at the root of your Go project repository with the following contents:

```lua
-- .nvim.lua
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      buildFlags = { "-tags=debug auditlog" }
    }
  }
})
```

### Security Note
The first time Neovim discovers a `.nvim.lua` file in a directory, it will display a warning prompt asking if you trust the file. This is a crucial built-in security measure to prevent arbitrary code execution from cloned repositories. 

Press `y` to trust it, and Neovim will securely store the hash of that file so it won't ask you again unless the file contents change.
