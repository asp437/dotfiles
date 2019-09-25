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

set hls " Search highlight
set is  " Incremental search

set nowrap " Disable word wraping
set cursorline " Highlight cursor line
set scrolloff=5 " Scroll offset around cursor
set encoding=utf-8 " Set default encoding to UTF-8
set colorcolumn=80 " Highlight right-most columnt for most code-styles (TODO: toggle)
syntax on " Enable syntax highlight
set relativenumber " Relative number of line
set nu " Show number of line

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
let g:spacegray_use_italic=1
colorscheme gruvbox

" TODO: Statusline
" TODO: nerdtree hotkeys
" TODO: tagbar(or smt) hotkeys
" TODO: Buffers and tabs hotkeys
" TODO: Build hotkeys
" TODO: Panel/Windows hotkeys
" TODO: Help for hotkeys

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
