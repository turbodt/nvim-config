let g:tex_flavor='latex'
"let g:vimtex_view_method='general'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" Spelling
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spelllang=en_gb,en_us,es_es
autocmd BufRead,BufNewFile *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
