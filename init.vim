call plug#begin()
Plug 'scrooloose/nerdTree'				" NERDTree - file manager
Plug 'bling/vim-airline'				" status line
Plug 'rainglow/vim'						" alot of colorschemes
Plug 'junegunn/fzf.vim'					" Fuzzy finder
Plug 'junegunn/limelight.vim'			" Partial document hilighting
Plug 'jiangmiao/auto-pairs'				" matching paired quotes 
Plug 'aserebryakov/vim-todo-lists' 		" todo lists
Plug 'tomtom/tcomment_vim'				" universal commenter
Plug 'morhetz/gruvbox'					" color sheme
Plug 'blueyed/vim-diminactive'          " inactive buffer shading
Plug 'aquach/vim-http-client'           " http client
Plug 'tpope/vim-fugitive'               " git extras
Plug 'machakann/vim-sandwich'           " suround plugin
Plug 'rking/ag.vim'                     " recursive directory text search

" python
Plug 'Vimjas/vim-python-pep8-indent'	" pep-styled indents
Plug 'davidhalter/jedi'					" jedi
Plug 'integralist/vim-mypy'				" linter
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" yaml
Plug 'stephpy/vim-yaml'

" logs
Plug 'mtdl9/vim-log-highlighting'

call plug#end()

set number
set guifont=Anonymous\ Pro:h14
set cursorline
set autowriteall
set noautochdir
set guioptions-=T
set hidden
set nobackup
set nowritebackup
set scrolloff=10
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linespace=2

syntax on
colorscheme gruvbox

" Airline
let g:airline_theme='gruvbox'

" yaml
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd	CursorHold,CursorHoldI * update

let g:deoplete#enable_at_startup = 1

let g:ale_completion_enabled = 1
let g:ale_python_flake8_executable = 'python3'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

set completeopt=menu,menuone,preview,noselect,noinsert
set omnifunc=ale#completion#OmniFunc

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set colorcolumn=0
    autocmd WinLeave * set nocursorline
augroup END

" http client response encoding
let g:http_client_json_escape_utf=0

" NERDTree 
let g:NERDTreeChDirMode=2
let g:NERDTreeUseTCD=1

noremap <C-o> :Ag 
noremap <F3> :nohlsearch<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <S-F12> :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <S-Insert> "+gp
inoremap <S-Insert> <C-c>"+gpA
vnoremap <S-y> "+y
noremap <C-w><b> :split<CR>
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

