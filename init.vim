
"================================================ vi 之大道如我心之禅，==========================================================
"================================================ vi 之漫路即为禅修，  ==========================================================
"================================================ vi 之命令禅印于心，  ==========================================================
"================================================ 未得此道者视之怪诞， ==========================================================
"================================================ 与之为伴者洞其真谛， ==========================================================
"================================================ 长修此道者巨变人生。 ==========================================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
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
" Taglist
Plug 'liuchengxu/vista.vim'
" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"git
Plug 'airblade/vim-gitgutter'
"Bookmark
Plug 'MattesGroeger/vim-bookmarks'
"end of plugin
" Initialize plugin system
call plug#end()

" =========
" ====== GitGutter
" =========
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap gf :GitGutterFold<CR>
nnoremap <space>g :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>

"==========
"====== markdown-preview
"=========
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"==========
"====== markdown settings
"==========
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" =========
" ===== vim-table-mode
" =========
noremap tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_corner ='|'
let g:table_mode_delimiter = ''
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

"==========
"====== rainbow configuration
"=========
let g:rainbow_active = 1

" ========
" ===== Vista.vim
" =======
noremap <silent> T :Vista!!<CR>
noremap <c-t> :silent! Vista finder<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" =========
" ====== vimspector
" =========
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" =========
" ====== vim-bookmarks
" =========
let g:bookmark_no_default_key_mappings = 1
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mi <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap mg <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

"==========
"======semantic configuration
"=========
nnoremap <silent> <space>h  :SemanticHighlightToggle<cr>
let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
:autocmd VimEnter *.sh,*vim*,*.html,*.htm.,*.h,*.c,*.cpp,*.js,*.py,*.php  SemanticHighlight

"==========
"====== indentLine configuration
"==========
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
"shortcut  <space>+v toggle indentLine visualization
nnoremap <space>v :IndentLinesToggle<CR>

"==========
"====== configuration of plugin nerdtree
"==========
"nerdtree can explore file in vim
"nerdtree能在vim中浏览文件
"common manipulate  R  refresh derectory  I   display hide file   m   open manipulate menu
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
map <space>f :NERDTreeToggle<CR>

"==========
"====== tagbar configuration
"==========
"set tagbar window on right of main window
" 设置 tagbar 窗口的位置出现在主编辑区的右边
let tagbar_left=0
"shortcut <space>+t  toggle tagbar
nnoremap <space>t :TagbarToggle<CR>
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
"use H toggle undotree,you can also use other keyword
nnoremap <S-h> :UndotreeToggle<cr>
"if you use g:persistent-undo command enable persistent undo,it will record your withdraw history into a file which locate in $HOM."/.undodir" 
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
if has("persistent_undo")
        set undodir=~/.config/nvim/undodir"
        set undofile
endif

"==========
"====== ultisnips configuration
"==========
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"shortcut  E   expand code snippets and jump to next cursor position
"快捷键E展开代码模板 
let g:UltiSnipsExpandTrigger="<S-e>"
"快捷键E跳转光标至模板下一待输入位置
let g:UltiSnipsJumpForwardTrigger="<S-e>"
"快捷键D跳转光标至模板上一待输入位置
"shortcut D    jump to previous cursor position
let g:UltiSnipsJumpBackwardTrigger="<S-d>"
"the code snippets position,the second position is my coustomersnippets position
let g:UltiSnipsSnippetDirectories =[$HOME.'/.config/nvim/plugged/vim-snippets', $HOME.'/.config/nvim/UserCustomerSnippets' ]

"==========
"====== autoformat configuration
"==========
"if you want to debug this plugin, uncomment the blow line it will enable verbose mode convenient plugin debug
"let g:autoformat_verbosemode=1
"use L  toggle autoformat
"使用快捷键 L 开启代码格式化
noremap <S-l> :Autoformat<CR>

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
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
noremap <C-p> :Files <CR>
noremap <C-m> :Files ~/<CR>
noremap <C-f> :Rg<CR>  "use Rg(ripgrep) to find
"noremap <C-f> :Ag<CR>  "use Ag(the_silver_searcher)
noremap <C-h> :History<CR>
"noremap <C-t> :BTags<CR> "<C-t> have mapped to vista
noremap <C-l> :Lines<CR>
noremap <C-w> :Buffers<CR>
"noremap <leader>; :History:<CR>
"noremap <C-p> :FZF<CR>
noremap <C-k> :LinesWithPreview<CR>
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

"==========
"====== vim ariline configuration
"==========

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
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
"map命令用来查看所有的键位映射，在定义一个键位映射时应该事先查看要定义的键位是否已经被映射。 比如我要定义k的映射，那么事先得查看一下k是否已经被映射 map k
"nnoremap noremap map nmap 用来定义键位映射
"=======================================
"快捷键za 折叠或展开代码  zM展开所有折叠的代码  zR折叠所有展开的代码
"基于语法进行代码折叠
"set foldmethod=syntax
"基于缩进进行代码折叠
set foldmethod=indent
" 启动 vim 时关闭折叠代码
set foldlevel=99
set foldenable "set nofoldenable

let &t_ul=''
"将当前目录跳转到当前打开文件的目录
set autochdir

"gutter (signcolumn) settings
"set signcolumn=no "only use signcolumn will display signcolumn,normally don't display it
"highlight clear SignColumn "set signcolumn colors same with backgroud colors

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set noswapfile "it will not save swap file
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
"display charcters that inputed
set showcmd
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set updatetime=1000
set virtualedit=block
"vim autocmd command will match events and auto execute specific command
:autocmd BufNewFile,BufRead *.html setlocal nowrap

"设置快捷键 shift o 进入粘贴模式，shift p退出粘贴模式，粘贴模式可以防止从网页复制内容到vim而出现奇怪的缩进问题，因为vim的缩减处理和一般文本编辑器不一样
"<cr>是enter键
nnoremap sp  :set paste<CR>
nnoremap P :set nopaste<CR>
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
map sh :split<CR>
map sv :vsplit<CR>
map <space><up> :res +5<CR>
map <space><down> :res -5<CR>
map <space><left> :vertical resize+5<CR>
map <space><right> :vertical resize-5<CR>
map tb :tabe<CR>
map tn :+tabnext<CR>
map tp :-tabnext<CR>
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
" 高亮显示当前行
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

" ==========
" ======= Terminal Behaviors
" =========
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" Compile function
noremap <S-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -Wall -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

"==========
"====== coc-vim configuration
"==========
"shortcut gd(definition) gy(type definition) gi(implementation) gf(references) goto code navigation
"快捷键 gd(definition ) gy(type definition) gi(implementation) gf(references) 用于完成在标识符之间的跳转

"let g:coc_global_extensions = ['coc-python',  'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-cssmodules', 'coc-phpls', 'coc-go', 'coc-clangd']
"let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-cssmodules ', 'coc-phpls', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank',  'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-pyright', 'coc-sourcekit',  'coc-flutter']
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-git', 'coc-gitignore', 'coc-translator', 'coc-python', 'coc-vimlsp', 'coc-phpls', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-pyright', 'coc-go']

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
nmap rn <Plug>(coc-rename)
" coc-translator
nmap ts <Plug>(coc-translator-p)
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
