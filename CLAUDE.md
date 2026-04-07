# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal macOS dotfiles. There is no build system, test suite, or install script — changes are applied by symlinking or copying files to their expected locations under `~/.config/` or `~/`.

## Neovim Config Architecture

The Neovim config is a mix of Vimscript and Lua. Entry point is `nvim/init.vim`, which sources two Vimscript files and then delegates plugin setup to Lua modules:

- `init.vim` — core vim options
- `config.vim` — keybindings and custom functions (all in Vimscript)
- `plugins.vim` — vim-plug declarations + onedark/auto-dark-mode setup inline; at the bottom it `require`s each Lua config module
- `lua/*_cfg.lua` — one file per plugin (lsp, completion, telescope, treesitter, gitsigns, nvim-tree, lualine, which-key)

**LSP setup quirk**: `lsp_cfg.lua` only sets keybindings and autocommands. The actual `vim.lsp.enable(...)` call and all `vim.lsp.config(...)` overrides live in `completion_cfg.lua` (co-located with cmp capabilities setup). When adding or removing language servers, edit `completion_cfg.lua`.

**Delete bindings**: All `d`/`c` operations in `config.vim` are remapped to the blackhole register (`"_`) — nothing ever goes to the clipboard from a delete. Only explicit yanks (`y`) write to the system clipboard.

**VSCode mode**: `plugins.vim` checks `g:vscode` and loads only `vim-commentary` + `vim-surround` in that context, skipping all other plugins.

## Key Files Per Tool

| Tool | Config location |
|------|----------------|
| Neovim | `nvim/init.vim`, `nvim/config.vim`, `nvim/plugins.vim`, `nvim/lua/` |
| Tmux | `tmux/.tmux.conf` |
| Zsh | `zsh/.zshrc` |
| Starship | `starship/starship.toml` |
| Karabiner | `karabiner/karabiner.json` |
| iTerm2 | `iTerm2/Profiles.json` |
| Git | `git/.gitconfig` |
| Environment/PATH | `profile/.profile` |
| Scripts | `scripts/` |

## Neovim Plugin Management

vim-plug is used. `plug.vim` is committed directly at `nvim/autoload/plug.vim` (no download needed). To add a plugin: add a `Plug` line in `plugins.vim`, create a `lua/<name>_cfg.lua` if needed, and call `require` it at the bottom of `plugins.vim`. Run `:PlugInstall` inside Neovim to install.

## Theme Sync

OneDark is the colorscheme across all tools. In Neovim, `auto-dark-mode.nvim` calls `setup('dark')` or `setup('light')` based on the macOS system appearance — no external script involved. Tmux reads the macOS dark mode state directly in its status-bar format string at each refresh interval.
