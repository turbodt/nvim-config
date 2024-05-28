" Mappings "{{{
" ---------------------------------------------------------------------

" tabs
nnoremap <A-h> gT
nnoremap <A-l> gt

" Note that vim Shift+[ => { for vim, so <A-S-[> => <A-{>
nnoremap <A-H> :tabmove -1<CR>
nnoremap <A-L> :tabmove +1<CR>

inoremap <C-t> <Esc>:tabnew .<CR>
inoremap <A-h> <Esc>gT
inoremap <A-l> <Esc>gt
inoremap <A-H> <Esc>:tabmove -1<CR>
inoremap <A-L> <Esc>:tabmove +1<CR>

tnoremap <C-t> <C-\>:tabnew .<CR>
tnoremap <A-h> <C-\>gT
tnoremap <A-l> <C-\>gt
tnoremap <A-H> <C-\>:tabmove -1<CR>
tnoremap <A-L> <C-\>:tabmove +1<CR>

"}}}
