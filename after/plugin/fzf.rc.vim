lua << EOF
require('fzf-lua').setup({
    files = {
        cmd = 'rg --files --hidden --follow --glob "!.git/*"',
    },
})
EOF

nnoremap <C-p> :FzfLua files<CR>
nnoremap <leader>ff :FzfLua files<CR>
nnoremap <leader>fg :FzfLua live_grep<CR>
nnoremap <leader>fb :FzfLua buffers<CR>
nnoremap <leader>fo :FzfLua oldfiles<CR>
