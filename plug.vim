if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'	" git
Plug 'tpope/vim-rhubarb'	" git hub
Plug 'cohama/lexima.vim'	" auto close parentheses

call plug#end()
