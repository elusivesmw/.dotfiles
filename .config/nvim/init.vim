set hidden
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set hls is ic
set list
set listchars=tab:>=,trail:.

"buffer navigation
nnoremap <C-j> <cmd>bn<cr>
nnoremap <C-k> <cmd>bp<cr>

"close parens
inoremap ( ()<esc>ha
inoremap ) <cmd>lua require('elusive').close(')')<cr>

inoremap { {}<esc>ha
inoremap } <cmd>lua require('elusive').close('}')<cr>

inoremap [ []<esc>ha
inoremap ] <cmd>lua require('elusive').close(']')<cr>

" auto close
" inoremap " ""<Esc>ha " change this to if next to whitespace
" inoremap ' ''<Esc>ha "
" inoremap ` ``<Esc>ha "

"nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending <cr>
nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", layout_config={horizontal={prompt_position="top"}}})<cr>

"fuzzy finding mappings
"nnoremap <C-_> <cmd>lua require('elusive').curr_buf()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').find_files({hidden=false})<cr>

"reload settings
nnoremap <F4> :lua package.loaded.elusive = nil<cr>:source ~/.config/nvim/init.vim<cr>:source ~/.config/nvim/lua/elusive.lua<cr>

"file browser mappings
"nnoremap <C-f> : <cr>

"coc mappings
"while coc is visible, enter confirms selection, otherwise send <cr>
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr><esc>:lua require('elusive').handle_cr()<cr>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"


"plugins
call plug#begin('~/.config/nvim/autoload')
"dependencies
Plug 'nvim-lua/plenary.nvim'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'
"devicons
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()


"my lua config
lua require('elusive')

"command alias
command! Fb Telescope file_browser sorting_strategy=ascending layout_config={"prompt_position":"top"}

