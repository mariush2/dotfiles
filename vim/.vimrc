if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'prettier/vim-prettier'
	Plug 'hzchirs/vim-material'
	Plug 'dikiaap/minimalist'
	Plug 'rakr/vim-two-firewatch'
	Plug 'w0rp/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'gorodinskiy/vim-coloresque'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'wakatime/vim-wakatime'
	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/goyo.vim'
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
set guifont=Fura\ Code\ Retina\ Nerd\ Font\ Complete:h12

" Set vim theme
colorscheme minimalist 

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
if has("persistent_undo")
	set undodir=~/.vim/undo_dir
	set undofile
endif

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

" Mappings to more easily navigate split panes
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Open vimrc and edit
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Save current file
nnoremap <leader>w :w<cr>

" fzf mappings
nmap <leader>f :Files<cr>    " fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>/ :BLines<cr>   " fuzzy find lines in the current file
nmap <leader>b :Buffers<cr>  " fuzzy find an open buffer
nmap <leader>r :Rg<cr>       " fuzzy find text in the working directory
nmap <leader>c :Commands<cr> " fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)

" Change cursor for the different modes (This is specific for iTerm2 on OS X)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Changing tabs more IDE like
nnoremap <leader><Tab> gt<cr>

" Toggle distraction free writing for taking notes
nnoremap <C-g> :Goyo<cr>

" Add mappings for adding blanklines
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>

" vim-prettier setup
" Force async
let g:prettier#exec_cmd_async = 1

" Disable auto-commenting when in insert mode
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
