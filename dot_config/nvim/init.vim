"  ----Plugins----
call plug#begin('~/.local/share/nvim/plugins')
" Write list of plugins with comments
Plug 'prabirshrestha/async.vim'                         " Async jobs for vim and neovim
" ColorSchemes:
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'ajh17/Spacegray.vim'
Plug 'lifepillar/vim-solarized8'

" AutoComplete:
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Language Server Protocol client
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Plugin for async autocompletion via lsp

" Langs:
"   fatih/vim-go
"
" Other:
Plug 'itchyny/lightline.vim'                            " Lightweight statusline extension
"   scrooloose/nerdtree
"   vim-syntastic/syntastic
"   tpope/vim-fugitive
"   majutsushi/tagbar
"   tikhomirov/vim-glsl
"   nathanaelkane/vim-indent-guides
"   qpkorr/vim-bufkill
call plug#end()

" ----Basic options----
syntax on                                               " Enable syntax highlight
set nrformats=bin,hex                                   " Enable parsing of hex and bin numbers
set inccommand=nosplit                                  " Show effects of the command incrementally
set wildmenu                                            " Completion for command-line
set nojoinspaces                                        " Prevent inserting 2 spaces on a join (J)
set report=0                                            " Always report changed lines
set splitbelow                                          " Split below current window
set splitright                                          " Split right of the current window
" set spell                                               " Enable spell check
" set textwidth=0                                         " Hard-wrap long lines as you type them TODO: toggle

" Search Configuration:
set hls                                                 " Search highlight
set is                                                  " Incremental search
set smartcase                                           " Smart case search if there is upper

" IO Files Configuration:
set encoding=utf-8                                      " Set default encoding to UTF-8
set autoread                                            " Auto file reload if it was change outside of vim

" System Files Configuration:
set backupdir=.,~/.local/share/nvim/backup              " List of dirs for backups
set directory=~/.local/share/nvim/swap                  " Directory for swap files
set undodir=~/.local/share/nvim/undo                    " Directory for undo files
set sessionoptions-=options                             " Don't same options and mapping in mksession
set history=1000                                        " Size of history for vim commands

" Appearance Configuration:
set display=lastline                                    " Display lastline as much as possible
set nu                                                  " Show number of line
set colorcolumn=80                                      " Highlight right-most columnt for most code-styles (TODO: toggle)
set relativenumber                                      " Relative number of line
set scrolloff=5                                         " Scroll offset around cursor
set cursorline                                          " Highlight cursor line
set laststatus=2                                        " Always show statusline on last window
set list                                                " Show tabs and spaces
set ruler                                               " Show cursor position in status line
set showcmd                                             " Show partial command in last line
set tabpagemax=50                                       " Maximum number of tab pages
set lazyredraw                                          " Do not redraw on registers and macros
set linebreak                                           " Wrap lines at convenient points
set numberwidth=1                                       " Minimal line number width
set showfulltag                                         " Show tag and info in insert-mode completion
set showmatch                                           " Highlight matched bracket
set showmode                                            " Show current mode
set showtabline=2                                       " Always show tabline
set synmaxcol=128                                       " Highlight clumns (default 3000, 0 - no limit)
set title                                               " Set terminal's title
set termguicolors                                       " Enable True Color (TODO: Check this option)
" set belloff=all                                         " Disable bell for all events
" Show tab and other hidden symbols
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
endif

" Indent Wrap Configuration:
set autoindent                                          " Keep indent on new line
set nowrap                                              " Disable word wraping
set backspace=indent,eol,start                          " Allow backspacing over different entities
set formatoptions=tcqjo                                 " Format options: auto-wrap text and comments,
                                                        " remove comment market it is not useful,
                                                        " continue comment market on new line
set expandtab                                           " Use spaces for indent
set tabstop=4                                           " Length of tabulation
set shiftwidth=4                                        " Length of tabulation for autoindent

" Mouse Configuration:
set mouse=a                                             " Enable mouse in all modes

" Fold Configuration:
set foldenable                                          " Enable folds
set foldmethod=syntax                                   " Fold wrt syntax of files
set foldlevelstart=99                                   " Open all folds by default

" ----Appearance----
set background=dark " TODO: toggle
let g:gruvbox_italic=1                                  " Enables italic text
let g:gruvbox_bold=1                                    " Enables bold text
let g:gruvbox_underline=1                               " Enables underlined text
let g:gruvbox_undercurl=1                               " Enables undercurled text
let g:gruvbox_improved_warnings=1                       " Extra hilight warnings
let g:spacegray_use_italic=1                            " Enables italic text
" Apperance for statusline
let g:lightline = { 'colorscheme': 'Tomorrow_Night' }
colorscheme spacegray

" TODO: Statusline
" TODO: Tabline
" TODO: Nerdtree
" TODO: Auto update compile_commands for C/C++
" TODO: Help for hotkeys

" ----AutoCompleteServers----
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ 'go': ['gopls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd']
    \ }

let g:deoplete#enable_at_startup = 1                    " Enable deoplete completion

" ----Helper functions----

" ----Key bindings----
" Map leader keys
let maplocalleader=','
let mapleader=' '
let g:mapleader=' '

" Faster <esc> by pressing jk in insert mode
inoremap jk <esc>
" Disable macros recording
nnoremap q              <Nop>
" Do nohl on escape
nnoremap <Esc>          :nohlsearch<CR> 

" Toggles:
nnoremap <Leader>tw     :set list!<CR>
nnoremap <Leader>ts     :set spell!<CR>
" set colorcolumn=80                          " Highlight right-most columnt for most code-styles (TODO: toggle)
" set textwidth=0                             " Hard-wrap long lines as you type them TODO: toggle
" set background=dark " TODO: toggle
"
" Edits:
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>

" System:
nnoremap <Leader>sv :source $MYVIMRC<cr>

" Buffers:
" nnoremap <leader>sv :source $MYVIMRC<cr>
" TODO: Buffers and tabs hotkeys

" Windows:
" nnoremap <leader>sv :source $MYVIMRC<cr>
" TODO: Panel/Windows hotkeys
" TODO: Nerdtree hotkeys

" Git:
" nnoremap <leader>sv :source $MYVIMRC<cr>

" TODO: Build hotkeys?
