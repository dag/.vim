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
  \ |   highlight! link CursorColumn CursorLine
  \ |   highlight! link CursorLineNr ModeMsg
  \ |   highlight! link NonText WarningMsg
  \ |   highlight! link SneakPluginScope Visual
  \ |   highlight! link SneakPluginTarget Search
  \ |   highlight! link SpecialKey WarningMsg
  \ |   highlight! link TabLine StatusLineNC
  \ |   highlight! link TabLineSel ModeMsg
  \ |   highlight! link TablineFill StatusLineNC
  \ | endif

colorscheme vylight
