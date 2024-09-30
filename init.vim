" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number relativenumber
set noswapfile
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set splitright
set splitbelow
"let loaded_matchparen = 1
set shell=zsh
" Use clipboard to copy and to paste
set clipboard+=unnamedplus
" Copy selected text in visual mode
"set clipboard+=autoselect
" Desactive mouse
set mouse=

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
" set ignorecase
" Be smart when using tabs ;)
set smarttab

" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
"set nowrap "No Wrap lines
set backspace=start,eol,indent

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set colorcolumn=80,100,120

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

" display char as a character
set list
set listchars=tab:\ ,trail:␣
"set listchars=tab:\ ,trail:␣,eol:
"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"}}}

" File types "{{{
" ---------------------------------------------------------------------

" C
au BufNewFile,BufRead *.c set filetype=c
au BufNewFile,BufRead *.h set filetype=c

" C++
au BufNewFile,BufRead *.cpp set filetype=cpp
au BufNewFile,BufRead *.hpp set filetype=cpp

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.c,.cpp,.h,.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  runtime ./terminal.vim
  let s:uname = system("uname -s")

  if s:uname == "Darwin\n"
    runtime ./macos.vim
  elseif s:uname == "Linux\n"
    runtime ./linux.vim
  endif

endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim
"}}}


" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  " runtime ./colors/MonokaiPro.vim
  " runtime ./colors/NeoSolarized.vim
  " runtime ./colors/Custom1.vim
  " runtime ./colors/Custom2.vim
  " colorscheme Custom2
  colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
endif

"}}}

" Others "{{{
" ---------------------------------------------------------------------

runtime ./mkdir-on-save.vim
"}}}

