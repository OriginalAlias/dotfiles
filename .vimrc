" Welcome to Vim (http://go/vim).

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim

" Glug in any internal plugins.
Glug youcompleteme-google

" Load Vundle plugin manager.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()

colorscheme molokai

" Enable file type based indent configuration and syntax highlighting.
syntax on

" Set the leader map early so it's used throughout the file.
let mapleader=","  " Set , to the leader.

" |----------------------------------
" | Tabs and Spaces 
" |----------------------------------

set tabstop=4     " Size (in spaces) of a <TAB> character.
set softtabstop=4 " Number of spaces to add (in edit mode) when tab is pressed
set expandtab     " Any <TAB> characters are expanded to spaces.

" |---------------------------------
" | UI Config
" |---------------------------------

set number  " Show line numbers.
set showcmd  " Show the last command used in the bottom right.
set cursorline  " Highlight the line that the cursor is currently on.
set foldcolumn=2  " Adds a bit of space between margin and text on the left.

filetype indent on  " Turns on filetype detection / indentation.

set wildmenu  " Command menu visual auto-complete.
set lazyredraw  " Only redraw screen when necessary (not in the middle of a macro).
set showmatch  " Highlight parenthesis pairs

set ruler  " Add ruler to the button right showing the line and column?
set cmdheight=2  " Height of the command bar at the bottom.

set noerrorbells " No error sound
set novisualbell " No screen blink on error.

" |---------------------------------
" | Searching and Replacing
" |---------------------------------

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set magic   " Enabled regular expressions.

" remove search highlights
nnoremap <leader>/ :nohlsearch<CR>

" |---------------------------------
" | Folding (hide code blocks)
" |---------------------------------

set foldenable  " Show folds.
set foldlevel=10  " Start folding at 10 lines deep.
set foldnestmax=10  " Stop folding after x nested folds.
set foldmethod=indent  " Folds based on indentation level. :help foldmethod for others.

" Space shows/hides folds.
noremap <space> za  

" |---------------------------------
" | Movement
" |---------------------------------

" Move vertically by visual line. If a line is wrapped, this does not skip over
" the wrapped section to the next 'real' new line.
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" |---------------------------------
" | Misc Stuff
" |---------------------------------

" Open undo history tree with gUndo.
nnoremap <leader>u :GundoToggle<CR>

" Save session. Reopen session with vim -S. Reopens all windows.
nnoremap <leader>s :mksession<CR>

map <leader>n :NERDTreeToggle<CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:airline_section_b="%{strftime('%c')}"

" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE
  endif
  return 
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \Line:\ %l\ \ Column:\ %c

