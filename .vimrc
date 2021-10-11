"-----------ENCORDING & CHARACTER CONFIG--------------"
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set guifont=Ricty_Diminished_Discord:h14
set ambiwidth=double
language C "-----------------------------------------------------"

"-----------COMMAND SPACE CONFIG----------------------"
set showcmd
set cursorline
set cursorcolumn
set laststatus=2
set cmdheight=2
set wildmode=list:longest
set ruler "View rownum,columnnum at rightbottom
"-----------------------------------------------------"

"-----------BASIS CONFIG------------------------------"
set nocompatible "SetOff VI MODE
set backupdir=~/vimbackup "BACKUP FILE TO...
set directory=~/vimbackup

set iminsert=0 "InsertMode Default IME : OFF
set imsearch=-1 "SearchMode Default IME : Same as InsertMode

set browsedir=buffer

set clipboard+=unnamed "Windows Cripboard

set hidden "VIEW OTHER FILE without SAVING WORKING FILE

"Shift + direction-key = changeWindowSize
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>-<CR>
nnoremap <S-Down> <C-w>+<CR>
"-----------------------------------------------------"

"----------EDITOR CONFIG------------------------------"


set autoindent
set smartindent

set showmatch "VIEW ( to ), { to }

set list "Unvisuable Char : visuable
set expandtab " INSERT BLANK instead of TAB
set shiftwidth=2 "SET SHIFT WIDTH
set smarttab
set tabstop=2

set backspace=2
set backspace=indent,eol,start "BACKSPACE-KEY config: delete rowhead

set scrolloff=5 "view 5 rows under selected row

set number "VIEW ROW NUMBER

set whichwrap=b,s,h,l,<,>,[,]

nnoremap <silent> j gj
nnoremap <silent> k gk

"Set <Space> as <Leader>
let mapleader = "\<Space>"
nnoremap <Leader>ub :Unite buffer<CR>
nnoremap <Leader>uf :Unite file_rec<CR>
" nnoremap <Leader>t :terminal ++close powershell<CR>
nnoremap <Leader>t :bo terminal ++close ++rows=10 <CR>

"yang to rowend by Y
nnoremap Y y$
"
"AutoCompleteBox HEIGHT -----------------------------------------------------" 
set pumheight=10
"------------SEARCH MODE CONFIG-------------------"
set incsearch "INCREMENTAL SEARCH
set ignorecase
set smartcase "IN SEARCH, A-a judgesmart
"After Jumped, set center matchedString"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

set hlsearch "High Light
call plug#begin('~/.vim/plugged')

"Emmet
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'

" Filer Plugin
Plug 'Shougo/vimfiler'
" Unite
Plug 'Shougo/unite.vim'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'

"Vue.js tool
Plug 'posva/vim-vue', {'for': ['vue']}

" Golang tool
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}

" Rustlang tool
Plug 'rust-lang/rust.vim', {'for': 'rust', 'do': ':let g:rustfmt_autosave = 1'}

Plug 'easymotion/vim-easymotion'
nmap <Leader>f <Plug>(easymotion-overwin-f2)
", {'do': [':let g:EasyMotion_smartcase = 1', ':let g:EasyMotion_enter_jump_first = 1', ':let g: EasyMotion_startofline = 0']}

" Color Schema
Plug 'nanotech/jellybeans.vim'

" Setting for Vim-LSP(Language Protocol Server)
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'PProvost/vim-ps1'

augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'go-lang',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
  autocmd FileType go setlocal omnifunc=lsp#complete
  autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
augroup END

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
    autocmd FileType rust nmap <buffer> gd <plug>(lsp-definition)
    autocmd FileType rust nmap <buffer> ,n <plug>(lsp-next-error)
    autocmd FileType rust nmap <buffer> ,p <plug>(lsp-previous-error)
endif

if executable('vls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vls',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ 'initialization_options': {
        \      'config': {
        \         'html': {},
        \         'vetur': {
        \           'validation': {}
        \         },
        \      }
        \ }
    \ })
    autocmd FileType vue setlocal omnifunc=lsp#complete
    autocmd FileType vue nmap <buffer> gd <plug>(lsp-definition)
    autocmd FileType vue nmap <buffer> ,n <plug>(lsp-next-error)
    autocmd FileType vue nmap <buffer> ,p <plug>(lsp-previous-error)
endif

call plug#end()

colorscheme jellybeans
