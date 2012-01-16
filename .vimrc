" Brandon Liu's .vimrc
" Feel free to use!

" Necessary to get pathogen working
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
behave xterm

set encoding=utf-8
set backspace=indent,eol,start        " Backspace over everything.
set history=50
set ruler
set showcmd                  " display commands as they are typed
set incsearch                " search as you type
set viminfo='10,\"100,:20,%,n~/.viminfo    " Use viminfo
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " taken from :help fugitive-statusline

" When in GUI or terminal has colors, use syntax and search highlighting.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")    " If compiled with support for autocommands
  filetype plugin indent on

  autocmd FileType text setlocal textwidth=78

  " Always jump to last cursor position.
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
else          " If autocommands are not available
  set autoindent    " always set autoindenting on
endif

set mouse=a

" Use a common directory for backups and swp files
" Create it if it doesn't exist
silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups/
set directory=~/.vim_backups/

set autowrite " Automatically save before commands like :next
set cursorline " highlight cursor line
set expandtab
set hidden        " Keep buffers around after closing them
set ignorecase
set laststatus=2 " Always show the status line
set list     " show trailing whitespace and tabs
set listchars=tab:\|\ ,trail:•,extends:>,precedes:<,nbsp:+
set number
set shiftwidth=2
set shortmess=atI
set showcmd   " Display incomplete commands
set smartcase
set tabstop=2
set timeoutlen=250 " Time to wait after ESC
set visualbell
set wildmenu
set wildmode=list:longest,full  " bash-like command line tab completion

set splitbelow
set splitright

set pastetoggle=<F7>

" Make it easy to edit .vimrc anytime!
map <Leader>; :tabe $MYVIMRC<CR>

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t :tabnew <C-R>=expand("%:p:h") . "/" <CR>

" Tabular.vim plugin mappings
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

" Autoclosing
inoremap {<CR> {<CR>}<ESC>O

map <Leader>c :%s/\s\+$//<CR>:nohl<CR>

if has("mac")
  let loaded_taglist = 'no' "Disable ctags on OSX
endif

set shell=/bin/bash

set timeoutlen=600
set ttimeoutlen=50

" FILETYPES ==========
"au BufNewFile,BufRead *.mhtml set ft=mason
"au BufNewFile,BufRead *.mas set ft=mason
"au BufNewFile,BufRead *handler set ft=mason
au BufNewFile,BufRead *.cgi set ft=perl
au BufNewFile,BufRead *.tt,*.tt2 set ft=tt2html ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.php,*.phpt,*.htm,*.html set ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.js setlocal ts=4 sts=4 sw=4 expandtab
au BufNewFile,BufRead *.phpt set ft=php
au BufNewFile,BufRead *.py set noexpandtab
au BufNewFile,BufRead *.otl set ft=otl nolist noexpandtab smartindent tw=100
au BufNewFile,BufRead *.tex set nolist
au BufNewFile,BufRead *.dot set list smartindent
au BufNewFile,BufRead *.md set nolist
au BufReadPost fugitive://* set bufhidden=delete

let b:tt2_syn_tags = '\[% %] <!-- -->'

let g:haskell_indent_if = 2

" TeX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
"let g:Tex_ViewRuleComplete_dvi = 'evince $*.dvi &'
"let g:Tex_ViewRuleComplete_ps  = 'evince $*.ps &'
"let g:Tex_ViewRuleComplete_pdf = 'evince $*.pdf &'
"let g:Tex_AutoFolding = 0

" IDE functionality =====
"let g:NERDTreeSortOrder = ['\/$', '\.bib$', '\.tex$', '\.c$', '\.h$', '*', '\.d$', '\.swp$',  '\.bak$', '\~$']
let g:NERDTreeWinPos = 'right'
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
"map <Leader>e :MiniBufExplorer<cr>
"map <Leader>e :MiniBufExplorer<cr>
map <Leader>n :NERDTreeFind<cr>
map <Leader>N :NERDTreeToggle<cr>
map gb :bnext<cr>
map gB :bprev<cr>

nnoremap <silent> <Leader>V <Plug>VimroomToggle

" MAPPINGS ===========

" Tab to go forward in history, Shift-Tab to go backward.
nmap <Tab> <C-I>
nmap <S-Tab> <C-O>

" Make it easy to get back to normal mode:
inoremap jk <ESC>
inoremap kj <ESC>

" ZZ = save&quit, ZX = save
map ZX :w<CR>
map ZA :qa<CR>

" Easier browsing of long lines
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
noremap 0 g0
noremap ^ g^
noremap $ g$
nnoremap C cg$
nnoremap D dg$
nnoremap I g^i
nnoremap A g$a

noremap <C-Y> 5<C-Y>
noremap <C-E> 5<C-E>

" map control backspace to delete the previous word
imap <C-BS> <C-W>

" Make it easier to move between windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
imap <C-H> <Esc><C-W>h
imap <C-J> <Esc><C-W>j
imap <C-K> <Esc><C-W>k
imap <C-L> <Esc><C-W>l

" make it easier to append and prepend
nnoremap EA Ea
nnoremap BI Bi

" Make it easier to paste in insert mode
inoremap PPP <Esc>pa

" While shifting indent, stay in visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap <Space> I<Space><Esc>gv

" Undo and redo in insert mode
inoremap <C-u> <C-o>u
inoremap <C-u> <C-o><C-R>

" Emacs style mappings
inoremap <C-A> <C-O>^
cnoremap <C-A> <Home>

" If at end of a line of spaces, delete back to the previous line
" Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap <C-B> <Left>

" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap <C-D> <Del>

inoremap <C-E> <End>

" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
cnoremap <C-F> <Right>

" Make tab switching easier on macs
if has("mac")
	nmap <D-1> 1gt
	nmap <D-2> 2gt
	nmap <D-3> 3gt
	nmap <D-4> 4gt
	nmap <D-5> 5gt
	nmap <D-6> 6gt
	nmap <D-7> 7gt
	nmap <D-8> 8gt
	nmap <D-9> 9gt
endif

" shortcuts for taglist
map <F4> :TlistToggle<CR>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Ctrl-N to lint current PHP file
autocmd FileType php noremap <C-N> :w<CR>:!/usr/bin/env php %<CR>
" \m to run current file in PHP
autocmd FileType php noremap <Leader>m :w<CR>:!/usr/bin/env php -l %<CR>
" Ctrl-N to lint current Ruby file
autocmd FileType ruby noremap <C-N> :w<CR>:!/usr/bin/env ruby %<CR>
" \m to run current file in Ruby
autocmd FileType ruby noremap <Leader>m :w<CR>:!/usr/bin/env ruby -c %<CR>

" Use * register (clipboard) as default for y/d/p/x commands
" set clipboard=unnamed

" Word wrap lines
set formatoptions=1
set wrap
set linebreak

" Default fold method
set foldmethod=syntax
"set foldlevel=20
set foldlevel=20

function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser
noremap gb :OpenURL <cfile><CR>
noremap gG :OpenURL http://google.com/search?q=<cword><CR>
noremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

if has("gui_running")
" GUI ================
  "colors sienna
  "colors zenburn
  "colors lucius
  colors jellybeans
  set lines=70
  set columns=130

  if has("gui_gtk2")
    set guifont=Monaco\ 12
  elseif has("gui_win32")
    set guifont=Monaco:h10:cANSI
  else
    set guifont=Monaco:h12
  endif
  
else
" TERMINAL ===========
  " for default color scheme
  set background=dark
  
  if $SSH_CONNECTION == ""  " Local terminal
    set t_Co=256
  else            " Remote terminal
    "set t_Co=16
    set t_Co=256
  endif

  if &term == "screen-bce"  " Running in screen
    set ttymouse=xterm2
  endif

  "colors zenburn
  "colors lucius
  colors jellybeans
endif

"hi NonText cterm=NONE ctermfg=NONE
fu! SlowTerm(on)
  if a:on
    "set scrolljump=5
    set t_Co=2
    set noshowcmd
    set noruler
    set noincsearch
    set nohls
  else
    "set scrolljump=1
    set t_Co=256
    set showcmd
    set ruler
    set incsearch
    set hls
  endif
endfunction
" map <Leader>s :call SlowTerm(1)<CR>
" map <Leader>S :call SlowTerm(0)<CR>

set scrolljump=3
set scrolloff=5
"set cursorline
"noremap % :MatchParen<CR>%:NoMatchParen<CR>

"set winwidth=84
set winwidth=94
set winheight=24
set noequalalways

set textwidth=78
"set textwidth=88
set wrapmargin=2

" Search for tags file upwards (need +path_extra)
set tags=tags;

" Highlight long lines
" these can be very very slow on big files
"au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
"au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>90v.\+', -1)
