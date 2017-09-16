" general
" open file and move to last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]\ [DATE=%2*%{strftime(\"%c\",getftime(expand(\"%%\")))}%1*]
set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]

let mapleader=";"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"zyx
set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"Powerline 
let g:Powerline_colorscheme='solarized256'

"indentGuides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"folder 
set foldmethod=syntax
set nofoldenable
"vim-fswitch
nmap <silent> <Leader>sw :FSHere<cr> 
"ctrlSF
nnoremap <Leader>sp :CtrlSF<CR>
"multi_cursor
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'
"nerdtree
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
"minibufexplorer
hi MBEChanged	guifg=#CD5907 guibg=fg
map <F3> :MBEToggle<cr>
map <F5> :MBEbn<cr>
map <F4> :MBEbp<cr>
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l
"tagbar
let tagbar_left=1
nnoremap <F6> :TagbarToggle<CR>
let tagbar_compact=1
let tagbar_sort=0
let g:tagbar_type_cpp={
	\ 'ctagstype' : 'c',
	\ 'kinds' : [
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
        \ 'x:externa'    
	\],
	\ 'sro'        : '::',
    \ 'kind2scope' : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 'u' : 'union'
    \ },
    \ 'scope2kind' : {
        \ 'enum'      : 'g',
        \ 'namespace' : 'n',
        \ 'class'     : 'c',
        \ 'union'     : 'u'
    \ }
\}

set background=dark
"colorscheme solarized
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nu
set tags=tags
set ts=4
set shiftwidth=4
set foldmethod=manual

syntax enable
syntax on
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" instant markdown view
" let g:instant_markdown_slow = 1
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_refresh_slow = 1 
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1



""NerdCommenter
""let g:NERDCustomDelimiters = {'z': { 'left': '/**','right': '*/'}}


"" YCM
"" YCM 补全菜单配色
"" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_cache_omnifunc = 0
let g:ycm_use_ultisnips_completer = 1
"" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库tags
"" set tags+=/data/misc/software/misc./vim/stdcpp.tags
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview
"" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
map <F9> :YcmCompleter GoToDeclaration<CR>
map <F10> :YcmCompleter GoToDeclaration<CR>
map <F8> :YcmCompleter GoToInclude<CR>
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/zyx/ble/mtk7697_v4-x/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/zyx/ble/mtk7697_v4.3/mtk7697_v4-x/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/zyx/ble/mtk7697_v4.3_2/mtk7697_v4-x/.ycm_extra_conf.py'
"poweline
"let g:Powerline_colorscheme='solarized256'


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'iamcco/mathjax-support-for-mkdp' 
Plugin 'iamcco/markdown-preview.vim' 
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/fcitx.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

" omnicppcomplete
set nocp
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
map ]] :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
map , :tnext<CR>
map == :%!astyle<CR>

set fileencodings=utf-8,gb2312,gbk.gb18030
set termencoding=utf-8
set encoding=utf-8


