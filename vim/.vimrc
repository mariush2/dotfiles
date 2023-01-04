if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'dikiaap/minimalist'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'gorodinskiy/vim-coloresque'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" Fixes colours
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Syntax highlight fix
filetype plugin on
syntax on

set t_Co=256
set encoding=UTF-8
set guifont=Fira\ Code\ Retina\ Nerd\ Font\ Complete:h12

" Config tokyonight theme
let g:tokyonight_style = "night"

" Set vim theme
colorscheme tokyonight 

" Theme specific js
let g:javascript_plugin_flow = 1

" Remove git-gutter mappings
let g:gitgutter_map_keys = 0

" Set airline theme
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Set mapleader
let mapleader=" "

" Setup softtabs and autoindent
set softtabstop=2
set shiftwidth=2
set autoindent

" Make backspace work as expected
set backspace=indent,eol,start

" Make splitting move the cursor correctly
set splitbelow
set splitright

" Ctrl+n starts NerdTREE 
map <C-n> :NERDTreeToggle<CR>

" Make undo if I fuck up after save
set undofile
set undodir=~/.vim/undo_dir

" Show line numbers in editor
set number

" Show relative line numbers
set relativenumber

" Move with relative line-numbers
augroup number relativenumber
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"Save current file
nnoremap <leader>w :w<cr>

" Change cursor for the different modes (This is specific for iTerm2 on OS X)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Add mappings for adding blanklines
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>
