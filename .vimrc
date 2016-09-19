" Welcome to Vim (http://go/vim).

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

syntax on

try
  colorscheme molokai
catch  
endtry

let mapleader=","  " Set , to the leader.

"Load local vimrc configuration if present.
if filereadable("./.vimrc_local")
  source ./.vimrc_local
endif

"+--------------------------------+
"| Vundle Plugins
"+--------------------------------+
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline'
  Plugin 'tpope/vim-unimpaired'
  call vundle#end()
"+--------------------------------+
"| Plugin Mapping and Configuration
"+--------------------------------+
  nnoremap <leader>u :GundoToggle<CR>
  nnoremap <leader>n :NERDTreeToggle<CR>
  let g:airline_section_b="%{strftime('%c')}"
"+--------------------------------+
"| Tabs and Spaces 
"+--------------------------------+
  set tabstop=4     " Size (in spaces) of a <TAB> character.
  set softtabstop=4 " Number of spaces to add (in edit mode) when tab is pressed
  set expandtab     " Any <TAB> characters are expanded to spaces.
"+--------------------------------+
"| UI Config
"+--------------------------------+
  set number  " Show line numbers.
  set showcmd  " Show the last command used in the bottom right.
  set cursorline  " Highlight the line that the cursor is currently on.
  set foldcolumn=2  " Adds a bit of space to the left of the number line.
  set laststatus=2  " Always show the status line.
  set cmdheight=2  " Height of the command bar at the bottom.
 
  set backspace=indent,eol,start
  set hidden " Hide buffers rather than closing them.
  
  set wildmenu  " Command menu visual auto-complete.
  set lazyredraw  " Only redraw screen when necessary (not in the middle of a macro).
  set showmatch  " Highlight parenthesis pairs
  
  set noerrorbells " No error sound
  set novisualbell " No screen blink on error.
"+--------------------------------+
"| Searching and Replacing 
"+--------------------------------+
  set ignorecase " Ignore case when searching.
  set smartcase " What is smartcase?
  set incsearch " search as characters are entered
  set hlsearch " highlight matches
  set magic " Enabled regular expressions.
  " remove search highlights
  nnoremap <leader>/ :nohlsearch<CR>
"+--------------------------------+
"|  Folding (hide code blocks) 
"+--------------------------------+
  set foldenable  " Show folds.
  set foldnestmax=10  " Stop folding after x nested folds.
  set foldlevel=10 " Set the default fold level high (don't fold most folds) 
  set foldmethod=indent  " Folds based on indentation level. :help foldmethod for others.
  " Space shows/hides folds.
  noremap <space> za  
"+--------------------------------+
"| Movement
"+--------------------------------+
  " Move vertically by visual line. If a line is wrapped, 
  " this does not skip over the wrapped section to the 
  " next 'real' new line.
  nnoremap j gj
  nnoremap k gk
  " move to beginning/end of line
  nnoremap B ^l
  nnoremap E $h
  vnoremap B ^l
  vnoremap E $h
  " highlight last inserted text
  nnoremap gV `[v`]
  " Move lines up and down using Ctrl-jk
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==
"+--------------------------------+
"| Open, Save, and Close Automation
"+--------------------------------+
  " Remove trailing whitespacesfrom python files on save.
  autocmd BufWrite *.py :%s/\s\+$// 
  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Save session. Reopen session with vim -S. Reopens all windows.
  nnoremap <leader>s :mksession<CR>

filetype plugin indent on  " Turns on filetype detection / indentation.

