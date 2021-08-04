" Don't try to be vi compatible set nocompatible

" Helps force plugins to load correctly when it is turned back on below
"filetype off

" TODO: Load plugins here (pathogen or vundle)
"colorscheme onedark
" Turn on syntax highlighting
syntax on 
" For plugins to load correctly
filetype plugin indent on


silent! unlet key
set mouse=a

" TODO: Pick a leader key
 let mapleader = ","


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

 " path to directory where library can be found
 let g:clang_library_path='/usr/lib/llvm-10/lib'
 " or path directly to the library file
 let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-10.so.1'
 " Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines

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

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
" Textmate holdouts

" Formatting
map <leader>q gqip
  
" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
"map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
"set background=dark
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
"colorscheme Tomorrow-Night

call plug#begin('~/.vim/plugged')
Plug 'ollykel/v-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips'
"Plug 'rip-rip/clang_complete'
"Plug 'ervandew/supertab'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'powerline/powerline'
Plug 'honza/vim-snippets'
Plug 'kaicataldo/material.vim'
"Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'


"function! BuildYCM(info)
 ""          if a:info.status == 'installed' || a:info.force
  ""            !./install.py
  ""         endif
  ""       endfunction
"
 ""       Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
"
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()
"let g:UltiSnipsExpandTrigger="<S-~>"
"let g:UltiSnipsJumpForwardTrigger="<S-f>"
"let g:UltiSnipsJumpBackwardTrigger="<S-b>"
" My Keybindings <=========

inoremap <M-;> <Esc> 
imap <A-n>   <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap zz :update<cr>
nnoremap mm :source $MYVIMRC<CR>
nnoremap <M-j> :wincmd j<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <M-h> :wincmd h<CR>
nnoremap <M-k> :wincmd k<CR>
nnoremap <A-h> :wincmd h<CR>
nnoremap <M-l> :wincmd l<CR>
"nnoremap <S-t> :tabnew<space>
nnoremap t0 :tabnext<CR>
nnoremap t9 :tabprevious<CR>
nnoremap eq :q!<CR>
nnoremap wq :wq!<CR>
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>
imap <C-j> <Up>
imap <C-k> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
nnoremap <C-t> :vs term://zsh <CR> 
tnoremap kj <Esc>
tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
"========================>

"let g:coc_global_extensions = [
"  \ 'coc-snippets',
"  \ 'coc-pairs',
"  \ 'coc-tsserver',
"  \ 'coc-eslint', 
" \ 'coc-prettier', 
" \ 'coc-json',
" \ 'coc-ccls'
" \ ]
"--Color Scheme --
   "syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
 "let g:lightline = { 'colorscheme': 'onehalfdark' }
"colorscheme gruvbox 
"-----------------
if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif
"Open Nerd Tree--------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"---------------------------------------------------------------------------
"
hi Normal ctermbg=none
