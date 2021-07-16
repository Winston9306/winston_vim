" 关闭兼容模式
set nocompatible

set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释
set nowrap " 不自动换行

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启实时搜索
set incsearch
" 设置vim搜索选中的颜色
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全
set tags=./tags;,tags        " tag设置向上搜索
" svn blame选中行 映射按键
vmap bl :<C-U>!svn blame <C-R>=expand("%p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" use astyle to auto format cpp/h files
map <F5> :call CodeFormat()<CR>
func! CodeFormat()
	let lineNum = line(".")
	if &filetype == 'cpp' || &filetype == 'h' || &filetype == 'hpp'
		exec "%!astyle -A1 -s4 -k1 -YHNOUSpC"
	endif
	exec lineNum
endfunc

" 全局grep yagappan/grep.vim
let Grep_Default_Filelist = '*.c *.cpp *.mm *.h *.hpp *.proto'
nmap <silent><F3> :Rgrep<CR><CR><CR><CR>
imap <silent><F3> <ESC><F3>

"==============================================================
""Ctrl+A 切换cpp,h
"==============================================================
nmap <silent><C-A> :A<CR>
imap <silent><C-A> <ESC><C-A>
nmap <silent><C-A><C-S> :AS<CR>
imap <silent><C-A><C-S> <ESC><C-A><C-S>
nmap <silent><C-A><C-V> :AV<CR>
imap <silent><C-A><C-V> <ESC><C-A><C-V>

" auto format when save cpp/h files
autocmd BufWritePre,FileWritePre *.cpp,*.h,*.hpp ks|call CodeFormat()|'s

" 插件开始的位置
call plug#begin('~/.vim/plugged')

Plug 'yegappan/grep'
Plug 'vim-scripts/a.vim'

" 插件结束的位置，插件全部放在此行上面
call plug#end()
