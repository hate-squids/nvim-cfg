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
" TODO: vim-sandwich

" python
Plug 'Vimjas/vim-python-pep8-indent'	" pep-styled indents
Plug 'davidhalter/jedi'					" jedi
Plug 'integralist/vim-mypy'				" linter
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion

" yaml
Plug 'stephpy/vim-yaml'
call plug#end()

set number
set linespace=3
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
set updatetime=500
set shortmess+=c
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax on
colorscheme gruvbox

" Airline
let g:airline_theme='gruvbox'

" yaml
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd	CursorHold,CursorHoldI * update

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set colorcolumn=0
    autocmd WinLeave * set nocursorline
augroup END

" NERDTree 
let g:NERDTreeChDirMode=2

nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <S-F12> :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <S-Insert> "+gp
inoremap <S-Insert> <C-c>"+gp
noremap <C-w><b> :split<CR>
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" coc
inoremap <silen><expr> <Tab>
            \ pumvisible() ? "\<C-n>":
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
function s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] = ~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


