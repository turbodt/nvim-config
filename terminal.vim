" Terminal "{{{
" ---------------------------------------------------------------------

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal with mappings defined in maps.vim
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
  set nonumber norelativenumber
endfunction

function! OpenVerticalTerminal()
  vertical split term://zsh
  set nonumber norelativenumber
endfunction

function! OpenNewTabTerminal()
  tabnew term://zsh
  set nonumber norelativenumber
endfunction

"}}}
