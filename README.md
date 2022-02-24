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



## Dependencies

Some `npm` dependencies are:
  - `npm install -g typescript typescript-language-server`
  - `npm install -g neovim`
