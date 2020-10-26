let mapleader =","

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'andymass/vim-matchup'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier'
Plug 'spolu/dwm.vim'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'yggdroot/indentline'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'jreybert/vimagit'
Plug 'yggdroot/indentLine'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafoftree/vim-vue-plugin'
Plug 'reedes/vim-pencil'
Plug 'ruanyl/vim-fixmyjs'
call plug#end()

syntax on
set encoding=utf-8
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
set nocompatible
filetype plugin on

" Airline
let g:airline_theme='dracula'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Set numbering
set number relativenumber

" Smaller size indents
set shiftwidth=2
set tabstop=2
set smarttab
set smartindent
set autoindent
set expandtab
set updatetime=300
let g:prettier#config#use_tabs = 'false'

" Insert space before cursor when pasting
let @p = "i \<Esc>p"

" Autocommands
autocmd BufWritePost $MYVIMRC source %

" Indent guides
set list lcs=tab:\┊\ 
let g:indentLine_char = '┊'
" Fix conceal for JSON files when using indent guides
let g:vim_json_syntax_conceal = 0

" Matchup
let g:loaded_matchit = 1

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space>for trigger completion
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Prettier & eslint
noremap <leader>p :Prettier <CR>
autocmd BufWritePre *.vue :Prettier

" Clear word highlighting after search
nnoremap <leader>cl :let @/="" <CR>

" Explore
nnoremap <leader>e :Explore <CR>
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" Spellcheck
nnoremap <leader>sp :set spell <CR>

" fzf, ripgrep
" Find files in normal mode
nnoremap <C-e> :Files<CR>

" Find lines
noremap <C-f> <ESC><ESC>:BLines<CR>

" Find lines in all open buffers
nnoremap <C-S-f> :Lines<CR>

" Find buffers
nnoremap <C-b> :Buffers<CR>

" Ripgrep
nnoremap <C-p> :Rg<Cr>

" Replace all highlighted search results
nnoremap <leader>r :%s///gc<left><left><left>

" Quickly go to vim config
nnoremap <leader>cfv :e $MYVIMRC<CR>

" Vim-plug
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

" Register manipulation
vmap <leader>xc "+y
map <leader>xp "+p
map <leader>xP "+P

" Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"" Tabs
nnoremap tn :Te<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
