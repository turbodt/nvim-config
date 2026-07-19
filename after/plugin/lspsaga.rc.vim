lua << EOF
local saga = require 'lspsaga'

saga.setup({
  ui = {
    border = "rounded",
  },
})

EOF

nnoremap <silent> <C-d> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gp :Lspsaga preview_definition<CR>

nnoremap <silent> T :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-u> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent> gh :Lspsaga lsp_finder<CR>
