set nocompatible
behave xterm

set encoding=utf-8
set backspace=indent,eol,start        " Backspace over everything.
set history=50
set ruler
set showcmd                  " display commands as they are typed
set incsearch                " search as you type
set viminfo='10,\"100,:20,%,n~/.viminfo    " Use viminfo

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

set ignorecase
set smartcase

set tabstop=2
set shiftwidth=2
set expandtab
set number
set wildmenu
set wildmode=list:longest,full  " bash-like command line tab completion
set shortmess=atI
set autowrite " Automatically save before commands like :next
set showcmd   " Display incomplete commands
set cursorline " highlight cursor line
set listchars=tab:\|\ ,trail:•,extends:>,precedes:<,nbsp:+
set list     " show trailing whitespace and tabs
set timeoutlen=250 " Time to wait after ESC

set splitbelow
set splitright

set pastetoggle=<F7>

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t :tabnew <C-R>=expand("%:p:h") . "/" <CR>

" Autoclosing
inoremap {<CR> {<CR>}<ESC>O

" set autochdir
set hidden        " Keep buffers around after closing them

let loaded_taglist = 'no' "Disable ctags on OSX

set shell=/bin/bash

"set spell

set ttimeoutlen=50

" FILETYPES ==========
"au BufNewFile,BufRead *.mhtml set ft=mason
"au BufNewFile,BufRead *.mas set ft=mason
"au BufNewFile,BufRead *handler set ft=mason
au BufNewFile,BufRead *.cgi set ft=perl
au BufNewFile,BufRead *.tt,*.tt2 set ft=tt2html ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.php,*.phpt,*.htm,*.html set ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *.phpt set ft=php
au BufNewFile,BufRead *.py set noexpandtab

let b:tt2_syn_tags = '\[% %] <!-- -->'

" TeX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'dvi'
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
map <Leader>N :NERDTree<cr>
map gb :bnext<cr>
map gB :bprev<cr>

" MAPPINGS ===========

" Tab to go forward in history, Shift-Tab to go backward.
nmap <Tab> <C-I>
nmap <S-Tab> <C-O>

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

" make it easier to append and prepend
nnoremap EA Ea
nnoremap BI Bi

" shortcuts for taglist
map <F4> :TlistToggle<CR>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Ctrl-M to run current file in PHP
autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/env php %<CR>
" Ctrl-L to lint current PHP file
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
" Ctrl-L to lint current Ruby file
autocmd FileType ruby noremap <C-L> :!/usr/bin/env ruby -c %<CR>

" Use * register (clipboard) as default for y/d/p/x commands
"set cb+=unnamed

" Word wrap lines
set formatoptions=1
set wrap
set linebreak

" Default fold method
set foldmethod=syntax
"set foldlevel=20
set foldlevel=20

"nmap <Leader>b :let g:zenburn_high_Contrast=1<CR>:colors zenburn<CR>
"nmap <Leader>B :unlet g:zenburn_high_Contrast<CR>:colors zenburn<CR>
"let g:zenburn_high_Contrast=1

if has("gui_running")
" GUI ================
  "colors sienna
  "colors zenburn
  "colors lucius
  colors jellybeans
  set lines=50
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
