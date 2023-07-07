" Mappings "{{{
" ---------------------------------------------------------------------

" tabs
nnoremap <A-[> gT
nnoremap <A-]> gt

" Note that vim Shift+[ => { for vim, so <A-S-[> => <A-{>
nnoremap <A-{> :tabmove -1<CR>
nnoremap <A-}> :tabmove +1<CR>

inoremap <C-t> <Esc>:tabnew .<CR>
inoremap <A-[> <Esc>gT
inoremap <A-]> <Esc>gt
inoremap <A-{> <Esc>:tabmove -1<CR>
inoremap <A-}> <Esc>:tabmove +1<CR>

tnoremap <C-t> <C-\>:tabnew .<CR>
tnoremap <A-[> <C-\>gT
tnoremap <A-]> <C-\>gt
tnoremap <A-{> <C-\>:tabmove -1<CR>
tnoremap <A-}> <C-\>:tabmove +1<CR>

"}}}
