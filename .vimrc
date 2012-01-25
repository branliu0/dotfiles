" Brandon Liu's .vimrc
" Feel free to use!
set nocompatible
behave xterm
filetype plugin indent on
syntax on

source $HOME/.vim/vimrc/filetypes.vim
source $HOME/.vim/vimrc/looks.vim
source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/misc.vim
source $HOME/.vim/vimrc/plugin_configs.vim
source $HOME/.vim/vimrc/plugins.vim
source $HOME/.vim/vimrc/settings.vim

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
