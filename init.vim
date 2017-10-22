scriptencoding utf-8

" Explicitly state paths for Pyenv
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Setup dein
if (!isdirectory(expand("$HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/bundle/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    call dein#add(s:plugin_dir . '/Shougo/dein.vim')

    call dein#add('morhetz/gruvbox')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('tweekmonster/deoplete-clang2')
    call dein#add('zchee/deoplete-go')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('c9s/perlomni.vim')

    call dein#add('embear/vim-localvimrc')

    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fz' })

    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    call dein#add('fatih/vim-go')

    call dein#add('qpkorr/vim-bufkill')

    if dein#check_install()
        call dein#install()
        let pluginsExist=1
    endif

    call dein#end()
    call dein#save_state()
endif

" Map leader keys
let maplocalleader=','
let mapleader=' '
let g:mapleader=' '

" Repeat default nvim settings
syntax on
set termguicolors
filetype plugin indent on
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=.,~/.local/share/nvim/backup
set belloff=all
set complete-=i
set directory=~/.local/share/nvim/swap
set display=lastline
set formatoptions=tcqj
set history=1000
set hlsearch
set incsearch
set langnoremap
set nolangremap
set laststatus=2
set list
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    " let &listchars = 'tab:> ,eol:¬,trail:~,extends:>,precedes:<,nbsp:.'
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
endif
set nocompatible
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set showcmd
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set undodir=~/.local/share/nvim/undo
set viminfo+=!
set wildmenu
set nowrap
set cursorline
set scrolloff=5
set relativenumber
set nu

" Other options
set formatoptions+=o                " Continue comment markers in new line
set gdefault                        " Set global flag for search and replace
set hidden                          " Hide buffers in background
set ignorecase                      " Case insensitive search
set inccommand=nosplit              " Show effects of the command incrementally
set lazyredraw                      " Do not redraw on registers and macros
set linebreak                       " Write lines at convenient points
set modeline                        " Enable modeline
set nojoinspaces                    " Prevent inserting 2 spaces on a join (J)
set nostartofline                   " Jump to first non-blank character
set numberwidth=1                   " Minimal line number width
set report=0                        " Always report changed lines
set showfulltag                     " Show tag and info in insert-mode completion
set showmatch                       " Highlight matched bracket
"set showmode                        " Show current mode
set showtabline=2                   " Always show tabline
set smartcase                       " Smart case search if there is upper
set spell                           " Enable spell check
set splitbelow                      " Split below current window
set splitright                      " Split right of the current window
set synmaxcol=128                   " Highlight columns (default 3000, 0 - no limit)
set textwidth=0                     " Hard-wrap long lines as you type them
set title                           " Set terminal's title
set whichwrap+=<,>,h,l              " Allow backspace and cursor keys to cross line boundaries

" Set mouse
set mouse=a
set mousehide

" Text settings
set fileencoding=utf-8              " UTF-8 on write
set expandtab                       " Use spaces instead of tabs
set tabstop=4                       " Show tabs as 4 spaces
set softtabstop=4                   " Tab key indents by 4 spaces
set shiftwidth=4                    " >> indents by 4 spaces
set shiftround                      " >> indents to the next multiple of shiftwidth

" Fold options
set foldenable                      " Enable folds
set foldmethod=syntax               " Fold via syntax of files
set foldlevelstart=99               " Open all folds by default

" Appearance
" Gruvbox
" set termguicolors
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_impoved_strings=1
let g:gruvbox_improved_warnings=1
set background=dark
colorscheme gruvbox

" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" Deoplete autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_menu_width = 50
let g:deoplete#auto_complete_delay = 100
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['around', 'member', 'tag']
let g:deoplete#sources.vim = ['vim', 'tag']
let g:deoplete#sources.python = ['jedi', 'tag']
let g:deoplete#sources.go = ['go', 'tag']
let g:deoplete#sources.c = ['clang2', 'tag']
let g:deoplete#sources.cpp = ['clang2', 'tag']
let g:deoplete#sources.perl = ['PerlOmni', 'tag']

let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#go#pointer = 1

let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g_alrline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tablie#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#layout = [
    \ [ 'a', 'error', 'warning', 'b', 'c' ],
    \ [ 'x', 'y', 'z' ]
    \ ]
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Buffer switching hotkeys
map <F5> :buffers<CR>
map! <F5> :buffers<CR>
map <F7> :bnext<CR>
map! <F7> :bnext<CR>
map <F6> :bprevious<CR>
map! <F6> :bprevious<CR>
map <F8> :BD<CR>
map! <F8> :BD<CR>

" FZF Extension key bindings
nnoremap <leader>p :Files<cr>
nnoremap <leader>. :Tags<cr>

" CScope key bindings
" Based on http://github.com/chazy/cscope_maps
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Auto CScope DB load
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

