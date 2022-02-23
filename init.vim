call plug#begin("~/.vim/plugged")

  " Theme
  "" Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'glepnir/oceanic-material'
  Plug 'phanviet/vim-monokai-pro'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-clangd', 'coc-cmake', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python']

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
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'python'] }

  " Python
  Plug 'tell-k/vim-autopep8'
  Plug 'nvie/vim-flake8'

  " Mustache
  Plug 'mustache/vim-mustache-handlebars'

  " Latex
  Plug 'lervag/vimtex'
call plug#end()

" set leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme monokai_pro
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

" Move
inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-j> <down>
inoremap <A-k> <up>
cnoremap <A-h> <left>
cnoremap <A-l> <right>

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
nnoremap <A-[> gT
nnoremap <A-]> gt
" Note that vim Shift+[ => { for vim, so <A-S-[> => <A-{>
nnoremap <A-{> :tabmove -1<CR>
nnoremap <A-}> :tabmove +1<CR>


" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
  set nonumber norelativenumber
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

function! OpenVerticalTerminal()
  vertical split term://zsh
  set nonumber norelativenumber
endfunction
nnoremap <c-n><c-s> :call OpenVerticalTerminal()<CR>

function! OpenNewTabTerminal()
  tabnew term://zsh
  set nonumber norelativenumber
endfunction
nnoremap <c-n><c-t> :call OpenNewTabTerminal()<CR>

" general
set noswapfile
set number relativenumber
set clipboard+=unnamedplus

" display char as a character
set list
set listchars=tab:\ ,trail:␣
"set listchars=tab:\ ,trail:␣,eol:

" Set the default file encoding to UTF-8:
set encoding=utf-8
set colorcolumn=80

" Create directory on save if it does not exists
" source: https://travisjeffery.com/b/2011/11/saving-files-in-nonexistent-directories-with-vim/
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" Spell Check
setlocal spell
set spelllang=en_us
"set spelllang=en_gb,es_es,ca_ES
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
syntax spell toplevel

"------------Start Python PEP 8 stuff----------------

" use flake8 instead of autopep8
let g:autopep8_on_save = 0
let g:autopep8_disable_show_diff=1

let g:flake8_show_in_file=1

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

" make backspaces more powerfull
set backspace=indent,eol,start

"----------Stop python PEP 8 stuff--------------


"----------Latex----------
" source: https://castel.dev/post/lecture-notes-1/
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

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
autocmd FileType html set autoindent
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
