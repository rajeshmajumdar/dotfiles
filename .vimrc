" Vim Extensions.
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rust-lang/rust.vim'
Plug 'github/copilot.vim'

call plug#end()

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Turn persistent undo on
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='atomic'

" Basic vim configs
syntax on
filetype indent on
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

set path+=**
set so=7
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set si
set number
set rnu
set nocompatible
set ignorecase
set smartcase
set hlsearch
set cmdheight=1
set ffs=unix,dos,mac
set guioptions+=a
set encoding=utf8
set belloff=all
set hid
set lazyredraw
set magic
set showmatch
set mat=2

" Wildmenu and ignore compiled files
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has ("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Check for tags
set tags=tags

" No annoying sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Basic remaps
" <Space> is the leader key and jk to switch to normal mode.
nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap jk <Esc>
nmap ; :
noremap ;; ;
nnoremap <silent> vv <C-w>v
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>
xnoremap("<leader>p", "\"_dP")

" Select all
nnoremap <C-a> ggVG
inoremap <C-a> <esc>ggVG
vnoremap <C-a> <esc>ggVG

" Copy to macOS Clipboard
vnoremap <silent> <C-y> "*y

" Floaterm configurations
let g:floaterm_title="n0xne"

nnoremap <C-t> :silent! FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
nnoremap <C-q> :silent! FloatermKill<CR>
tnoremap <C-q> <C-\><C-n>:FloatermKill<CR>
inoremap <F12> <esc>:term<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/</C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?</C-R>=@/<CR><CR>

" Map <space> to disable highlighting
map <silent> <leader><CR> :noh<CR>

" Buffer keybindings
nnoremap <silent> `` <C-^>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Move a line of text using <leader> i.e. Space + [jk]
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Spell checking
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" Line cursors
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Plugins keybindings
let g:tmux_navigator_no_mappings = 1

nnoremap ,lic :-1read ~/.vim/templates/LICENSE<CR>
nnoremap ,cc  :-1read ~/.vim/templates/skeleton.cpp<CR>9jji

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-z> :TmuxNavigatePrevious<cr>

" Nerdtree configs
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMinimaUI = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>, :NERDTreeFind<CR>

" Compilation configs
map <leader>z :call CompileRun()<CR>
vmap <leader>z :call CompileRun()<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'rust'
        exec "!cargo run"
    endif
endfunc

" Highlight TODO, DONE, BUG, etc
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|DONE\|BUG\)')
    endif
endif
