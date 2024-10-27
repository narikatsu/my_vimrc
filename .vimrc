"-----------ENCORDING & CHARACTER CONFIG--------------"
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set ambiwidth=double
language C
"-----------------------------------------------------"

"-----------NEOVIDE(GUI) APPEARANCE CONFIG -----------"
let g:neovide_transparency = 0.85
"-----------ENCORDING & CHARACTER CONFIG--------------"
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set ambiwidth=double
language C
"-----------------------------------------------------"

"-----------NEOVIDE(GUI) APPEARANCE CONFIG -----------"
let g:neovide_transparency = 0.85
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

" autocmd BufLeave <buffer> echo localtime()

"-----------BASIS CONFIG------------------------------"
set nocompatible "SetOff VI MODE
set backupdir=~/vimbackup "BACKUP FILE TO...
set directory=~/vimbackup

set iminsert=0 "InsertMode Default IME : OFF
set imsearch=-1 "SearchMode Default IME : Same as InsertMode

set browsedir=buffer

if has('win32')
  set clipboard+=unnamed "Windows Cripboard
else
  set clipboard+=unnamedplus "Debian Cripboard
endif"

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

"Set <Space> as <Leader>
let mapleader = "\<Space>"

nnoremap <silent> j gj
nnoremap <silent> k gk

if has('win32')
  if has('nvim')
    autocmd TermOpen * startinsert
    tnoremap <silent> <ESC> <C-\><C-n>
    nnoremap <Leader>t :terminal powershell<CR>
  else
    nnoremap <Leader>t :bo terminal ++close ++rows=10 powershell<CR>
  endif
else
  if has('nvim')
    autocmd TermOpen * startinsert
    tnoremap <silent> <ESC> <C-\><C-n>
    nnoremap <Leader>t :terminal<CR>
  else
    nnoremap <Leader>t :bo terminal ++close ++rows=10 <CR>
  endif
endif

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

if has("unix")
  " sync vim register to clipboard
  command Register2Clipboard :echo system('wl-copy', @")
  " sync vim register to clipboard
  command Clipboard2Register :let @" =  system('wl-paste')
endif

"
set hlsearch "High Light
call plug#begin('~/.vim/plugged')

"Emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-t>'

Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'

" Markdown preview
Plug 'previm/previm'
let g:previm_open_cmd = 'firefox'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'

" Git plugin
Plug 'tpope/vim-fugitive'

" Setting for JP chars by SKK
Plug 'vim-denops/denops.vim'
Plug 'vim-skk/denops-skkeleton.vim'
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'globalDictionaries': ["~/.skkeleton/SKK-JISYO.L", "~/.skkeleton/SKK-JISYO.jinmei", "~/.skkeleton/SKK-JISYO.station"],
    \ 'userDictionary':"~/.skkeleton/user-jisyo",
    \ 'showCandidatesCount':2,
    \ })
  "カナテーブル
  "記号
  call skkeleton#register_kanatable('rom', {
    \ "z\<Space>": ["\u3000", ''],
    \ "zh": ["←", ''],
    \ "zj": ["↓", ''],
    \ "zk": ["↑", ''],
    \ "zl": ["→", ''],
    \ "z~": ["〜", ''],
    \ "z/": ["・", ''],
    \ "z[": ["『", ''],
    \ "z]": ["』", ''],
    \ "z(": ["【", ''],
    \ "z)": ["】", ''],
    \ "z*": ["※", ''],
    \ ":": [":", ''],
    \ "z:": ["：", ''],
    \ "?": ["?", ''],
    \ "z?": ["？", ''],
    \ "!": ["!", ''],
    \ "z!": ["！", ''],
    \ ",": [",", ''],
    \ "z,": ["、", ''],
    \ ".": [".", ''],
    \ "z.": ["。", ''],
    \ "z-": ["-", ''],
    \ })
endfunction
autocmd User skkeleton-initialize-pre call s:skkeleton_init()

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

" file drawer
Plug 'lambdalisue/fern.vim'

" Auto complete (ddc.vim)
" requires denops.vim, pum.vim
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-ui-pum'
Plug 'LumaKernel/ddc-source-file'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'Shun/ddc-source-vim-lsp'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-source-cmdline'
Plug 'Shougo/ddc-source-cmdline-history'

" Setting for UI framework
Plug 'Shougo/ddu.vim'
"components of ddu
Plug 'Shougo/ddu-ui-ff'
Plug 'Shougo/ddu-ui-filer'
Plug 'Shougo/ddu-column-filename'
Plug 'Shougo/ddu-kind-file'
Plug 'Shougo/ddu-kind-word'
Plug 'Shougo/ddu-filter-matcher_substring'
Plug 'shun/ddu-source-buffer'
Plug 'shun/ddu-source-rg'
Plug 'Shougo/ddu-source-action'
Plug 'Shougo/ddu-source-file_rec'
Plug 'Shougo/ddu-source-file'
Plug 'Shougo/ddu-source-register'
Plug 'matsui54/ddu-source-command_history'
Plug 'tomato3713/ddu-source-joplin'
Plug 'tomato3713/ddu-kind-joplin'


" Setting for Vim-LSP(Language Protocol Server)
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'PProvost/vim-ps1'

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

" Settings for LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_signature_help_enable = 0
" let g:lsp_completion_documentation_enabled = 0
let g:lsp_log_verbose = 1

" Setting for ddc.vim (auto complete)
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global({
  \  'ui': 'pum', 
  \  'autoCompleteEvents': [
  \    'TextChangedI', 'TextChangedP', 'CmdlineChanged'
  \  ],
  \  'cmdlineSources': {
  \    ':': ['cmdline-history', 'cmdline']
  \  }
  \  })
  "\    'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'

" Keymaps for insert-mode completion
inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>

" Keymaps for normal-mode completion
nnoremap : <Cmd>call CommandlineConfigure()<CR>:

function CommandlineConfigure() abort
  cnoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
  cnoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y> <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e> <Cmd>call pum#map#cancel()<CR>
  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  silent! cunmap <C-n>
  silent! cunmap <C-p>
  silent! cunmap <C-y>
  silent! cunmap <C-e>
endfunction

call pum#set_option({
  \    'border': 'rounded',
  \    'padding': v:false,
  \  })

call ddc#custom#patch_global('sources', [
 \ 'vim-lsp',
 \ 'skkeleton',
 \ 'file',
 \ 'around',
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'A'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*',
 \ },
 \ 'file': {
 \   'mark': 'FILE',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*',
 \ },
 \ 'skkeleton': {
 \   'mark': 'SKK',
 \   'matchers': ['skkeleton'],
 \   'sorters': [],
 \ },
 \ 'cmdline': {
 \   'mark': 'CMD',
 \ },
 \ 'cmdline-history': {
 \   'mark': 'CMD-H',
 \ },
 \ })

call ddc#enable()

" You must set the default ui.
" Note: ff ui
" https://github.com/Shougo/ddu-ui-ff
call ddu#custom#patch_global({
    \ 'ui': 'ff',
    \ 'uiParams': {
    \   'ff': {
    \     'prompt': 'filter> ',
    \     'startFilter': v:true,
    \   },
    \   '_': {
    \     'split': 'floating', 
    \     'winRow': 5, 
    \     'winHeight': 10, 
    \     'winWidth': 80, 
    \     'floatingBorder': 'rounded', 
    \     'previewRow': 16, 
    \     'previewWidth': 80, 
    \     'previewFloating': v:true,
    \     'previewFloatingBorder': 'rounded', 
    \     'previewFloatingTitle': 'Preview', 
    \     'previewSplit': 'vertical', 
    \     'highlights': {
    \       'floating': 'String',
    \       'floatingBorder': 'String',
    \     }
    \   }
    \ },
    \ })
" You must set the default action.
" Note: file kind
" https://github.com/Shougo/ddu-kind-file
call ddu#custom#patch_global({
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \     'folder': {
    \       'defaultAction': 'expandItem',
    \     },
    \     'word': {
    \       'defaultAction': 'append',
    \     },
    \     'action': {
    \       'defaultAction': 'do',
    \     },
    \     'command_history': {
    \       'defaultAction': 'execute',
    \     },
    \     'joplin': {
    \        'defaultAction': 'open',
    \     }
    \   }
    \ })
" Specify matcher.
" Note: matcher_substring filter
" https://github.com/Shougo/ddu-filter-matcher_substring
call ddu#custom#patch_global({
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \       'ignoreCase': v:true
    \     },
    \   }
    \ })
" Set default sources
" Note: file source
" https://github.com/Shougo/ddu-buffer-file
"call ddu#custom#patch_global({
"    \ 'sources': [
"    \   {'name': 'file', 'params': {}},
"    \ ],
"    \ })

" Specify source with params
" Note: file_rec source
" https://github.com/Shougo/ddu-source-file_rec
call ddu#custom#patch_local('file_rec', {
    \   'sources': [{
    \   'name':'file_rec',
    \   'params': {
    \     'ignoredDirectories': ['.git', 'node_modules', ]
    \   },
    \   }],
    \})


" source param setting for ripgrep source
let jop_token = 'f1d41a2a4e4ce159d171f66d17e0ec9e4958b4a7eb62817e254071011ddd033f0ede462774a1ed58434d204547df6ff07023cd3fee7f8d3101cc723a03cba603'
call ddu#custom#patch_local('joplin_tree', {
    \  'ui': 'filer',
    \  'sources': [{
    \    'name': 'joplin_tree',
    \    'params': {
    \      'token': jop_token,
    \    },
    \  }],
    \  'sourceOptions': {
    \    '_': {
    \      'columns': ['filename'],
    \    },
    \  },
    \ })
call ddu#custom#patch_global({
    \   'sourceParams' : {
    \     'rg' : {
    \       'args': ['--json'],
    \       'volatile': v:true,
    \     },
    \   },
    \ })


nnoremap <silent> <Leader>ub :call ddu#start({'sources': [{'name': 'buffer'}]})<CR>
nnoremap <silent> <Leader>ur :call ddu#start({'sources': [{'name': 'register'}]})<CR>
nnoremap <silent> <Leader>ue :call ddu#start({'name': 'filer'})<CR>
nnoremap <silent> <Leader>uf :call ddu#start({'name': 'file_rec'})<CR>
nnoremap <silent> <Leader>ug :call ddu_rg#find()<CR>
nnoremap <silent> <Leader>uc :call ddu#start({'sources': [{'name': 'command_history'}]})<CR>
nnoremap <silent> <Leader>uj :call ddu#start({'name': 'joplin_tree'})<CR>
call ddu#custom#patch_local('filer', {
\  'ui': 'filer',
\  'sources': [
\    {'name': 'file', 'params': {}},
\  ],
\  'sourceOptions': {
\    '_': {
\      'columns': ['filename'],
\    },
\  },
\  'kindOptions': {
\    'file': {
\      'defaultAction': 'open',
\    },
\  },
\  'actionOptions': {
\    'narrow': {
\      'quit': v:true,
\    },
\  },
\ })

autocmd FileType ddu-ff call s:ddu_ff_my_settings()
function! s:ddu_ff_my_settings() abort
  nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> d
  \ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
  nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> p
  \ <Cmd>call ddu#ui#do_action('preview')<CR>
  nnoremap <buffer><silent> r
  \ <Cmd>call ddu#ui#do_action('refreshItems')<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> h
  \ <Cmd>echo('enter:open, q:quit, i:filter, d:action, p:preview r:refresh')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>close<CR>
endfunction

autocmd FileType ddu-filer call s:ddu_my_filer_settings()
function! s:ddu_my_filer_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent> d
        \ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> o
        \ <Cmd>call ddu#ui#do_action('expandItem', {'mode': 'toggle'})<CR>
  nnoremap <buffer><silent> p
        \ <Cmd>call ddu#ui#do_action('preview')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> h
        \ <Cmd>echo('enter:open, q:quit, space:select, o:expand, d:action, p:preview')<CR>
endfunction

colorscheme jellybeans
