" Plugin-specific configurations go here

" CtrlP
let g:ctrlp_map = '<c-p>'

" vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" NERD_Commenter
" Add a space before comments
let g:NERDSpaceDelims = 1

" NERD_Tree
let g:NERDTreeWinPos = 'right'
map <Leader>n :NERDTreeFind<cr>

" Rainbow Parentheses
" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
let g:syntastic_javascript_checker = 'jshint'

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

" taglist
let g:Tlist_Ctags_Cmd = "all-ctags"
let Tlist_WinWidth = 'auto'
map <F4> :TlistToggle<CR>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ZenCoding
let g:user_zen_leader_key = '<c-t>'
