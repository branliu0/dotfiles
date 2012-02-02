" Where all the plugins are specified, using Vundle

" Initialize vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ----------------------------
" Plugins, managed by Vundle!
" ----------------------------

Bundle 'gmarik/vundle'

" Movement
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sjbach/lusty'
Bundle 'kien/ctrlp.vim'

" UI enhancements
Bundle 'mutewinter/vim-indent-guides'
Bundle 'dickeytk/status.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Rykka/ColorV'
Bundle 'gregsexton/MatchTag'

"Vim enhancements
Bundle 'IndexedSearch'
Bundle 'xolox/vim-session'
Bundle 'mru.vim'

" Editing enhancements
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'int3/vim-taglist-plus'
Bundle 'matchit.zip'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'mattn/zencoding-vim'

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
Bundle 'corntrace/vjde'
Bundle 'wannesm/wmgraphviz.vim'
Bundle 'omlet.vim'
Bundle 'jcf/vim-latex'
Bundle 'vim-scripts/haskell.vim'
Bundle '2072/PHP-Indenting-for-VIm'

" Vim Text Objects
Bundle 'kana/vim-textobj-user'
Bundle 'argtextobj.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Integrations
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'

" Utilities, Dependencies
Bundle 'L9'
