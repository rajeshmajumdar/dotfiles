" Plugged
call plug#begin()
" Nightfox color scheme
Plug 'EdenEast/nightfox.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
" Airline & Airline-themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ----------------------------
" Basic neovim configurations|
" ----------------------------

set nocompatible
colorscheme nightfox
syntax on
filetype indent on
set path+=**
set tabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set autoindent
set si
set so=7
set number
set rnu
set ignorecase
set smartcase
set hlsearch
set guioptions+=a
set belloff=all
set encoding=utf8
set hid
set tags=tags
set splitbelow
set splitright

" ---------------
" Basic keymaps |
" ---------------

nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap jk <ESC>
nnoremap ; :
noremap ;; ;

" Reload nvim config
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>

" Vertical split
nnoremap <silent> vv <C-w>v

" Select all
nnoremap <C-a> ggVG
inoremap <C-a> <esc>ggVG
vnoremap <C-a> <esc>ggVG

" Copy to macOS clipboard
vnoremap <silent> <C-y> "*y

" Map <space> to disable :noh highlighting
map <silent> <leader><CR> :noh<CR>

" Buffer keybindings
nnoremap <silent> `` <C-^>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-x> :bd<CR>

" Move a line of text using <leader> i.e. <SPACE> + [j/k]
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Telescope keybindings
nnoremap <leader>f <CMD>Telescope find_files<CR>
nnoremap <leader>fg <CMD>Telescope live_grep<CR>
nnoremap <leader>fb <CMD>Telescope buffers<CR>
nnoremap <leader>fh <CMD>Telescope help_tags<CR>

" Dashboard keybindings
nmap <leader>ss :<C-u>SessionSave<CR>
nmap <leader>sl :<C-u>SessionLoad<CR>

" Nvim-tree keybindings
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <C-h> :NvimTreeFocus<CR>

" Terminal keybindings
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-h> <C-\><C-N><C-w>h
:tnoremap <C-j> <C-\><C-N><C-w>j
:tnoremap <C-k> <C-\><C-N><C-w>k
:tnoremap <C-l> <C-\><C-N><C-w>l
:inoremap <C-h> <C-\><C-N><C-w>h
:inoremap <C-j> <C-\><C-N><C-w>j
:inoremap <C-k> <C-\><C-N><C-w>k
:inoremap <C-l> <C-\><C-N><C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

:nnoremap <leader>t :vsplit term://zsh<CR>

" Execute terminal commands
nnoremap <leader>c :!
vnoremap <leader>c <ESC>:!

" -----------------
"  Airline config |
" -----------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='atomic'

" ---------------------
"  Tree configuration |
" ---------------------
lua << EOF
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

EOF

" -----------------------
" Neovide configuration |
" -----------------------

if exists("g:neovide")
    let g:neovide_refresh_rate = 60
    let g:neovide_refresh_rate_idle = 5
    let g:neovide_transparency = 0.0
    let g:transparency = 0.8
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_hide_mouse_when_typing = v:true
    let g:neovide_input_macos_alt_is_meta= v:false
endif

" ------------------
"  Compile program |
" ------------------

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
