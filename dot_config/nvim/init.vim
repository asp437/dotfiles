" Temporary configuration of tabbing
set expandtab
set tabstop=4
set shiftwidth=4

call plug#begin('~/.local/share/nvim/plugins')
" Write list of plugins with comments
" ColorSchemes:
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'ajh17/Spacegray.vim'
Plug 'lifepillar/vim-solarized8'
" AutoComplete:
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Langs:
"   fatih/vim-go
"
" Other:
"   scrooloose/nerdtree
"   vim-syntastic/syntastic
"   tpope/vim-fugitive
"   majutsushi/tagbar
"   tikhomirov/vim-glsl
"   nathanaelkane/vim-indent-guides
"   qpkorr/vim-bufkill
call plug#end()

syntax on " Enable syntax highlight
set hls " Search highlight
set is  " Incremental search
set nowrap " Disable word wraping
set cursorline " Highlight cursor line
set scrolloff=5 " Scroll offset around cursor
set encoding=utf-8 " Set default encoding to UTF-8
set colorcolumn=80 " Highlight right-most columnt for most code-styles (TODO: toggle)
set relativenumber " Relative number of line
set nu " Show number of line
set autoindent      " Keep indent on new line
" set autoread        " Auto file reload if it was change outside of vim
set backspace=indent,eol,start " Allow backspacing over different entities
set backupdir=.,~/.local/share/nvim/backup " List of dirs for backups
" set belloff=all     " Disable bell for all events
" set complete-=i
" set directory=~/.local/share/nvim/swap
" set display=lastline
" set formatoptions=tcqj
" set history=1000
" set langnoremap
" set nolangremap
" set laststatus=2
" set list
" set nocompatible
" set nrformats=bin,hex
" set ruler
" set sessionoptions-=options
" set showcmd
" set tabpagemax=50
" set ttyfast
" set undodir=~/.local/share/nvim/undo
" set viminfo+=!
" set wildmenu

set formatoptions+=o    " Continue comment markers in new line
set inccommand=nosplit  " Show effects of the commdn incrementally
set lazyredraw          " Do not redraw on registers and macros
set linebreak           " Write lines at convenient points
" set modeline            " Enable modeline
set nojoinspaces        " Prevent inserting 2 spaces on a join (J)
set numberwidth=1       " Minimal line number width
" set report              " Always report changed lines
set showfulltag         " Show tag and info in insert-mode completion
set showmatch           " Highlight matched bracket
set showmode            " Show current mode
set showtabline=2       " Always show tabline
set smartcase           " Smart case search if there is upper
" set spell               " Enable spell check
set splitbelow          " Split below current window
set splitright          " Split right of the current window
set synmaxcol=128       " Highlight clumns (default 3000, 0 - no limit)
set textwidth=0         " Hard-wrap long lines as you type them
set title               " Set terminal's title
" set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

" Configure mouse
set mouse=a
set mousehide

" Fold configuration
set foldenable          " Enable folds
set foldmethod=syntax   " Fold wrt syntax of files
set foldlevelstart=99   " Open all folds by default

" Show tab and other hidden symbols
" TODO: toggle for this symbols
set list
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    " let &listchars = 'tab:> ,eol:¬,trail:~,extends:>,precedes:<,nbsp:.'
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
endif

" Appearance
set termguicolors " Enable True Color (TODO: Check this option)
set background=dark " TODO: toggle
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvboxx_undercurl=1
" let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:spacegray_use_italic=1
colorscheme gruvbox

" TODO: Statusline
" TODO: Tabline
" TODO: Buffers and tabs hotkeys
" TODO: Build hotkeys?
" TODO: Nerdtree
" TODO: Nerdtree hotkeys
" TODO: Panel/Windows hotkeys
" TODO: Auto update compile_commands for C/C++
" TODO: Help for hotkeys
" TODO: deoplete vs asynComplete
" TODO: vim-airline vs lightline
" TODO: vim-lsp vs LanguageClient-neovim

" AutoCompleteServers:
"GoLang
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
"Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
"Ruby
if executable('solargraph')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
"Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
endif
"C/C++
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
" Enable deoplete completion
let g:deoplete#enable_at_startup = 1
