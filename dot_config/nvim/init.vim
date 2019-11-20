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
Plug 'mengelbrecht/lightline-bufferline'                " Lightweight bufferline extension
Plug 'ryanoasis/vim-devicons'                           " Dev-icons in buffer line and other places
Plug 'scrooloose/nerdtree'                              " File navigator for vim
Plug '/usr/bin/fzf'                                     " Fuzzy search binary for following plugin
Plug 'junegunn/fzf.vim'                                 " Fuzzy search via fzf
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
set nospell                                             " Enable spell check
set textwidth=0                                         " Hard-wrap long lines as you type them

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
set colorcolumn=80                                      " Highlight right-most columnt for most code-styles
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
set termguicolors                                       " Enable True Color
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
set background=dark                                     " Default dark background
let g:gruvbox_italic=1                                  " Enables italic text
let g:gruvbox_bold=1                                    " Enables bold text
let g:gruvbox_underline=1                               " Enables underlined text
let g:gruvbox_undercurl=1                               " Enables undercurled text
let g:gruvbox_improved_warnings=1                       " Extra hilight warnings
let g:spacegray_use_italic=1                            " Enables italic text
let g:lightline = { 'colorscheme': 'Tomorrow_Night' }   " Apperance for statusline
let g:lightline.tabline = {'left': [['buffers']], 'right': [[]]} " Configure upper statusline content
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 1              " Show buffer numbers
let g:lightline#bufferline#enable_devicons = 1          " Enable special dev-icons
let g:lightline#bufferline#unicode_symbols = 1          " Enable unicode special symbols
colorscheme spacegray

" TODO: Statusline
" TODO: Tabline
" TODO: Nerdtree
" TODO: Auto update compile_commands for C/C++
" TODO: Help for hotkeys

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
function! ToggleColorcolumn()
    if (&colorcolumn)
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunction

function! ToggleHardwrap()
    if (&textwidth)
        set textwidth=0
    else
        set textwidth=120
    endif
endfunction

function! ToggleBackground()
    if (&background ==# 'dark')
        set background=light
    else
        set background=dark
    endif
endfunction

" ----Key bindings----
" Map leader keys
let maplocalleader=','
let mapleader=' '
let g:mapleader=' '

" Faster <esc> by pressing jk in insert mode
inoremap jk             <esc>
nnoremap q              <Nop>
nnoremap <Esc>          :nohlsearch<CR> 

" Toggles:
nnoremap <Leader>tl     :set list!<CR>
nnoremap <Leader>ts     :set spell!<CR>
nnoremap <Leader>tc     :call ToggleColorcolumn()<CR>
nnoremap <Leader>th     :call ToggleHardwrap()<CR>
nnoremap <Leader>tw     :set wrap!<CR>
nnoremap <Leader>tb     :call ToggleBackground()<CR>
nnoremap <Leader>te     :NERDTreeToggle<CR>
" TODO: tagbar
" nnoremap <Leader>tt     :NERDTreeToggle<CR>

" Edits:
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" System:
nnoremap <Leader>sr :source $MYVIMRC<CR>
nnoremap <Leader>st :split term://zsh<CR>
nnoremap <Leader>sh :vert help 
nnoremap <Leader>ss :checkhealth<CR>

" Buffers:
" nnoremap <leader>sv :source $MYVIMRC<cr>
" TODO: Buffers and tabs hotkeys
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>
" TODO: Create following mappings via loop
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
nnoremap <Leader>0 :b10<CR>

" Searching
nnoremap <Leader>sf :Files<CR>
nnoremap <Leader>sb :Buffers<CR>
nnoremap <Leader>ss :Rg<CR>
nnoremap <Leader>sc :Commands<CR>

" Windows:
" nnoremap <leader>sv :source $MYVIMRC<cr>
" TODO: Panel/Windows hotkeys

" Git:
" nnoremap <leader>sv :source $MYVIMRC<cr>

" TODO: Build hotkeys?
" Quick run
autocmd FileType      sh nnoremap <localleader>br :!bash %<CR>
autocmd FileType       c nnoremap <localleader>br :!gcc -std=c11   -w % -o /tmp/test && /tmp/test<CR>
autocmd FileType     cpp nnoremap <localleader>br :!g++ -std=c++17 -w % -o /tmp/test && /tmp/test<CR>
autocmd FileType    rust nnoremap <localleader>br :!cargo script %<CR>
autocmd FileType  python nnoremap <localleader>br :!python %<CR>
