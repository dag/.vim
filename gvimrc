set guicursor&
set guifont&
set guioptions=aAc

augroup GVIMRC
  autocmd!

  autocmd ColorScheme
    \ * highlight Subtle guifg=#dfdfdf
    \ | highlight! link CursorColumn CursorLine
    \ | highlight! link CursorLineNr ModeMsg
    \ | highlight! link NonText Subtle
    \ | highlight! link SneakPluginScope Visual
    \ | highlight! link SneakPluginTarget Search
    \ | highlight! link SpecialKey Subtle
    \ | highlight! link TabLine StatusLineNC
    \ | highlight! link TabLineSel ModeMsg
    \ | highlight! link TablineFill StatusLineNC
augroup END

colorscheme vylight
