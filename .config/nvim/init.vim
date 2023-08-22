set hidden
set number
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile

"remaps
" Buffer navigation
nnoremap <C-j> :bn<cr>
nnoremap <C-k> :bp<cr>


"nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending <cr>
"nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", layout_config={horizontal={prompt_position="top"}}})<cr>

" Fuzzy finding mappings
nnoremap <C-_> <cmd>lua require('elusive').curr_buf()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').find_files()<cr>
" reload settings ...not working atm
"nnoremap <F4> :lua package.loaded.elusive = nil<cr>:source ~/.config/nvim/init.vim<cr>

" File browser mappings
"nnoremap <C-f> : <cr>

" Coc mappings
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

call plug#begin('~/.config/nvim/autoload')

"Dependencies
Plug 'nvim-lua/plenary.nvim'

"Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'

"Devicons
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

"My lua config
lua require('elusive')

" Command alias
command Tele Telescope
command Fb Telescope file_browser sorting_strategy=ascending layout_config={"prompt_position":"top"}

