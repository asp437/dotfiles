"" Last update 14.06.2017 19:53
set nocompatible " Use vim, not vi

set hls " Search highlight
set is  " Incremental search

set showcmd " Show current command
set noswapfile " Disable .swp files

set nowrap " Disable word wraping

" set t_Co=256 " Enable 256 colors
set termguicolors " Enable True Color

autocmd! bufwritepost $MYVIMRC source $MYVIMRC " Reload config after save
autocmd! bufwritepre $MYVIMRC call setline (1, '"" Last update '.strftime("%d.%m.%Y %H:%M")) " Add last edit time in the beginging of the file

set cursorline  " Highlight cursor line
set scrolloff=5 " Scroll offset around cursor

set laststatus=2 " Enable statusbar
set showtabline=2 " Enable tab-bar
set noshowmode " Disable mode message below Powerline

set encoding=utf-8 " Set default encoding to UTF-8

" Configure tabs size
set tabstop=4
set shiftwidth=4
set expandtab

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

syntax on " Enable syntax highlight
set nu    " Enable line numbers

" Hightlight extra whitespaces
" highlight ExtraWhitespace ctermbg=red guibg=red
" autocm colorScheme * hightlight ExtraWhitespace ctermbg=reg guibg=red
" match ExtraWhitespace /\s\+$/

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

" Sidebar with tree
Plugin 'scrooloose/nerdtree'

" Highlight unwanted spaces
Plugin 'aserebryakov/filestyle'

" Git integration
Plugin 'tpope/vim-fugitive'

" Tags sidebar
Plugin 'majutsushi/tagbar'

" GLSL syntax highlighting
Plugin 'tikhomirov/vim-glsl'

" CTags generator
Plugin 'szw/vim-tags'

" Vim Hooks for automatization
Plugin 'ahw/vim-hooks'

" Highlight tab indent
Plugin 'nathanaelkane/vim-indent-guides'

" Turn off temporirial Vundle environment
call vundle#end()
filetype plugin indent on

colorscheme basic-dark
set background=dark

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

