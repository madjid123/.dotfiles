" Don't try to be vi compatible set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
"colorscheme onedark
" Turn on syntax highlighting
syntax on 
" For plugins to load correctly
filetype plugin indent on


silent! unlet key
set mouse=a

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search


" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
"colorscheme Tomorrow-Night
hi Normal ctermbg=none

call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'powerline/powerline'
Plug 'honza/vim-snippets'
Plug 'kaicataldo/material.vim'
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
Plug 'valloric/youcompleteme'
Plug 'preservim/nerdtree'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" My Keybindings <=========
"
inoremap kj <Esc> 
imap <A-n>   <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap zz :update<cr>
nnoremap mm :source %<CR>
nnoremap wj :wincmd j<CR>
nnoremap wh :wincmd h<CR>
nnoremap wk :wincmd k<CR>
nnoremap wl :wincmd l<CR>
imap <C-j> <Up>
imap <C-k> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
nnoremap <C-t> :below vert  terminal<CR> 

"========================>


"--Color Scheme --
colorscheme material 
"-----------------

"Open Nerd Tree--------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"---------------------------------------------------------------------------
