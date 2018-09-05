" Where all the plugins are specified, using Vundle

" Initialize vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ----------------------------
" Plugins, managed by Vundle!
" ----------------------------

" Use to manage plugins!
Bundle 'gmarik/vundle'

" ----------------
" --- Movement ---
" ----------------
" Easier vim motions. Try <Leader><Leader>w or <Leader><Leader>fo
Bundle 'Lokaltog/vim-easymotion'
" Like Command-T or fuzzyfinder. Use to fuzzy find files
Bundle 'kien/ctrlp.vim'

" -----------------------
" --- UI enhancements ---
" -----------------------
" File explorer within Vim
Bundle 'scrooloose/nerdtree'
" Ultimate Vim statusline utility
Bundle 'Lokaltog/vim-powerline'
" Highlights the matching HTML tag
Bundle 'gregsexton/MatchTag'
" Rainbow parentheses!! :)
Bundle 'kien/rainbow_parentheses.vim'

" ------------------------
" --- Vim enhancements ---
" ------------------------
" Shows 'Nth match out of M' for searches
Bundle 'IndexedSearch'
" Allow tab completion when searching
Bundle 'SearchComplete'
" Simple plugin to view most recently used files
Bundle 'mru.vim'
Bundle 'bufexplorer.zip'
Bundle 'airblade/vim-gitgutter'
" Adds visualizations for vim marks
Bundle 'kshenoy/vim-signature'

" ----------------------------
" --- Editing enhancements ---
" ----------------------------
" Shortcuts to comment code. Use <Leader>cc or <Leader>c<Space>
Bundle 'scrooloose/nerdcommenter'
" Simple shortcuts to deal with surrounding symbols
Bundle 'tpope/vim-surround'
" Text filtering and alignment
Bundle 'godlygeek/tabular'
" Insert-mode autocompletion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'
" Syntax checking in Vim!
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'matchit.zip'
" Bundle 'Valloric/YouCompleteMe'

" snipMate
Bundle 'garbas/vim-snipmate'
" snipMate dependences
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/snipmate-snippets'

" Language support
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'vimoutliner/vimoutliner'
Bundle 'wannesm/wmgraphviz.vim'
Bundle 'omlet.vim'
Bundle 'jcf/vim-latex'
Bundle 'vim-scripts/haskell.vim'
Bundle 'spf13/PIV'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'
Bundle 'klen/python-mode'
Bundle 'django.vim'

Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

" Vim Text Objects
Bundle 'bkad/CamelCaseMotion'

" Integrations
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-classpath'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'

" Utilities, Dependencies
Bundle 'L9'
