"" Last update 26.06.2017 12:00
set nocompatible " Use vim, not vi

set hls " Search highlight
set is  " Incremental search

set showcmd " Show current command
set noswapfile " Disable .swp files

set nowrap " Disable word wraping

set t_Co=256 " Enable 256 colors
" set termguicolors " Enable True Color 

autocmd! bufwritepost $MYVIMRC source $MYVIMRC " Reload config after save
autocmd! bufwritepre $MYVIMRC call setline (1, '"" Last update '.strftime("%d.%m.%Y %H:%M")) " Add last edit time in the beginging of the file

" Show tab and other hidden symbols
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set cursorline  " Highlight cursor line
set scrolloff=5 " Scroll offset around cursor

set laststatus=2 " Enable statusbar
set showtabline=2 " Enable tab-bar
set noshowmode " Disable mode message below Powerline

set encoding=utf-8 " Set default encoding to UTF-8

" Configure tabs size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Hilight right-most column for most code-styles
set colorcolumn=80

set mouse=a " Enable mouse in console vim
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Buffer switching hotkeys
map <F5> :buffers<CR>
map! <F5> :buffers<CR>
map <F7> :bnext<CR>
map! <F7> :bnext<CR>
map <F6> :bprevious<CR>
map! <F6> :bprevious<CR>
map <F8> :bdelete<CR>
map! <F8> :bdelete<CR>

" Open NERDTree hotkey
map <F4> :NERDTreeFocus<CR>
map! <F4> :NERDTreeFocus<CR>

" Open TagBar hotkey
map <F3> :TagbarToggle<CR>
map! <F3> :TagbarToggle<CR>

" Pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pane resize
nnoremap <C-Up> :res +5<CR>
nnoremap <C-Down> :res -5<CR>
nnoremap <C-Left> :vertical res -5<CR>
nnoremap <C-Right> :vertical res +5<CR>

" Pane creation
nnoremap <C-W><C-[> :split<CR>
nnoremap <C-W><C-]> :vsplit<CR>

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

syntax on " Enable syntax highlight
set relativenumber
set nu    " Enable line numbers

" Configure FZF installation
set rtp+=~/.fzf

" Vundle configuration
filetype off " Required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim " Vundle runtime path
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Let's Vundle manages itself

" Powerline binding, requires powerline installed into the system (pip install
" powerline status)
Plugin 'powerline/powerline', {'rtp':'powerline/bindings/vim/'}

" Syntastic for syntax checks
Plugin 'vim-syntastic/syntastic'

" YouCompleteMe - powerfull autocomplete module
Plugin 'Valloric/YouCompleteMe'

" Gocode package for YouCompleteMe with additional features
Plugin 'fatih/vim-go'

" Color schemes
Plugin 'limadm/vim-blues'
Plugin 'lifepillar/vim-solarized8'
Plugin 'dikiaap/minimalist'
Plugin 'zcodes/vim-colors-basic'
Plugin 'nightsense/seabird'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'

" Sidebar with tree
Plugin 'scrooloose/nerdtree'

" Highlight unwanted spaces
" Plugin 'aserebryakov/filestyle'

" Git integration
Plugin 'tpope/vim-fugitive'

" Tags sidebar
Plugin 'majutsushi/tagbar'

" GLSL syntax highlighting
Plugin 'tikhomirov/vim-glsl'

" Vim Hooks for automatization
Plugin 'ahw/vim-hooks'

" Highlight tab indent
Plugin 'nathanaelkane/vim-indent-guides'

" Fuzzy finder
" Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Local vimrc for each project
Plugin 'embear/vim-localvimrc'

" Turn off temporirial Vundle environment
call vundle#end()
filetype plugin indent on

set background=dark
colorscheme gruvbox

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlat()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_lot_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe configuration
let g:ycm_confirm_extra_conf = 1

" fzf (Fuzzy Finder)
set rtp+=/usr/bin/fzf

" Respeciting .gitignore, .hgignore and svn:ignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Configure clang completer
" let g:clang_library_path='/usr/lib/clang/4.0.0/lib/linux'

set tags=./tags;,tags;
let g:easytags_dynamic_files = 1

" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" Auto SCope DB load
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

