if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'  " git
Plug 'tpope/vim-rhubarb'  " git hub

if has("nvim")
  Plug 'neovim/nvim-lspconfig'  " Collection of common configurations for
                                " Neovim's language server client
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }  " Lightweight lsp plugin based on neovim
                                                      " built-in lsp with highly a performant UI
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }  " Parser generator tool

  Plug 'L3MON4D3/LuaSnip'     " Text transformation (completion) snipets
  Plug 'hrsh7th/cmp-nvim-lsp' " nvim-cmp source for neovim's built-in language server client

  Plug 'hrsh7th/cmp-buffer'   " nvim-cmp source for buffer words 
  Plug 'hrsh7th/nvim-cmp'     " A completion engine plugin for neovim written in Lua.
  Plug 'onsails/lspkind-nvim' " This tiny plugin adds vscode-like pictograms to neovim built-in lsp
  Plug 'windwp/nvim-autopairs' " A super powerful autopair plugin for Neovim that supports multiple characters.
  Plug 'windwp/nvim-ts-autotag' " Use treesitter to autoclose and autorename html tag

  Plug 'scrooloose/nerdtree'      " A file explorer
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf is a general-purpose command-line fuzzy finder
  Plug 'junegunn/fzf.vim'                             " Wrapper to use fzf on vim
  Plug 'ryanoasis/vim-devicons'   " Add icons
  Plug 'folke/lsp-colors.nvim'    " Add colors to LSP diagnostics

  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown'} " Markdown preview on the browser.


endif

call plug#end()
