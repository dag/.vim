if has('vim_starting')
  filetype off

  let s:options = [&fileencodings, &ttyfast]
  set all&
  let [&fileencodings, &ttyfast] = s:options
  unlet s:options

  set runtimepath=$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
  set runtimepath^=~/.vim/bundle/*/* runtimepath+=~/.vim/bundle/*/*/after
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
endif

set autoindent
set autoread
set backspace=eol
set clipboard^=autoselectml clipboard^=unnamedplus
set history=1000
set list
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

let &foldlevelstart = 99
let &listchars = "eol:\u21b5,tab:\u21e5 ,trail:\u2423,extends:\u203a,precedes:\u2039,nbsp:\u25fb"
let &showbreak = "\u2026"

let g:mapleader = 'l'
let g:maplocalleader = 'll'
let g:netrw_banner = 0
let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_bufsettings = 'noma nomod nonu nornu nowrap ro nobl nolist'
let g:netrw_hide = 1
let g:netrw_list_hide = '\~$,\.swp$'
let g:sneak#map_netrw = 0
let g:vim_indent_cont = 2

augroup VIMRC
  autocmd!

  autocmd FileType cabal,haskell compiler cabal
  autocmd FileType fish compiler fish
  autocmd FileType xml compiler xmllint

  autocmd FileType cabal,haskell setlocal expandtab shiftwidth=4
  autocmd FileType vim,xml setlocal expandtab shiftwidth=2

  autocmd FileType fish setlocal foldmethod=expr
  autocmd FileType vim setlocal foldmethod=marker
augroup END

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
inoremap <C-c> <Esc>
nnoremap <Bar> gT
nnoremap <Bslash> gt
nnoremap h <C-w>
nnoremap j i<CR><Esc>
nnoremap l <Nop>

filetype plugin indent on
syntax enable
