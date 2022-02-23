if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'	" git
Plug 'tpope/vim-rhubarb'	" git hub
Plug 'cohama/lexima.vim'	" auto close parentheses

if has("nvim")
  Plug 'neovim/nvim-lspconfig'	" Collection of common configurations for
                                " Neovim's language server client
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }	" Lightweight lsp plugin based on neovim
							" built-in lsp with highly a performant UI
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }	" Parser generator tool
endif

call plug#end()
