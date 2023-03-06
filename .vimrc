" BASIC SETTINGS -------------------------------------------------------------- {{{

syntax on
set encoding=utf-8
set nocompatible
filetype on
filetype plugin on
autocmd vimenter * ++nested colorscheme gruvbox

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set foldcolumn=0

set number
set cursorline
set nobackup
set scrolloff=10
set nowrap
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" NERDTree settings
let NERDTreeShowBookmarks = 1   
let NERDTreeShowHidden = 1      
let NERDTreeShowLineNumbers = 0 
let NERDTreeMinimalMenu = 1     
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Pydocstring settings
let g:pydocstring_formatter = 'numpy'

" Airline settings
let g:airline_theme='gruvbox'

" COC settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')

    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'dense-analysis/ale'
    Plug 'townk/vim-autoclose'
    Plug 'vim-airline/vim-airline'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

nmap <F2> :NERDTreeToggle<CR>

inoremap jj <Esc>
nnoremap <space> :
nnoremap o o<esc>
nnoremap O O<esc>

nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nnoremap <F3> :NERDTreeToggle<cr>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

