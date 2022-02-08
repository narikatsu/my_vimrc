"-----------ENCORDING & CHARACTER CONFIG--------------"
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set guifont=Ricty_Diminished_Discord:h14
set ambiwidth=double
language C 
"-----------------------------------------------------"

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

" set clipboard+=unnamed "Windows Cripboard
set clipboard=unnamedplus "Debian Cripboard

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
" Markdown preview
Plug 'previm/previm.vim'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'

" Setting for JP chars by SKK
Plug 'vim-denops/denops.vim'
Plug 'vim-skk/denops-skkeleton.vim'
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'eggLikeNewline': v:true
    \ })
  call skkeleton#register_kanatable('rom', {
    \ "z\<Space>": ["\u3000", ''],
    \ })
endfunction
autocmd User skkeleton-initialize-pre call s:skkeleton_init()

" Ghost Text
" (Only enabled for Vim 8 (not for Neovim).)
Plug 'roxma/nvim-yarp', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
Plug 'roxma/vim-hug-neovim-rpc', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

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

" Auto complete (ddc.vim)
" requires denops.vim, pum.vim
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-around'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'Shun/ddc-vim-lsp'

" Setting for Vim-LSP(Language Protocol Server)
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'PProvost/vim-ps1'

" augroup LspGo
"   au!
"   autocmd User lsp_setup call lsp#register_server({
"       \ 'name': 'go-lang',
"       \ 'cmd': {server_info->['gopls']},
"       \ 'whitelist': ['go'],
"       \ })
"   autocmd FileType go setlocal omnifunc=lsp#complete
"   autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
"   autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
"   autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
" augroup END
" 
" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"         \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
"         \ 'whitelist': ['rust'],
"         \ })
"     autocmd FileType rust setlocal omnifunc=lsp#complete
"     autocmd FileType rust nmap <buffer> gd <plug>(lsp-definition)
"     autocmd FileType rust nmap <buffer> ,n <plug>(lsp-next-error)
"     autocmd FileType rust nmap <buffer> ,p <plug>(lsp-previous-error)
" endif
" 
" if executable('vls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'vls',
"         \ 'cmd': {server_info->['vls']},
"         \ 'whitelist': ['vue'],
"         \ 'initialization_options': {
"         \      'config': {
"         \         'html': {},
"         \         'vetur': {
"         \           'validation': {}
"         \         },
"         \      }
"         \ }
"     \ })
"     autocmd FileType vue setlocal omnifunc=lsp#complete
"     autocmd FileType vue nmap <buffer> gd <plug>(lsp-definition)
"     autocmd FileType vue nmap <buffer> ,n <plug>(lsp-next-error)
"     autocmd FileType vue nmap <buffer> ,p <plug>(lsp-previous-error)
" endif

call plug#end()

" Settings for LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" Setting for ddc.vim (auto complete)
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'skkeleton',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'around'},
 \ 'vim-lsp': {
 \   'mark': 'lsp', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*',
 \ },
 \ 'skkeleton': {
 \   'mark': 'skkeleton',
 \   'matchers': ['skkeleton'],
 \   'sorters': [],
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*',
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

colorscheme jellybeans

