set number " Shows the line numbers
set ttyfast " Speed up scrolling in Vim
set autoindent " Ident a new line
set cursorline " Highlights the current line in the editor
set expandtab
set tabstop=4
set shiftwidth=4
set title " Show file title
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Coc: Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Airline themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }


" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" A Graphical debugger
Plug 'puremourning/vimspector'

" A fuzzy file finder
Plug 'kien/ctrlp.vim'

" Misc
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                                                       
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy finder
Plug 'junegunn/fzf.vim'

" Directories tree
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'

call plug#end()

" Map to enable autocomplete using Enter key
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

tnoremap <Esc> <C-\><C-n>

" Find files using Telescope command-line sugar.
nnoremap <silent>ff :Telescope find_files <CR>
nnoremap <silent>fg :Telescope live_grep <CR>
nnoremap <silent>fb :Telescope buffers <CR>
nnoremap <silent>fh :Telescope help_tags <CR>

" Using Lua functionsCMD
nnoremap <silent>ff :lua require('telescope.builtin').find_files() <CR>
nnoremap <silent>fg :lua require('telescope.builtin').live_grep() <CR>
nnoremap <silent>fb :lua require('telescope.builtin').buffers() <CR>
nnoremap <silent>fh :lua require('telescope.builtin').help_tags() <CR>

" set background=dark
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

colorscheme codedark

" Airline theme
let g:airline_theme='codedark'

map + :bn<cr>
map _ :bp<cr>
map bd :bd<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" END config for coc
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" navigate conflicts of current buffer
nmap <silent> [c <Plug>(coc-git-prevconflict)
nmap <silent> ]c <Plug>(coc-git-nextconflict

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>'):
  else
	  call CocAction('doHover')
  endif
endfunction



" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
