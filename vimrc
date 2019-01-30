"vim下载和编译安装
"git clone git@github.com:vim/vim.git
"cd vim/
"./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
"make
"make install


" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set nocompatible            " 关闭 vi 兼容模式
syntax enable               " 开启语法高亮功能
syntax on                   " 自动语法高亮
set number                  " 显示行号
set cursorline              " 突出显示当前行     cul
"set cursorcolumn            " 高亮当前列        cuc
set ruler                   " 打开状态栏标尺
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
"set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set smartindent             " 开启新行时使用智能自动缩进
set noswapfile              " 关闭交换文件
set nobackup                " 关闭备份文件
set nowb
set history=1024
"set paste                   " 粘贴时保持格式
set autoindent              " 继承前一行的缩进方式，特别适用于多行注释
set nowrap                  " 取消换行
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set fileformat=unix
set showmatch               " 高亮显示匹配的括号
set nofoldenable            " 默认关闭代码折叠
set autoread                " 自动加载外部修改
set wildmenu                " Vim 命令行提示, 自身命令行模式智能补全
set showcmd                 " 状态栏显示当前执行的命令
set laststatus=2            " 总是显示状态栏

filetype on                 " 开启文件类型侦测
filetype plugin indent on   " 根据侦测到的不同类型加载对应的插件

filetype indent on          " 自适应不同语言的智能缩进
set expandtab               " 将制表符扩展为空格
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4

set lazyredraw              " Don't redraw while executing macros (good performance config)

"set foldmethod=indent  " 基于缩进进行代码折叠
set foldmethod=syntax   " 基于语法进行代码折叠
set nofoldenable        " 启动 vim 时关闭折叠代码

"set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"set guifont=Courier_New:h11:cANSI  " 设置字体
"set guifontwide=新宋体:h11:cGB2312

"set mouse=a 设置鼠标使用
set gcr=a:block-blinkon0 " 禁止光标闪烁

set undofile
set undodir=~/.vim/.undo//
"set my leader
let mapleader=","

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 复制当前文件/路径到剪贴板
nmap <Leader>fn :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
nmap <Leader>fp :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>
nmap <Leader>p "+p   " 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y " 设置快捷键将系统剪贴板内容粘贴至vim


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map  <F10> :NextColorScheme<CR>
map  <F9>  :PreviousColorScheme<CR>

"command W w !sudo tee % > /dev/null


" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" plugins {{{
call plug#begin('~/.vim/plugins')
    Plug 'vim-scripts/DrawIt'
    Plug 'tomasr/molokai'
    Plug 'altercation/vim-colors-solarized'
    Plug 'rickharris/vim-monokai'
	Plug 'chxuan/change-colorscheme'  " 配色切换
    Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tpope/vim-surround'
	Plug 'ekalinin/dockerfile.vim'
    Plug 'Chiel92/vim-autoformat'
	Plug 'junegunn/fzf'
	let g:ale_completion_enabled = 1
	Plug 'w0rp/ale'                  "Asynchronous Lint Engine
	Plug 'kien/ctrlp.vim'
	Plug 'powerline/powerline'
	Plug 'maralla/completor.vim'
	Plug 'scrooloose/nerdcommenter'
	" 注释说明 {{{
	"<leader>cc   加注释
	"<leader>cu   解开注释
	"<leader>c<space>  加上/解开注释, 智能判断
	"<leader>cy   先复制, 再注解(p可以进行黏贴)
	" 注释的时候自动加个空格, 强迫症必配
	"let g:NERDSpaceDelims=1
	" }}}
    Plug 'chxuan/tagbar'
    Plug 'derekwyatt/vim-fswitch'  "接口与实现快速切换
    Plug 'derekwyatt/vim-protodef'
    Plug 'lilydjwg/fcitx.vim'
    Plug 'dyng/ctrlsf.vim'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'yianwillis/vimcdoc'  	"中文帮助文档

    "markdown
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'} " Markdown 代码高亮，自动格式化
	Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} " Markdown 预览

    "python

    " html
    Plug 'othree/html5.vim',       { 'for': 'html' }
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'mattn/emmet-vim',        { 'for': [ 'html', 'vue', 'css' ] }

    "c c++
    Plug 'rhysd/vim-clang-format',           { 'for': [ 'c', 'cpp' ] }
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'c', 'cpp' ] }

    " javaScript
    Plug 'pangloss/vim-javascript',  { 'for': ['javascript'] }
    Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }

    " go
	Plug 'fatih/vim-go', { 'for': 'go' } " Golang

	" json
	Plug 'elzr/vim-json', { 'for': 'json'} " json 语法检查

	Plug 'junegunn/vim-easy-align'   "对齐

	Plug 'tpope/vim-fugitive' "git wrapper

    " 图标
    "Plug 'ryanoasis/vim-devicons'

call plug#end()
"}}}

""""""""""""""""""""""""""""""
" => ctrlp
""""""""""""""""""""""""""""""
let g:ctrlp_map = get(g:,'ctrlp_map', '<c-p>')
"if you have install ag, the g:ctrlp_custom_ignore will not work
let g:ctrlp_custom_ignore = get(g:, 'ctrlp_custom_ignore', {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|target|node_modules|te?mp$|logs?$|public$|dist$',
      \ 'file': '\v\.(exe|so|dll|ttf|png|gif|jpe?g|bpm)$|\-rplugin\~',
      \ 'link': 'some_bad_symbolic_links',
      \ })


""""""""""""""""""""""""""""""
" => vim-fswitch
""""""""""""""""""""""""""""""
nmap <silent> <Leader>sw :FSHere<cr>

""""""""""""""""""""""""""""""
" => vim-fswitch
""""""""""""""""""""""""""""""
"let g:multi_cursor_next_key            = '<C-m>'
"let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

""""""""""""""""""""""""""""""
" => ctrlsf
""""""""""""""""""""""""""""""
nnoremap <Leader>sp :CtrlSF<CR>


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
nnoremap <C-E>     :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1 " 是否显示隐藏文件
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let NERDTreeAutoCenter=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\~$','\.swp', '\.pyc$', '__pycache__']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔ ︎",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "? "
    \ }


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"异步语法检查
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用flake8进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\}
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>





colorscheme molokai
"colorscheme solarized
