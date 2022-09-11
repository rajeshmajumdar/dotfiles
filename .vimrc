" Vim Extensions.
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'

call plug#end()

" Vim variables
let g:airline_powerline_fonts = 1
let python_highlight_all=1
let g:clang_library_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
let g:syntastic_python_python_exec = 'python3' 
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled=1

" Basic vim configs
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
set autoindent
set number
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
set rnu
set nocompatible
set hlsearch
set ff=unix
set guioptions+=a
set encoding=utf8
set belloff=all

" Spell checking
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" Line cursors
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Keybindings
nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap jk <Esc>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>, :Goyo<CR>
nnoremap <C-z> :ALEGoToDefinition<CR>
nmap ; :
noremap ;; ;
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Files<CR>
nnoremap <silent> vv <C-w>v
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-z> :TmuxNavigatePrevious<cr>

