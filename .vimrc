" vim:fdm=marker

set nocompatible

try
  colorscheme jellybeans
endtry


let mapleader="\<space>"  " Set , to the leader.

" {{{ Vundle Plugins

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'sjl/gundo.vim'
  " Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'Yggdroot/indentLine'

  " ---- {{{ NEW }}} ----

  Plugin 'tpope/vim-surround'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'ctrlp-py-matcher'
  " Plugin 'valloric/youcompleteme'
  Plugin 'mileszs/ack.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'mhinz/vim-signify'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'natebosch/vim-lsc'
  Plugin 'markonm/traces.vim'

  " Typescript Plugins
  Plugin 'Shougo/vimproc.vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'Quramy/tsuquyomi'
  Plugin 'junegunn/fzf'

  call vundle#end()

  " Load any local machine config, if it exists.
  if !empty(glob('~/.vimrc_local.vim'))
    source ~/.vimrc_local.vim
  endif

" }}}
" {{{ Plugin Mapping and Configuration

  nnoremap <leader>u :GundoToggle<CR>
  " nnoremap <leader>n :NERDTreeToggle<CR>

  let g:lsc_server_commands = {'java': '127.0.0.1:5800'}
  let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'FindReferences': 'gr',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'ShowHover': 'v:true',
    \ 'SignatureHelp': '<C-m>',
    \ 'Completion': 'completefunc',
    \}
  
  " Removed: \ 'PreviousReference': '<C-p>',

  " ---- {{{ CtrlP Settings }}} ----
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ --ignore .git5_specs
        \ --ignore review
        \ -g ""'

  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " ---- From Vim: Walking to Running
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
    \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
    \ }
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_root_markers = ['METADATA']
  let g:ctrlp_max_files = 30000
  let g:ctrlp_follow_symlinks = 1
  let g:ctrlp_switch_buffer = 2
  nmap <C-b> :CtrlPBuffer<CR>
  nmap <C-o> :CtrlPLine<CR>

  " ---- {{{ Typscript Settings}}} ----
  let g:tsuquyomi_use_dev_node_module = 2
  nnoremap <silent> <leader>h :echo tsuquyomi#hint()<CR>

  " ---- {{{ Syntastic Settings}}} ----

  let g:syntastic_mode_map = {'mode': 'passive'} " gpylint is slow. Run :SyntasticCheck.

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_python_checkers = ['pyflakes', 'gpylint']
  " ---- {{{ UltiSnips }}} ----
    let g:UltiSnipsEditSplit = "vertical"
    let g:UltiSnipsExpandTrigger = "<C-e>"
    let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
    let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
    let g:UltiSnipsJumpForwardTrigger = "<CR>"
    let g:UltiSnipsJumpBackwardsTrigger = "<C-s>"

  " ---- {{{ Signify Settings }}} ----
  let g:signify_vcs_list = ['perforce', 'hg', 'git']

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
  set shiftwidth=2  " Width of an indent.
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
  " set mouse=a  " Turn on the mouse!
  " set ttymouse=sgr

  set timeoutlen=1000 ttimeoutlen=0 " Shorten keypress timeout (faster Esc)

  " Python specific config

  autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2
  set colorcolumn=+1
  autocmd FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
  autocmd FileType python match OverLength /\%81v.*/

  syntax sync fromstart " Potential fix for syntax highlighting breaking.

  autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

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

  " Remove default mapings for J and K so that I can learn to stop using them
  " as 5j and 5k without clobbering files as soon as I open them.
  nnoremap J <Nop>
  nnoremap K <Nop>

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

  " Splits
  nnoremap <leader><_> :vsp<CR>
  nnoremap <leader>- :sp<CR>

 " ---- {{{ NetRW config }}} -----
 let g:netrw_banner = 0
 let g:netrw_liststyle = 3 " narrow
 let g:netrw_keepdir = 0 " Keep browsing dir the same as current directory
  
" }}}
" {{{ Open, Save, and Close Automation
  " Remove trailing whitespacesfrom python files on save.
  autocmd BufWrite *.py :%s/\s\+$// 

  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Automatically size splits to 115 width
  " autocmd WinEnter *.js vertical resize 85

  " Save session. Reopen session with vim -S. Reopens all windows.
  nnoremap <leader>s :mksession<CR>
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufEnter * lcd %:p:h  " Set current buffer's directory to working dir.

  set autoread " Automatically update file if external change is detected.
" {{{ Undo Settings }}}
  set undodir=~/.vim_undo
  set undolevels=5000
  set undofile

  let g:gundo_width = 60
  let g:gundo_preview_height = 40
  let g:gundo_right = 1
" {{{ Markdown Files }}}
  autocmd BufNewFile,BufRead *.md setlocal textwidth=80
  autocmd BufNewFile,BufRead *.md setfiletype markdown
" 
filetype plugin indent on  " Turns on filetype detection / indentation.
syntax on
