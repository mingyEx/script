"留着，万一哪天用到

"update,现代人都是搞这些的:
"https://github.com/tpope/vim-fugitive
"https://github.com/puremourning/vimspector
"https://github.com/Yggdroot/LeaderF
"https://github.com/neoclide/coc.nvim


set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')



" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'bling/vim-airline'
"let g:airline_theme="kolor"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_b = '%{strftime("%m/%d/%y - %H:%M")}' "显示系统时间
let g:airline#extensions#tabline#fnamemod = ':t' "开启了tabline条件下显示文件名而忽略路径

"关于折叠
set foldmethod=indent
au BufWinLeave * silent mkview " 保存文件的折叠状态
au BufRead * silent loadview " 恢复文件的折叠状态
nnoremap <space> za " 用空格来切换折叠状态
Plugin 'tmhedberg/SimpylFold'


"安装注释插件
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"F9设置为黏贴模式
set pastetoggle=<F9>

"全局搜索 c-p键执行，c-j,c-k上下翻

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}




Plugin 'Valloric/YouCompleteMe'

"我太懒了，懒得看官方文档，就先试试以前的能不能用吧
"Ycm的配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' "默认文件路径
let g:ycm_seed_identifiers_with_syntax = 1 "开启自动语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在注释中也开启补全
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"字符串中也开启补全
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"整合UltiSnips的提示
let g:ycm_use_ultisnips_completer = 1
"在实现和声明之间跳转,并分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <Leader>g :YcmCompleter GoTo<CR>
"与syntastic有冲突，建议关闭
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

"果然可以！,就先这样了，其他的再说～
"记录下位置出了问题看这里:https://github.com/Valloric/YouCompleteMe#user-guide

"这里是安装目录树
Plugin 'scrooloose/nerdtree'
autocmd vimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "没有文件时自动关闭
let NERDTreeShowBookmarks=2
set hidden
"The NERD tree
"F3触发，设置宽度为30,显示书签
map <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize = 30
let NERDTreeShowBookmarks = 1
"高亮当前行
let NERDTreeHighlightCursorline = 1
"从NERDTree打开文件后自动关闭NERDTree
let NERDTreeQuitOnOpen = 1
"显示隐藏文件
let g:NERDTreeShowHidden = 1
"忽略特定文件和目录
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
\ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
"显示行号
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
"哦耶这个也没出问题！
"
"下面是自动补全符号
Bundle 'Raimondi/delimitMate'
"可用哈哈
"
"然后呢，现在是生成大纲的插件
Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
\ 'kinds' : [
\ 'm:modules',
\ 'c:classes',
\ 'd:describes',
\ 'C:contexts',
\ 'f:methods',
\ 'F:singleton methods'
\ ]
\ }

"这里是安装缩进显示
Plugin 'nathanaelkane/vim-indent-guides'
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
" gvim下的彩色
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"这里是c++的语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1 "这个是使类作用域高亮
let g:cpp_member_variable_highlight = 1 "成员变量高亮
let g:cpp_class_decl_highlight = 1 "成员名高亮
let g:cpp_experimental_template_highlight = 1 "这个是魔板的高亮
let g:cpp_concepts_highlight = 1 "库函数高亮
let g:cpp_no_function_highlight = 1 "用户函数高亮

Plugin 'scrooloose/syntastic' "这里是google语法检测的Py脚本
let g:syntastic_cpp_compiler = 'clang++'

"这里是把括号变彩色
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"

" All of your Plugins must be added before the following line
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"下面是以前的设置的提纯版的保留区
let g:syntastic_auto_jump = 1
set number
set encoding=utf-8
"set textwidth=80 "自动换行
"set relativenumber "使vim对当前行显示绝对行号，对其他行显示相对行号
set number"显示行号
set shortmess =alt "不显示乌干达
syntax enable
syntax on "语法高亮
set mouse=a "设置鼠标可用
set mouse=v "设置鼠标可右键
set mouse=i
set nocp "设置兼容
set backspace=indent,eol,start
set autoindent "开启新行时自动缩进
set smartindent "新行时自动对齐
set ruler "显示标尺
set splitbelow
set splitright
set nocompatible "去掉vi一致性
set cindent "开启c语法检查
set cursorline "光标行颜色设置
set cursorcolumn "光标元素设置
set laststatus=2 "显示状态栏
set si "自动缩进
set showmatch "代码匹配
set incsearch
set hlsearch
set expandtab
set shiftwidth=4
set tabstop=4 "设置tab和缩进空格数
set hls "检索时高亮显示匹配项
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80"可以设置自动换行，只在英文下有效
set expandtab
set autoindent
set fileformat=unix
"set statusline=format
"set statusline=[路径=%F]/[修改过=%m]/[只读%r]/%h[预览窗口=%w]/[FORMAT=%{&ff}]/[缓冲区文件类型=%Y]/[ASCII=/%03.3b]/[HEX=/%02.2B]/[POS=%04l,%04v][%p%%]/[缓冲区行数=%L]/时间:%-16{strftime(\"%Y-%m-%d\ %H:%M\")}"
"状态栏设置
imap { {}<ESC>i<CR><ESC>O<TAB><BackSpace>
nnoremap &lt;C-J&gt; &lt;C-W&gt;&lt;C-J&gt; &quot;Ctrl-j to move down a split
nnoremap &lt;C-K&gt; &lt;C-W&gt;&lt;C-K&gt; &quot;Ctrl-k to move up a split
nnoremap &lt;C-L&gt; &lt;C-W&gt;&lt;C-L&gt; &quot;Ctrl-l to move right a split
nnoremap &lt;C-H&gt; &lt;C-W&gt;&lt;C-H&gt; &quot;Ctrl-h to move left a split
nnoremap <F6> <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out &&/tmp/a.out<CR>"运行
nnoremap <F7> <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out><CR>"编译
"将用ctrl+w hjkl的在窗口间跳转映射为ctrl+hjkl跳转窗口

hi CursorLine cterm=NONE Ctermbg=darkgray ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE
highlight Pmenu ctermfg=green ctermbg=black guifg=white guibg=red
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
hi StatusLine ctermfg=darkred ctermbg=blue
hi StaTusLineNC ctermfg=blue ctermbg=black
"colorscheme darkblue "可以在/usr/share/vim/vim74/colors/里查看可选
"这里是添加头文件的事件回调,根据后缀自动选择插入文件
function! AutoSetPlFileHead()
if expand("%:e") == "pl"
call setline(1,"\#!/usr/bin/perl")
endif
normal G
normal o
endfunc
function! AutoSetShFileHead()
if expand("%:e") =="sh"
call setline(1,"\#!/bin/bash")
endif
normal G
normal o
endfunc
function! AutoSetPyFileHead()
if expand("%:e") == "py"
call setline(1,"\#! /usr/bin/python3")
call setline(2,"\# encoding:utf-8")
endif
normal G
normal o
endfunc
func! SetHeader()
if expand("%:e") == "cpp"
call setline(1,"#include<bits/stdc++.h>")
call setline(2,"using namespace std;")
call setline(3,"int main()")
call setline(4,"{")
call setline(5,"}")
endif
normal G
normal O
endfunc
func! SetCHeader()
if expand("%:e")=="c"
call setline(1,"#include<stdio.h>")
call setline(2,"#include<stdlib.h>")
call setline(3,"int main()")
call setline(4,"{")
call setline(5,"}")
endif
normal G
normal O
endfunc
autocmd BufNewFile *.sh exec ":call AutoSetShFileHead()"
autocmd BufNewFile *.py exec ":call AutoSetPyFileHead()"
autocmd BufNewFile *.cpp exec ":call SetHeader()"
autocmd BufNewFile *.c exec ":call SetCHeader()"
autocmd BufNewFile *.pl exec ":call AutoSetPlFileHead()"
filetype off
set nocompatible " be iMproved, required
filetype on
filetype plugin on " required
