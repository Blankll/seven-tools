" this is SEVEN's vim settings
" 插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'yggdroot/indentline'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" coc auto completion
let g:coc_global_extensions = ['coc-sh', 'coc-clangd', 'coc-json', 'coc-tsserver', 'coc-solargraph', 'coc-eslint']
"设置leader
let mapleader=","
let g:mapleader=","

" common settings
set nocompatible    " 关闭vi兼容模式
set autoindent      " 自动保持缩进
syntax on           " 语法高亮
colorscheme onedark " 主题
set number          " 设置行号
set tabstop=4       " 设置tab长度
set softtabstop=4   " tab转为空格的个数
set expandtab       " 自动将tab转为空格
set magic           " 显示括号配对情况
set nobackup        " 覆盖文件时不备份
set nowb
" set mouse=a         " 支持鼠标
set autochdir       " 自动切换目录到当前正在编辑的文件所属目录
set showmatch       " 括号自动匹配
set incsearch               " 输入搜索内容时就跳转到第一个输入结果
set hlsearch                " 搜索时高亮显示被找到的文
set nowrap                  " 关闭自动换行
set smartindent             " 开启新行时使用智能自动缩
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb18030   " 设置编码
" set showtabline=2 " 总是显示tab栏
set tabpagemax=15 " tab最大支持数量

"不同文件类型的缩进
au FileType html,python,vim,javascript,typescript,phtml,yaml,ruby,vue,sh setl shiftwidth=2 tabstop=2 expandtab
au FileType c,java,php setl shiftwidth=4 tabstop=4 expandtab

" file auto save
augroup autosave
    " autocmd! " clear all autocmds in this group line
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif " if the filetype is unset, set it to 'text' line
    autocmd FileType * autocmd InsertLeave <buffer> if &readonly == 0 | write | endif " When leaving insert and the file is writable, save the file
augroup END
" nerdtree setting
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
" airline setting
let g:airline_powerline_fonts = 1 " 正常显示箭头
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled=1
" easymotion setting
nmap ss <Plug>(easymotion-s2)
" 行级跳转
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" 行内跳转
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次动作
map <Leader><leader>. <Plug>(easymotion-repeat)

" tagbar setting
nnoremap <leader>t :TagbarToggle<CR>
" coc plugin
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" change fzf setting
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
" change cursor shap in mac iterm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:command Json %!jq .

" comment for filetype detection
filetype plugin on
