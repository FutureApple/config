"关闭与vi的兼容模式
set nocompatible
"显示行号 
set number
"不自动折行 
set nowrap  
"显示匹配的括号  
set showmatch  
"距离顶部和底部3行  
set scrolloff=3 
"编码       
set encoding=utf-8  
"编码
set fenc=utf-8  
"启用鼠标    
set mouse=a       
"搜索高亮 
set hlsearch 
"语法高亮       
syntax on    
"Tab长度
set tabstop=4

" Plug插件安装
call plug#begin('~/.vim/plugged')
" Python补全插件
Plug 'davidhalter/jedi-vim'
" 目录树
Plug 'scrooloose/nerdtree'
" 状态栏
Plug 'vim-airline/vim-airline'
" 缩进线
Plug 'Yggdroot/indentLine'

" md预览
Plug 'iamcco/markdown-preview.vim'

call plug#end() 

" md预览配置
nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

" 目录文件导航NERD-Tree
" \nt 打开nerdree窗口，在左侧栏显示
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
 
"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc
