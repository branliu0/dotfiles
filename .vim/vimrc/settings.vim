" All the Vim settings go here!

set autoindent                        " always set autoindenting on
set autoread                          " Refresh buffer if file has been changed externally. Note that this doesn't automatically run every some interval.
set autowrite                         " Automatically save before commands like :next
set backspace=indent,eol,start        " Backspace over everything.
set cursorline                        " highlight cursor line
set encoding=utf-8
set expandtab
set foldlevel=20
set foldmethod=syntax
set formatoptions=1
set hidden                            " Keep buffers around after closing them
set history=50
set hlsearch
set ignorecase
set incsearch                         " search as you type
set laststatus=2                      " Always show the status line
set linebreak
set list                              " show trailing whitespace and tabs
set listchars=tab:\|\ ,trail:•,extends:>,precedes:<,nbsp:+
set modelines=1
set mouse=a
set noequalalways
set number
set pastetoggle=<F7>
set ruler
set scrolljump=3
set scrolloff=5
set shell=/bin/bash
set shiftwidth=2
set shortmess=atI
set showcmd                           " Display incomplete commands
set showcmd                           " display commands as they are typed
set smartcase
set splitbelow
set splitright
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " taken from :help fugitive-statusline
set tabstop=2
set tags=./tags;/
set textwidth=78
set timeoutlen=250                    " Time to wait after ESC
set timeoutlen=600
set ttimeoutlen=50
set viminfo='10,\"100,:20,%,n~/.viminfo    " Use viminfo
set visualbell
set wildmenu
set wildmode=list:longest,full        " bash-like command line tab completion
set winheight=24
set winwidth=94
set wrap
set wrapmargin=2
