# NeoVim configuration

This project contain the configuration files for neovim.


## Set up

To set up the project just:

```shell
cd ~/.config
git clone git@github.com:turbod89/nvim-config.git nvim
```

Then its recommended to check if all system dependencies are ok by starting
neovim and running `:checkhealth`.

When all is okey, `:PlugInstall`

## Features

The following `Plug` has been added:

#### Git

  - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): Fugitive is the premier Vim plugin for Git.

  - [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb): If fugitive.vim is the Git, rhubarb.vim is the Hub.

#### LSP

  - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): A collection of common configurations for Neovim's built-in language server client.

  - [tami5/lspsaga.nvim](https://github.com/tami5/lspsaga.nvim): Lspsaga is light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.

#### Parsing & auto completion

  - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Tree-sitter is a parser generator tool and an incremental parsing library.

  - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip): Adds several lua snipets.

  - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim's built-in language server client.

  - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer): nvim-cmp source for buffer words.

  - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".

  - [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): This tiny plugin adds vscode-like pictograms to neovim built-in lsp.

  - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): A super powerful autopair plugin for Neovim that supports multiple characters.

  - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Use treesitter to autoclose and autorename html tag.


#### File system

  - [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree): The NERDTree is a file system explorer for the Vim editor.

#### View

  - [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons): Adds icons to the plugins.

  - [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim): Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.

  - [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim): Markdown preview on the browser.

#### Latex

  - [lervag/vimtex](https://github.com/lervag/vimtex) VimTeX is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.


## Dependencies

Some `npm` dependencies are:
  - `npm install -g typescript typescript-language-server`
  - `npm install -g neovim`
  - `npm i -g diagnostic-languageserver`

For C++:
  - Archlinux: `sudo pacman -S ccls` as stated [here](https://github.com/MaskRay/ccls/wiki/Build#arch-linux).

## Current Mappings


| Mode | Mapping | Description | File |
| --- | --- | --- | --- |
| | `<space>` | Leader | maps.vim |
| Normal | `<Esc>` | Turn terminal in normal mode | maps.vim |
| Normal | `Ctrl + {hjkl}` | Move between panels | maps.vim |
| Terminal | `Ctrl + {hjkl}` | Move between panels | maps.vim |
| Normal | `Ctrl + t` | Create new tab | maps.vim |
| Normal | `Ctrl + n` | Open bottom terminal | maps.vim |
| Normal | `Ctrl + ns` | Open vertical terminal | maps.vim |
| Normal | `Ctrl + nt` | Open terminal in a new tab | maps.vim |
| Normal | `Ctrl + a` | Select all | maps.vim |
| Visual | `*` | Search selected text backwards | maps.vim |
| Visual | `#` | Search selected text forwards | maps.vim |
| Normal | `Alt + {'[', ']'}` | Move to previous/next tab | maps.vim |
| Normal | `Alt + {'{', '}'}` | Move current tab to previous/next position | maps.vim |
|  | `Ctrl + d` | cmp.mapping.scroll_docks(-4) | after/plugin/cmp.rc.vim |
|  | `Ctrl + f` | cmp.mapping.scroll_docks(4) | after/plugin/cmp.rc.vim |
|  | `Ctrl + <space>` | cmp.mapping.complete(4) | after/plugin/cmp.rc.vim |
|  | `Ctrl + e` | cmp.mapping.close() | after/plugin/cmp.rc.vim |
|  | `<CR>` | cmp.mapping.confirm() | after/plugin/cmp.rc.vim |
| Normal | `gD` | vim.lsp.buf.declaration() | after/plugin/lspconfig.rc.vim |
| Normal | `gd` | vim.lsp.buf.definition() | after/plugin/lspconfig.rc.vim |
| Normal | `gi` | vim.lsp.buf.implementation() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>wa` |  vim.lsp.buf.add_workspace_folder() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>wr` |  vim.lsp.buf.remove_workspace_folder() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>wl` |  print(vim.inspect(vim.lsp.buf.list_workspace_folders())) | after/plugin/lspconfig.rc.vim |
| Normal | `<space>D` |  vim.lsp.buf.type_definition() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>rn` |  vim.lsp.buf.rename() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>ca` |  vim.lsp.buf.code_action() | after/plugin/lspconfig.rc.vim |
| Normal | `gr` | vim.lsp.buf.references() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>e` |  vim.lsp.diagnostic.open_float() | after/plugin/lspconfig.rc.vim |
| Normal | `Shift + Ctrl + d` |  vim.lsp.diagnostic.goto_next() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>q` |  vim.lsp.diagnostic.set_loclist() | after/plugin/lspconfig.rc.vim |
| Normal | `<space>f` |  vim.lsp.buf.formatting() | after/plugin/lspconfig.rc.vim |
| Normal | `Ctrl + d` | diagnostic_jump_next | after/plugin/lspsaga.rc.vim |
| Normal | `gp` | preview_definition | after/plugin/lspsaga.rc.vim |
| Normal | `T` | hover_doc | after/plugin/lspsaga.rc.vim |
| | `Ctrl + f` | smart_scroll_with_saga(1) | after/plugin/lspsaga.rc.vim |
| | `Ctrl + b` | smart_scroll_with_saga(-1) |  after/plugin/lspsaga.rc.vim |
| Normal | `gh` | lsp_finder | after/plugin/lspsaga.rc.vim |
| Normal | `Ctrl + b` | Toggle nerd tree | after/plugin/neerdtree.rc.vim |
| Normal | `Ctrl + p` | Search file with FZF | after/plugin/fzf.rc.vim |
