
"===============================================vi 之大道如我心之禅，==========================================================
"===============================================vi 之漫路即为禅修，  ==========================================================
"===============================================vi 之命令禅印于心，  ==========================================================
"===============================================未得此道者视之怪诞， ==========================================================
"===============================================与之为伴者洞其真谛， ==========================================================
"===============================================长修此道者巨变人生。 ==========================================================



if empty(glob('~/.config/nvim/plugged/'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif




" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
" begin of plugin

" vim color and themes
" =============================
Plug 'ajmwagar/vim-deus'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"==============================
"Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more 
Plug 'ryanoasis/vim-devicons'

Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'

"UltiSnips - The ultimate snippet solution for vim
Plug 'SirVer/ultisnips'
"The snippets for UltiSnips
Plug 'honza/vim-snippets'
"syntax highlighting for C++(including C++ 11/14/17 )
Plug 'octol/vim-cpp-enhanced-highlight'
"syntax highlight plugin
Plug 'jaxbot/semantic-highlight.vim'
"Vim plugin that display tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
"a tree explorer plugin for vim
Plug 'preservim/nerdtree'
"intellisense engine for vim8 & Neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"The undo history visualize for vim. There is medicine for repentance !!!😁😁😁
Plug 'mbbill/undotree'
"Provide easy code formatting in vim by integrating existing code formatter
Plug 'Chiel92/vim-autoformat'
"provide fzf support for vim, fzf is file find tool
Plug 'junegunn/fzf.vim'
"Vim plugin,insert or delete brackets,parens,quotes in pair
Plug 'jiangmiao/auto-pairs'
"A vim plugin to display the indention levels with thin vertical lines 
Plug 'Yggdroot/indentLine' 
Plug 'makerj/vim-pdf'
"css/less/sass/html color preview for vim 
Plug 'gko/vim-coloresque'

" end of plugin
" Initialize plugin system
call plug#end()

"==========
"====== rainbow configuration
"=========
let g:rainbow_active = 1


"==========
"======semantic configuration
"=========
nnoremap <F9>  :SemanticHighlightToggle<cr>
let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
:autocmd VimEnter *.sh,*vim*,*.html,*.htm.,*.h,*.c,*.cpp,*.js,*.py,*.php  SemanticHighlight

"==========
"====== indentLine configuration
"==========
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
"shortcut  <F7> toggle indentLine visualization
"使用快捷键 <F7>然后按enter 使缩进线可视化或者不可见
nnoremap <F7> :IndentLinesToggle<CR>

"==========
"====== configuration of plugin nerdtree
"==========
"nerdtree can explore file in vim
"nerdtree能在vim中浏览文件
"common manipulate  R  refresh derectory  I   display hide file   m     open"manipulate menu
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
map <F6> :NERDTreeToggle<CR>

"==========
"====== tagbar configuration
"==========
"set tagbar window on left of main window
" 设置 tagbar 窗口的位置出现在主编辑区的左边
let tagbar_left=1
"<F3>  toggle tagbar
" 设置显示／隐藏标签列表子窗口的快捷键。快捷键ctrl l
nnoremap <F3> :TagbarToggle<CR>
"set tagbar window  windth
" 设置标签子窗口的宽度
let tagbar_width=32
"tagbar window don't show verbose help information
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
"ctags would not auto creat tags for some special identifier,so you must define ctags creat tags for those identifier manually
" 设置 ctags 对哪些代码标识符生成标签
"configuration for c and c++
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"==========
"====== "undotree configuration
"==========
"use <F8> toggle undotree,you can also use other keyword
nnoremap <F8> :UndotreeToggle<cr>
"if you use g:persistent-undo command enable persistent undo,it will record your withdraw history into a file which locate in $HOM."/.undodir" 
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
if has("persistent_undo")
        set undodir=$HOME."/.undodir"
        set undofile
endif


"==========
"====== ultisnips configuration
"==========
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"shortcut shift e    expand code snippets and jump to next cursor position
"快捷键shift e展开代码模板 
let g:UltiSnipsExpandTrigger="<S-e>"
"快捷键shift e跳转光标至模板下一待输入位置
let g:UltiSnipsJumpForwardTrigger="<S-e>"
"快捷键shift d跳转光标至模板上一待输入位置
"shortcut shift d    jump to previous cursor position
let g:UltiSnipsJumpBackwardTrigger="<S-d>"
"the code snippets position,the second position is my coustomersnippets position
let g:UltiSnipsSnippetDirectories =[$HOME.'/.vim/plugged/vim-snippets', $HOME.'/.vim/UserCustomerSnippets' ]

"==========
"====== autoformat configuration
"==========
"if you want to debug this plugin, uncomment the blow line it will enable verbose mode convenient plugin debug
"let g:autoformat_verbosemode=1
"use <F12>  toggle autoformat
"使用快捷键 f12 开启代码格式化
noremap <F12> :Autoformat<CR>

"if you want to disable the fallback to vim's indent file, retabbing and removing trailing whitespace, set the following variables to 0.
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0

"sql format use sqlformat make sure you have installed sqlparse
let g:formatdef_sqlformat = '"sqlformat --keywords upper -"'
let g:formatters_sql = ['sqlformat']
"c format use clang-format make sure you have installed clang 
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_c = ['clangformat_google']

"==========
"====== fzf configuration
"==========
"use shortcut ctrl k to find file content and use shortcut esc to exit fzf
"快捷键 ctrl k 打开fzf进行文件内容查找，快捷键esc退出fzf窗口
"set rtp+=/usr/local/opt/fzf
"set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>
"noremap <C-t> :BTags<CR>
noremap <C-k> :LinesWithPreview<CR>
noremap <C-w> :Buffers<CR>
"noremap ; :History:<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)


command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)


command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'down': '40%',
  \     'options': '--with-nth 1 
  \                 --reverse 
  \                 --prompt "> " 
  \                 --preview-window="70%" 
  \                 --preview "
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
  \                     head -n 16"'
  \ })

"==========
"====== vim ariline configuration
"==========

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_powerline_fonts = 1

"====================================
"select a favorite theme and uncomment it, every theme have two style light and dark
"====================================

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256

" 配色方案
"================================
"colorscheme molokai
"================================
colorscheme deus
hi NonText ctermfg=gray guifg=grey10
"================================
"colorscheme gruvbox
"set bg=dark
"set bg=light
"================================

"==========
"====== vim configuration
"==========
"vim三种模式分别是文本edit模式，visual模式，normal模式 一些vim的操作 esc进行模式切换， normal模式下 y复制 u撤销 d剪切  i进入编辑模式 任何模式下home跳到行首 end跳到行尾
"=======================================
"use shortcut za collapse or expand code ,shortcut zM expand all collapse code and shortcut zR collapse all code 
"快捷键za 折叠或展开代码  zM展开所有折叠的代码  zR折叠所有展开的代码
"基于语法进行代码折叠
"set foldmethod=syntax
"基于缩进进行代码折叠
set foldmethod=indent
" 启动 vim 时关闭折叠代码
set foldlevel=99
set foldenable "set nofoldenable

"将当前目录跳转到当前打开文件的目录
let &t_ul=''
set autochdir

set autoindent
set indentexpr=
"only cursor position on sixth to the last line or sixth line enable scroll
set scrolloff=6
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set tw=0
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
"display commands that inputed
set showcmd
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set updatetime=1000
set virtualedit=block
:autocmd BufNewFile,BufRead *.html setlocal nowrap

"设置快捷键 shift o 进入粘贴模式，shift p退出粘贴模式，粘贴模式可以防止从网页复制内容到vim而出现奇怪的缩进问题，因为vim的缩减处理和一般文本编辑器不一样
"<cr>是enter键
nnoremap <S-o> :set paste<CR>
nnoremap <S-p> :set nopaste<CR>
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>

"开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
set smartcase
" 高亮显示搜索结果
set hlsearch
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 禁止折行
set nowrap    "set wrap
" 开启行号显示
set number
set relativenumber
" 高亮显示当前行/列
set cursorline
set colorcolumn=80
"set cursorcolumn
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符不扩展扩展为空格
set noexpandtab "set expandtab
"设置编辑时制表符占用空格数
set tabstop=2
set shiftwidth=2
set softtabstop=2
"Display some invisual characters like space tab etc
set list "set nolist
"set invisual characters forms that displays
set listchars=tab:\|\ ,trail:▫
"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on
"get crrect comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+
"========================================


"==========
"====== coc-vim configuration
"==========
"shortcut gd(definition) gy(type definition) gi(implementation) gf(references) goto code navigation
"快捷键 gd(definition ) gy(type definition) gi(implementation) gf(references) 用于完成在标识符之间的跳转

"let g:coc_global_extensions = ['coc-python',  'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-cssmodules', 'coc-phpls', 'coc-go', 'coc-clangd']
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-cssmodules ', 'coc-phpls', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-pyright', 'coc-go']

"let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-cssmodules ', 'coc-phpls', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank',  'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-pyright', 'coc-sourcekit',  'coc-flutter']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"解决启动稍微延迟问题       让coc服务，在neovim启动后，500ms后才启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})
"coc打开大文件卡死问题   超过0.5m的文件，禁用coc补全。
let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END
