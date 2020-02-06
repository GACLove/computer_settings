"curl -fLo ~/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"vim下载和编译安装
"git clone git@github.com:vim/vim.git
"cd vim/
"./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
"make
"make install

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" option-list, :h option-list

"编码设置  
set enc=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  

"语言设置  
set langmenu=zh_CN.UTF-8  
set helplang=cn   

set cmdheight=2

set noeb  " 去掉输入错误的提示声音  
set confirm " 在处理未保存或只读文件的时候，弹出确认  
set nocompatible            " 关闭 vi 兼容模式
set backspace=indent,eol,start
syntax enable               " 开启语法高亮功能
syntax on                   " 自动语法高亮
set number                  " 显示行号
set cursorline              " 突出显示当前行     cul
"set cursorcolumn            " 高亮当前列        cuc
set ruler                   " 打开状态栏标尺
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
set nowritebackup
set nowb
set history=1024
"set paste                   " 粘贴时保持格式
set autoindent              " 继承前一行的缩进方式，特别适用于多行注释
set nowrap                  " 禁止折行
set fillchars=vert:\ ,stl:\ ,stlnc:\  "在被分割的窗口间显示空白，便于阅读
set fileformat=unix
set showmatch               " 高亮显示匹配的括号
set matchtime=10            " 高亮显示匹配的括号时间
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

set ttyfast                 " Improves smoothness of redrawing 
set lazyredraw              " Don't redraw while executing macros (good performance config)

" set foldmethod=indent  " 基于缩进进行代码折叠
set foldmethod=syntax   " 基于语法进行代码折叠
set nofoldenable        " 启动 vim 时关闭折叠代码

set whichwrap=h,l,b,s,<,>,[,]

set nospell               " turn spell check off

" set gcr=a:block-blinkon0 " 禁止光标闪烁

" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" set guifont=Courier_New:h11:cANSI  " 设置字体
" set guifontwide=新宋体:h11:cGB2312

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）  
" set mouse=a  
" set selection=exclusive  
" set selectmode=mouse,key

set clipboard=exclude:.* " 加快vim加载

set undofile
set undodir=~/.vim/.undo/

let mapleader=","  "set leader

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 复制当前文件/路径到剪贴板
nmap <Leader>fn :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
nmap <Leader>fp :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>

nmap <Leader>p "+p   " 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y  " 设置快捷键将系统剪贴板内容粘贴至vim


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

inoremap <leader><leader>w <Esc>:w<CR>
inoremap jj <Esc>`^

cnoremap w!! w !sudo tee % >/dev/null

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 配合：Plug 'chxuan/change-colorscheme'
map <F10> :NextColorScheme<CR>
map <F9>  :PreviousColorScheme<CR>


" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
if has("win16") || has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif


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


    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'

    Plug 'chxuan/change-colorscheme'  " 配色切换

    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'

    Plug 'tpope/vim-surround'
    if version >=704
        Plug 'tpope/vim-fugitive'
    endif
    Plug 'ekalinin/dockerfile.vim'

    Plug 'sbdchd/neoformat'

    Plug 'junegunn/fzf.vim'
    Plug 'kien/ctrlp.vim'

    Plug 'octol/vim-cpp-enhanced-highlight'

     " 注释说明 {{{
    "<leader>cc   加注释
    "<leader>cu   解开注释
    "<leader>c<space>  加上/解开注释, 智能判断
    "<leader>cy   先复制, 再注解(p可以进行黏贴)
    " 注释的时候自动加个空格, 强迫症必配
    "let g:NERDSpaceDelims=1
    " }}}
    Plug 'majutsushi/tagbar'
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
    Plug 'python-mode/python-mode'

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

    "git wrapper
    Plug 'brooth/far.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/vim-easy-align'   "对齐
    " Plug 'ryanoasis/vim-devicons'
    Plug 'kshenoy/vim-signature' " mark add signs

    if version >= 703 && has('lua')
        Plug 'Shougo/neocomplete.vim'
    endif

    " 代码补全工具
    Plug 'maralla/completor.vim'
    Plug 'mileszs/ack.vim'

    "LSP
    "coc.vim

call plug#end()
"}}}

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
"autocmd vimenter * NERDTree
nnoremap <C-E>     :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1 " 是否显示隐藏文件
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1 " 显示行号
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

let NERDTreeAutoDeleteBuffer=1 "删除文件时候自动删除文件对应的buffer
""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
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
" => NERDSpaceDelims
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = '<C-]>'
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length= 120


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
" need install universal-ctags/ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let tagbar_left=1
let g:tagbar_width = 32
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ss <Plug>(easymotion-s2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1


"/////////////////////////////////////////////////////////////////////////////
" Default colorscheme setup
"/////////////////////////////////////////////////////////////////////////////

if has('gui_running')
    set background=dark
else
    set background=dark
    set t_Co=256 " make sure our terminal use 256 color
    let g:solarized_termcolors = 256
endif
" colorscheme solarized
colorscheme delek

