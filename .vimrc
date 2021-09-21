"""""""""""""""""""""""""""""""""""""
" start CP vimrc
filetype plugin indent on
syntax enable

set cin nu rnu ai splitright nowrap
set so=10 ts=2 sw=2 sts=2 et
set bs=indent,eol,start
set nohlsearch incsearch ignorecase smartcase
set noswapfile nobackup
set undofile undodir=~/.vim/undodir

nmap <C-s> :up<CR>
imap <C-s> <esc><C-s>a
imap jk <esc>
imap kj <esc>
nnoremap cp :%y+<CR>

augroup COMPILE_AND_RUN
  autocmd!
  autocmd filetype c,cpp let &makeprg="g++ -O2 -DLOCAL -std=c++17 % -o %:r"
  autocmd filetype java  let &makeprg="javac %"
  autocmd filetype c,cpp,java nmap <C-b> <C-s>:silent make\|redraw!\|cw<CR>
  autocmd filetype c,cpp,java imap <C-b> <esc><C-b>

  autocmd filetype c,cpp nmap <C-x> <C-b>:!./%:r<CR>
  autocmd filetype java  nmap <C-x> <C-b>:!clear && java %:r<CR>
  autocmd filetype c,cpp,java imap <C-x> <esc><C-x>
augroup END

" end CP vimrc
"""""""""""""""""""""""""""""""""""""""

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" move between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

set exrc
set background=dark
set signcolumn=number
set encoding=utf-8
set laststatus=2
set background=dark
highlight StatusLine ctermfg=240

" trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END


" vim-plug
""""""""""
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'searleser97/cpbooster.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
call plug#end()

colo gruvbox

" google vim-codefmt
"""""""""""""""""""""
call glaive#Install()
Glaive codefmt clang_format_style="google"
autocmd filetype c,cpp,java,python nnoremap <C-l> :FormatCode<CR><C-l>
autocmd filetype c,cpp,java,python imap <C-l> <esc><C-l>a


" ctrlp
""""""""
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_user_caching = 0

let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_browse_split=2

if executable('rg')
  let g:rg_derive_root='true'
endif


" undotree
"""""""""""
nnoremap <leader>u :UndotreeShow<CR>

" coc
"""""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'


" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

if exists("g:loaded_fix_indentkeys")
    finish
endif
let g:loaded_fix_indentkeys = 1
autocmd FileType tex,plaintex execute "setlocal indentkeys=" . &indentkeys
autocmd FileType tex,plaintex set wrap

