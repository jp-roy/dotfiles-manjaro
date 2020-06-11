" ================ GENERAL CONFIG ====================
set autoread                   " Reload files changed outside vim
set backspace=indent,eol,start " Allow backspace in insert mode
set belloff=all								 " No sound
set history=100                " Store lots of :cmdline history
set laststatus=2               " Status line always on display
set nobackup                   " Delete backup file upon successful save of original file
set nocompatible               " don't need to be compatible with old VI
set noshowmode                 " Hide status line (--> it is actually displayed with lightline plugin)
set noswapfile                 " turn off Swap Files
set nowritebackup
set number                     " Line numbers are good
set numberwidth=5
set relativenumber             " show relative number lines
set ruler                      " show row and column in footer
set showcmd                    " Show incomplete cmds down the bottom
set showmatch                  " show bracket matches
set ttimeoutlen=0              " Doesn't wait after pressing ESC for another command
set visualbell                 " No sounds

syntax on                      " turn on syntax highlighting

if has("multi_byte")
	set encoding=utf-8
	setglobal fileencoding=utf-8
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" ================ SEARCH  ======================
set hlsearch                   " highlight all search matches
set incsearch
set wildmenu                   " enable bash style tab completion
set wildmode=list:longest,full

" ================ INDENTATION ======================
set autoindent " auto indentation
set expandtab
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1

" =============== CUSTOM REMAPS =====================
let mapleader="ù"              " Map Leader key to ù

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" Open NERDTree
noremap <Leader>o :NERDTreeToggle

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" ================ SCROLLING ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ PLUGINS ========================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'ap/vim-css-color'                             " highlight hex values with their color
  Plug 'christoomey/vim-tmux-navigator'               " Easily navigate between tmux / vim panes
  Plug 'godlygeek/tabular'                            " align stuff... like these vim comments
  Plug 'itchyny/lightline.vim'                        " customize status bar
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search for files
  Plug 'junegunn/fzf.vim'                             " fuzzy search for files
	Plug 'lifepillar/vim-solarized8'                    " Solarized theme
  Plug 'mattn/emmet-vim'                              " expand abbreviations similar to emmet.
  Plug 'msanders/snipmate.vim'                        " snippets
  Plug 'preservim/nerdtree'                           " file browser
  Plug 'sheerun/vim-polyglot'                         " syntax highlighting for many languages
  Plug 'tpope/vim-commentary'                         " comment stuff out, like these comments
  Plug 'tpope/vim-eunuch'                             " UNIX shell commands
  Plug 'tpope/vim-fugitive'                           " git wrapper
  Plug 'tpope/vim-surround'                           " change and add surrounds, []()''...
call plug#end()

" ================ APPEARANCE ======================
set background=dark
colorscheme solarized8

" lightline plugin config
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
\ }

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
