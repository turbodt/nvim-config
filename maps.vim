" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Move
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
cnoremap <C-h> <left>
cnoremap <C-l> <right>

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

nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <c-n><c-s> :call OpenVerticalTerminal()<CR>
nnoremap <c-n><c-t> :call OpenNewTabTerminal()<CR>
