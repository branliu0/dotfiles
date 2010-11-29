" Vim color file
" Maintainer:  Ricky Wu <richiewu at live dot com>
" Last Change: 2009 July 15
" Version:     0.2

" This color scheme uses a light grey background.
" Based on "tango-morning" and "wargreycolorscheme" color scheme 
" Tango color palette : http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette
" The Terminal colors and GUI colors are diffrent defined.
" Optimized for PLI and vim syntax

" First remove all existing highlighting.
set background=light
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let colors_name = "colorzone"

"High Light For Normal
hi Normal  guifg=#2e3436 guibg=#eeeeec
hi NonText ctermfg=black guifg=#2e3436 guibg=#eeeeec

" Boolean constants: true FALSE ...
hi Boolean ctermfg=red guifg=red

" Character constants: 'A' 'b' ...
hi Character ctermfg=magenta guifg=magenta

" The condition-keywords: if switch endif ...
hi Conditional ctermfg=darkcyan guifg=#4e9a06

" Any other keywords: native assert ...
hi Keyword ctermfg=darkcyan guifg=#4e9a06

hi StatusLine   ctermbg=lightgrey ctermfg=green guibg=#d3d7cf guifg=black gui=none  

hi StatusLineNC ctermbg=darkgrey  ctermfg=green guibg=#d3d7cf guifg=#555753 gui=none

hi VertSplit cterm=none ctermfg=darkgray gui=reverse guibg=black guifg=#d3d7cf

hi Visual cterm=reverse gui=none guibg=#6b8e23 guifg=white

hi VisualNOS cterm=underline gui=underline

hi Cursor   cterm=reverse ctermbg=red ctermfg=white guibg=#ef2929 guifg=white
" [IM mode] The characters under the cursor
hi CursorIM cterm=reverse ctermbg=red ctermfg=white guibg=#ef2929 guifg=white

hi CursorLine   ctermfg=none ctermbg=none guibg=#555753
" The column that the cursor is in
hi CursorColumn ctermfg=none ctermbg=none guibg=#555753

" Any preprocessors like '#define' in C/C++ language
hi Macro ctermfg=darkmagenta guifg=darkmagenta

" The keywords recongnized as name space: public internal ...
hi NameSpace ctermfg=darkgreen guifg=darkgreen

" Any condition-preprocessors: #if #elseif ...
hi PreCondit ctermfg=cyan guifg=#4169e1

" The repeat-keywords: for each in ...
hi Repeat ctermfg=cyan guifg=#4e9a06

hi Directory ctermfg=darkcyan guifg=#3465a4

hi LineNr ctermfg=brown guifg=#729fcf

hi MatchParen ctermfg=brown guibg=#fcaf3e guifg=black

hi ModeMsg    ctermfg=red       guifg=red
hi MoreMsg    ctermfg=darkgreen guifg=#4e9a06
hi WarningMsg ctermfg=yellow    guifg=#cc0000
hi ErrorMsg   ctermfg=darkred   ctermbg=darkgray guibg=#cc0000 guifg=#eeeeec

"lightskyblue
"hi Pmenu ctermfg=blue ctermbg=none guibg=#87ceeb guifg=black
"olivedrab
hi Pmenu ctermfg=blue ctermbg=none guibg=#6b8e23 guifg=white

hi PmenuSel ctermfg=green ctermbg=none guibg=#ffa500 guifg=black
hi PmenuSbar ctermbg=none guibg=#c0c0c0 guifg=white
hi PmenuThumb ctermfg=darkcyan guibg=#c0c0c0 guifg=white
hi WildMenu   ctermfg=black ctermbg=darkcyan guibg=#edd400 guifg=#888a85

hi Question ctermfg=green guifg=#4e9a06

"hi Search    ctermfg=white ctermbg=LightRed guibg=#ff4500 guifg=white
hi Search    ctermfg=white ctermbg=LightRed guibg=#ffa500 guifg=black
hi IncSearch ctermfg=yellow ctermbg=green gui=reverse

hi SpecialKey ctermfg=darkcyan guifg=#3465a4

hi Title ctermfg=green guifg=#4e9a06

hi Folded ctermfg=grey ctermbg=none guibg=#d3d7cf guifg=#204a87

hi FoldColumn ctermfg=grey ctermbg=none guibg=#888a85 guifg=#204a87

hi DiffAdd ctermfg=green ctermbg=darkgray guifg=white guibg=#6b8e23

hi DiffChange ctermfg=yellow ctermbg=darkgrey guifg=white guibg=#f57900

hi DiffDelete ctermfg=black ctermbg=darkgrey guifg=white guibg=#cc0000

hi DiffText ctermfg=blue ctermbg=darkgrey guifg=white guibg=#3465a4 gui=none

" The word that does not recognized by the spellchecker
hi SpellBad	ctermfg=darkred guifg=darkred

" The word should starts with a capital
hi SpellCap	ctermfg=green guifg=green

" The word is recognized by the spellchecker and used in another region
hi SpellLocal ctermfg=brown guifg=brown

" The word is recognized by the spellchecker and hardly ever used
hi SpellRare ctermfg=yellow guifg=yellow

" The name of functions methods and classes ...
hi Function	ctermfg=blue guifg=blue

" Any preprocessors like '#define' in C/C++ language
hi Define ctermfg=blue guifg=blue

" Any debugging statement
hi Debug ctermfg=darkred guifg=darkred

" Colors for syntax highlighting
hi Comment  ctermfg=lightgrey guifg=#888a87 

" Any constants 
hi Constant ctermfg=red guifg=#ce5c00 

hi Identifier ctermfg=Yellow gui=none guifg=#000000

hi Statement ctermfg=Lightgreen gui=none guifg=#4e9a06

" The special characters within a constant
hi SpecialChar ctermfg=red guifg=red

" The special things within the comment
hi SpecialComment ctermfg=darkgray guifg=darkgray

hi PreProc ctermfg=LightCyan guifg=#dc143c

hi Type ctermfg=green gui=none guifg=#4e9a06

hi Special ctermfg=darkmagenta guifg=#ce5c00 guibg=#eeeeec

hi Underlined cterm=underline ctermfg=blue guifg=#204a87

hi Ignore ctermfg=grey ctermbg=darkgrey guifg=#555753

hi Error ctermfg=darkred ctermbg=darkgray guibg=#cc0000 guifg=#eeeeec

" Groups used in the 'highlight' and 'guicursor' options default value.

hi Todo ctermfg=yellow ctermbg=none guibg=#fce94f guifg=#204a87

" The preprocessors for indicating the included sources
hi Include ctermfg=red guifg=#ff7f50

" The exception-keywords: throws try finally ...
hi Exception ctermfg=darkmagenta guifg=darkmagenta

" The floating point constants: 6.67e-11
hi Float ctermfg=red guifg=red

hi Label ctermfg=yellow guifg=#c17d11

hi Delimiter ctermfg=yellow guifg=#4e9a06

hi Number ctermfg=red guifg=#729fcf

hi Operator ctermfg=red guifg=#ff0000

hi Builtin ctermfg=Lightblue guifg=#1e90ff

hi String ctermfg=white guifg=#ff4500

hi SQL_Statement  ctermfg=LightMagenta guifg=#9400d3
hi CICS_Statement ctermfg=LightMagenta guifg=#4e9a06

" [Table line] Not active table page label
hi TabLine ctermfg=red guifg=red
hi TabLineSel ctermfg=red guifg=red 

" [Table line] Where there are no labels
hi TabLineFill ctermfg=gray ctermbg=blue guifg=gray guibg=blue

" [Table line] Active table page label
hi TabLineFillSel ctermfg=blue guifg=blue

" Any tags which can use <C-]> on
hi Tag ctermfg=darkmagenta guifg=darkmagenta

" vim: sw=2
