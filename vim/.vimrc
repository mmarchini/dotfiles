if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/junegunn/vim-github-dashboard.git'
  " On-demand loading
  Plug 'scrooloose/nerdtree'

  Plug 'itchyny/lightline.vim'

  Plug 'w0rp/ale'

  Plug 'scrooloose/nerdcommenter'

  Plug 'tpope/vim-fugitive'

  Plug 'tpope/vim-surround'

  Plug 'airblade/vim-gitgutter'

  Plug 'vim-scripts/MultipleSearch'
  Plug 'rrethy/vim-illuminate'

  " Plug 'valloric/youcompleteme'

  Plug 'dietsche/vim-lastplace'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'merlinrebrovic/focus.vim'

  Plug 'majutsushi/tagbar'

  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'kelan/gyp.vim'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  Plug 'cocopon/iceberg.vim'
  Plug 'morhetz/gruvbox'
  Plug 'flazz/vim-colorschemes'
  Plug 'felixhummel/setcolors.vim'

  Plug 'vim-scripts/ctags.vim'

  Plug 'pangloss/vim-javascript'

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
nmap <C-p> :FZF<CR>
nmap <C-k> :TagbarToggle<CR>
nmap <leader>. :Tags<CR>

nmap <leader>bb :belowright :terminal npm install<CR>

let g:gruvbox_contrast_dark='hard'
colorscheme Benokai
" colorscheme iceberg

let g:NERDSpaceDelims = 1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:vim_markdown_folding_disabled = 1
let g:focusmode_width = 90

syn on
set background=dark
set number
set nowrap
set sw=2
set expandtab
set shiftround
set laststatus=2
set mouse=a
set hlsearch
set backspace=indent,eol,start

set showcmd
set showmatch
set incsearch
set ignorecase

highlight ColorColumn ctermbg=gray
set colorcolumn=80

highlight Normal ctermbg=None
