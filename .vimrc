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
call plug#end()
" coc auto completion
let g:coc_global_extensions = ['coc-json', 'coc-tsserver']
"设置leader
let mapleader=","
let g:mapleader=","

set nocompatible    " 关闭vi兼容模式
set autoindent      " 自动保持缩进
syntax on           " 语法高亮
colorscheme onedark " 主题
set number          " 设置行号
set tabstop=4       " 设置tab长度
set softtabstop=4   " tab转为空格的个数
set expandtab       " 自动将tab转为空格
set magic           " 显示括号配对情况
set softtabstop=4   " 使得按退格键时可以一次删掉 4 个空格
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

"不同文件类型的缩进
au FileType html,python,vim,javascript,phtml,yaml setl shiftwidth=2 tabstop=2 expandtab
au FileType java,php setl shiftwidth=4 tabstop=4 expandtab

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
