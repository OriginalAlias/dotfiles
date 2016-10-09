" vim:fdm=marker

set nocompatible

syntax on

try
  colorscheme jellybeans
endtry

let mapleader=","  " Set , to the leader.

" {{{ Vundle Plugins

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'Yggdroot/indentLine'

  " ---- {{{ NEW }}} ----

  Plugin 'tpope/vim-surround'
  Plugin 'ctrlpvim/ctrlp.vim'
  " Plugin 'valloric/youcompleteme'
  Plugin 'mileszs/ack.vim'
  Plugin 'christoomey/vim-tmux-navigator'

  call vundle#end()

  " Load any local machine config.
  exec 'source ~/.vimrc_local.vim'

" }}}
" {{{ Plugin Mapping and Configuration

  nnoremap <leader>u :GundoToggle<CR>
  nnoremap <leader>n :NERDTreeToggle<CR>

  " ---- {{{ Syntastic Settings}}} ----

  let g:syntastic_mode_map = {'mode': 'passive'} " gpylint is slow. Run :SyntasticCheck.

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_python_checkers = ['pyflakes', 'gpylint']

  " ---- {{{ Airline Settings }}} ----

  let g:airline#extensions#tabline#enabled = 1
  
  let g:airline#extensions#branch#empty_message  =  "no .git"
  let g:airline#extensions#whitespace#enabled    =  0
  let g:airline#extensions#tabline#enabled       =  1
  let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
  let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
  let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

  let g:airline_theme='bubblegum'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols.branch = '⎇'

" }}}
" {{{ Tabs and Spaces 

  set tabstop=4     " Size (in spaces) of a <TAB> character.
  set softtabstop=4 " Number of spaces to add (in edit mode) when tab is pressed
  set expandtab     " Any <TAB> characters are expanded to spaces.
  set smartindent
  set autoindent

" }}}
" {{{ UI Config

  set relativenumber number  " Show line numbers.
  set showcmd  " Show the last command used in the bottom right.
  set cursorline  " Highlight the line that the cursor is currently on.
  set foldcolumn=2  " Adds a bit of space to the left of the number line.
  set laststatus=2  " Always show the status line.
  set cmdheight=2  " Height of the command bar at the bottom.


  " Python specific config

  autocmd FileType python setlocal colorcolumn=81 tabstop=2 softtabstop=2
  autocmd FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
  autocmd FileType python match OverLength /\%81v.*/

  set backspace=indent,eol,start
  set hidden " Hide buffers rather than closing them.

  set wildmenu  " Command menu visual auto-complete.
  set lazyredraw  " Only redraw screen when necessary (not in the middle of a macro).
  set showmatch  " Highlight parenthesis pairs

  set noerrorbells " No error sound
  set novisualbell " No screen blink on error.

" }}}
" {{{ Searching and Replacing 

  set ignorecase " Ignore case when searching.
  set smartcase " What is smartcase?
  set incsearch " search as characters are entered
  set hlsearch " highlight matches
  set magic " Enabled regular expressions.

  " remove search highlights
  nnoremap <leader>/ :nohlsearch<CR>

" }}}
" {{{  Folding (hide code blocks) 

  set foldenable  " Show folds.
  set foldnestmax=10  " Stop folding after x nested folds.
  set foldlevel=10 " Set the default fold level high (don't fold most folds) 
  set foldmethod=indent  " Folds based on indentation level. :help foldmethod for others.
  " Space shows/hides folds.
  noremap <space> za  

" }}}
" {{{ Movement and Buffers 

  " ---- {{{ Normal and Visual Mode Navigation }}} ----

  " Move vertically by visual line. If a line is wrapped, 
  " this does not skip over the wrapped section to the 
  " next 'real' new line.
  nnoremap j gj
  nnoremap k gk
  
  " move to beginning/end of line
  nnoremap H ^
  nnoremap L g_
  nnoremap J 5j
  nnoremap K 5k

  " No shift before command!.
  nnoremap ; :

  " highlight last inserted text
  nnoremap gV `[v`]
  
  " Move lines up and down using Ctrl-jk
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==

  " ---- {{{ Buffer Navigation }}} ----

  nnoremap <F9> :bn<CR>
  nnoremap <F7> :bp<CR>

" }}}
" {{{ Open, Save, and Close Automation

  " Remove trailing whitespacesfrom python files on save.
  autocmd BufWrite *.py :%s/\s\+$// 

  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Save session. Reopen session with vim -S. Reopens all windows.
  nnoremap <leader>s :mksession<CR>
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufEnter * lcd %:p:h  " Set current buffer's directory to working dir.

  set autoread " Automatically update file if external change is detected.

" }}}
" {{{ Undo Settings

  set undodir=~/.vim_undo
  set undolevels=5000
  set undofile

  let g:gundo_width = 60
  let g:gundo_preview_height = 40
  let g:gundo_right = 1

" }}}

filetype plugin indent on  " Turns on filetype detection / indentation.
