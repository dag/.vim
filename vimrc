"{{{1 INIT
if has('vim_starting')
  filetype off

  let s:options = [&fileencodings, &ttyfast]
  set all&
  let [&fileencodings, &ttyfast] = s:options
  unlet s:options

  set runtimepath=$VIMRUNTIME
  set runtimepath^=$VIM/vimfiles runtimepath+=$VIM/vimfiles/after
  set runtimepath^=~/.vim/bundle/*/* runtimepath+=~/.vim/bundle/*/*/after
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
endif

augroup VIMRC
  autocmd!
augroup END

"{{{1 COLORS
autocmd VIMRC ColorScheme
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

"{{{1 OPTIONS
set autoindent
set autoread
set backspace=eol
set clipboard^=autoselectml clipboard^=unnamedplus
set guioptions+=M
set history=1000
set linebreak
set listchars=eol:$,tab:>-,trail:_,extends:>,precedes:<,nbsp:+
set notimeout
set ruler
set shell=/bin/sh
set shortmess=aoOtTI
set showcmd
set smarttab
set ttimeout
set ttimeoutlen=50
set undofile
set wildignore=*~,*.swp
set wildmenu

if executable('ag')
  set grepprg=ag
elseif executable('ack')
  set grepprg=ack
endif

if has('mouse')
  set mouse=a
endif

" XXX Hack for tmux in gnome-terminal
if !empty($TMUX) && $COLORTERM ==# 'gnome-terminal'
  execute "set t_kl=\<C-h>"
endif

let &breakat = " \t,;"
let &foldlevelstart = 99
let &listchars = "eol:\u23ce,tab:\u21e5 ,trail:\u2423,extends:\u203a,precedes:\u2039,nbsp:\u25fb"
let &showbreak = " \u21aa "

"{{{1 PLUGINS
let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_bufsettings = 'noma nomod nonu nornu nowrap ro nobl nolist'
let g:netrw_hide = 1

let g:tmux_navigator_no_mappings = 1

let g:unite_split_rule = 'botright'
let g:unite_winheight = 10

"{{{1 FILETYPES
let g:ghcmod_ghc_options = ['-fdefer-type-errors', '-isrc:test:tests', '-Wall']
let g:vim_indent_cont = 2

autocmd VIMRC FileType cabal,haskell compiler cabal
autocmd VIMRC FileType fish compiler fish
autocmd VIMRC FileType xml compiler xmllint

autocmd VIMRC FileType cabal let b:dispatch = 'cabal check'
autocmd VIMRC FileType haskell let b:dispatch = 'ghc -fno-code -isrc:test:tests -Wall %'

autocmd VIMRC FileType cabal,haskell setlocal expandtab shiftwidth=4
autocmd VIMRC FileType vim,xml setlocal expandtab shiftwidth=2

autocmd VIMRC FileType fish setlocal foldmethod=expr
autocmd VIMRC FileType vim setlocal foldmethod=marker

autocmd VIMRC FileType haskell setlocal omnifunc=necoghc#omnifunc

filetype plugin indent on
syntax enable

"{{{1 MAPPINGS
nnoremap <Leader> <Nop>
nnoremap <LocalLeader> <Nop>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
inoremap <C-c> <Esc>

nnoremap <silent> <Down> :<C-u>TmuxNavigateDown<CR>
nnoremap <silent> <Left> :<C-u>TmuxNavigateLeft<CR>
nnoremap <silent> <Right> :<C-u>TmuxNavigateRight<CR>
nnoremap <silent> <Up> :<C-u>TmuxNavigateUp<CR>

nnoremap <PageDown> <C-PageDown>
nnoremap <PageUp> <C-PageUp>

nnoremap h <C-w>
nnoremap j i<CR><Esc>
nnoremap k <Nop>
nnoremap l <Nop>

nnoremap <silent> kd :<C-u>Dispatch<CR>
nnoremap <silent> km :<C-u>Make<CR>

nnoremap <silent> lb :<C-u>Unite -buffer-name=buffer -no-split buffer<CR>
nnoremap <silent> lc :<C-u>Unite -buffer-name=change -no-split change<CR>
nnoremap <silent> ld :<C-u>Unite -buffer-name=directory -no-split -default-action=lcd directory directory/new<CR>
nnoremap <silent> lf :<C-u>Unite -buffer-name=file -no-split file file/new<CR>
nnoremap <silent> lh :<C-u>Unite -buffer-name=haddock haddock<CR>
nnoremap <silent> lH :<C-u>Unite -buffer-name=hoogle hoogle<CR>
nnoremap <silent> lj :<C-u>Unite -buffer-name=jump -no-split jump<CR>
nnoremap <silent> ll :<C-u>Unite -buffer-name=line -no-split line<CR>
nnoremap <silent> lr :<C-u>Unite -buffer-name=rec -no-split file_rec/async<CR>
nnoremap <silent> lt :<C-u>Unite -buffer-name=tab tab<CR>
nnoremap <silent> lu :<C-u>Unite -buffer-name=undo -no-split undo<CR>
nnoremap <silent> lw :<C-u>Unite -buffer-name=window window<CR>
