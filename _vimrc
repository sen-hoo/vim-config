let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

if g:iswindows
set guifont=Monaco:h9
endif

"更改临时文件生成位置
if g:iswindows
set directory=$HOME
else 
set directory=~/tmp,/tmp
endif
"设置帮助语言
set helplang=cn

"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase

"行内替换
set gdefault

"搜索逐字符高亮
set incsearch

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline

"自动缩进
set noautoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"使用4个空格代替Tab
set expandtab
set softtabstop=4
"Tab键插入四个空格,仅PHP
autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4

"与Windows共享剪贴板
set clipboard+=unnamed


"编辑vimrc之后，重新加载
if g:iswindows
autocmd! bufwritepost _vimrc source $VIM/_vimrc
else
endif


"关闭vi一致性原则
set nocompatible
"设置退格键
set backspace=indent,eol,start

"##########插件管理 开始#############
filetype off 
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"#颜色插件
Plugin 'altercation/vim-colors-solarized'
"侧边栏
Plugin 'vim-scripts/taglist.vim'
"窗口管理
Plugin 'vim-scripts/winmanager'
"树形管理
Plugin 'vim-scripts/The-NERD-tree'
"代码注释插件
Plugin 'vim-scripts/DoxygenToolkit.vim'
"代码自动提示插件
Plugin 'Valloric/YouCompleteMe'


call vundle#end()
filetype plugin indent on
"##########插件管理 结束#############

"配色方案
syntax enable
set background=dark
if g:iswindows
colorscheme solarized
else
    if g:isGUI
        colorscheme solarized
    else
        colorscheme torte
    endif
endif

"######设置ctag
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap <F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags=C:\Vim_Projects\tags
set autochdir

"######设置taglist
let Tlist_WinWidth=25
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close=1
"映射快捷键F6，开启/关闭窗口
nmap <silent> <F6> :Tlist<CR>

"#####设置窗口管理插件
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth =25
nmap wm :WMToggle<cr>
"定义快捷键
nmap <silent> <F7> :WMToggle<cr>
"开启Vim时自动打开
"let g:AutoOpenWinManager = 1
 
"#####树形管理设置
nmap <silent> <F2> :NERDTreeMirror<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>
"窗口大小
let NERDTreeWinSize=25
"窗口位置
let NERDTreeWinPos='left'
"是否默认显示行号
let NERDTreeShowLineNumbers=1
"是否默认显示隐藏文件
let NERDTreeShowHidden=0
