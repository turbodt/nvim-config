"leader key
let mapleader=" "
nnoremap <SPACE> <Nop>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs
nnoremap <C-t> :tabnew .<CR>
nnoremap “ gT
nnoremap ‘ gt
" Note that vim Shift+[ => { for vim, so <A-S-[> => <A-{>
nnoremap ” :tabmove -1<CR>
nnoremap ’ :tabmove +1<CR>

nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <c-n><c-s> :call OpenVerticalTerminal()<CR>
nnoremap <c-n><c-t> :call OpenNewTabTerminal()<CR>

" Save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>i

" Select all
nmap <C-a> gg<S-v>G

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
