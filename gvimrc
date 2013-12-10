"{{{1 INIT
augroup GVIMRC
  autocmd!
augroup END

"{{{1 OPTIONS
set guicursor&
set guifont&
set guioptions=aAcM

"{{{1 COLORS
autocmd GVIMRC ColorScheme
  \ * if g:colors_name ==# 'vylight'
  \ |   highlight Subtle guifg=#dfdfdf
  \ |   highlight! link CursorColumn CursorLine
  \ |   highlight! link CursorLineNr ModeMsg
  \ |   highlight! link NonText Subtle
  \ |   highlight! link SneakPluginScope Visual
  \ |   highlight! link SneakPluginTarget Search
  \ |   highlight! link SpecialKey Subtle
  \ |   highlight! link TabLine StatusLineNC
  \ |   highlight! link TabLineSel ModeMsg
  \ |   highlight! link TablineFill StatusLineNC
  \ | endif

colorscheme vylight
