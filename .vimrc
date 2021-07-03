syntax on
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

" Enable true colours and set t_8f and t_8b options explicitly
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Disable arrow keys
noremap <up> :echerr "No arrows, bro"<CR>
noremap <down> :echerr "No arrows, bro"<CR>
noremap <left> :echerr "No arrows, bro"<CR>
noremap <right> :echerr "No arrows, bro"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'jnurmine/Zenburn'

" Initialize plugin system
call plug#end()

" Set colour theme
colors zenburn

" Transparent background
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
