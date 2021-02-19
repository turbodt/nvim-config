call plug#begin("~/.vim/plugged")

  " Theme
  "" Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python']

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'


  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Prettier
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

  " Python
  Plug 'tell-k/vim-autopep8'
  Plug 'nvie/vim-flake8'

  " Mustache
  Plug 'mustache/vim-mustache-handlebars'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeIgnore=['\.pyc$', '\~$', '^__pycache__$']

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs
nnoremap <C-t> :tabnew .<CR>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  "resize 10
  set nonumber
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

function! OpenVerticalTerminal()
  vertical split term://bash
  set nonumber
endfunction
nnoremap <c-n><c-s> :call OpenVerticalTerminal()<CR>

" general
set noswapfile
set number
set clipboard+=unnamedplus

" display char as a character
set list
set listchars=tab:>-

" Set the default file encoding to UTF-8:
set encoding=utf-8
set colorcolumn=80


"------------Start Python PEP 8 stuff----------------
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

au BufRead,BufNewFile *.py,*.pyw set smarttab
au BufRead,BufNewFile *.py,*.pyw set shiftround

au BufNewFile,BufRead *.py,*.pyw,*.c,*.h
  \ set tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" For full syntax highlighting:
let python_highlight_all=1
syntax on

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
" autocmd FileType python set foldmethod=indent
"use space to open folds
" nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType typescript setlocal tabstop=2
autocmd FileType typescript setlocal tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx setlocal softtabstop=2
au BufRead,BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx setlocal tabstop=2
au BufRead,BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx setlocal shiftwidth=2
au BufNewFile *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx set fileformat=unix
"autocmd FileType typescript set autoindent
"autocmd FileType javascript set autoindent
autocmd FileType html  set autoindent
autocmd FileType css set autoindent
"autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

let g:prettier#autoformat = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'

augroup UsePrettier
autocmd!
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier
augroup END

" markdown
au BufNewFile,BufRead *.md
  \ set tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix


" cpp
"
au BufNewFile,BufRead *.h,*.cpp,*.c
  \ set tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix

"sh stuff"
autocmd FileType bash setlocal tabstop=2
autocmd FileType bash setlocal tabstop=2
autocmd FileType bash 
  \ setlocal tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix
