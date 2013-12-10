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

let &foldlevelstart = 99
let &listchars = "eol:\u21b5,tab:\u21e5 ,trail:\u2423,extends:\u203a,precedes:\u2039,nbsp:\u25fb"
let &showbreak = "\u2026"

"{{{1 PLUGINS
let g:mapleader = '|'
let g:maplocalleader = '\'

let g:netrw_banner = 0
let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_bufsettings = 'noma nomod nonu nornu nowrap ro nobl nolist'
let g:netrw_hide = 1
let g:netrw_list_hide = '\~$,\.swp$'

let g:sneak#map_netrw = 0

let g:unite_split_rule = 'botright'
let g:unite_winheight = 10

"{{{1 FILETYPES
let g:vim_indent_cont = 2

autocmd VIMRC FileType cabal,haskell compiler cabal
autocmd VIMRC FileType fish compiler fish
autocmd VIMRC FileType xml compiler xmllint

autocmd VIMRC FileType cabal,haskell setlocal expandtab shiftwidth=4
autocmd VIMRC FileType vim,xml setlocal expandtab shiftwidth=2

autocmd VIMRC FileType fish setlocal foldmethod=expr
autocmd VIMRC FileType vim setlocal foldmethod=marker

filetype plugin indent on
syntax enable

"{{{1 MAPPINGS
nnoremap <Leader> <Nop>
nnoremap <LocalLeader> <Nop>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
inoremap <C-c> <Esc>

nnoremap - gt
nnoremap + gt
nnoremap _ gT

nnoremap h <C-w>
nnoremap j i<CR><Esc>
nnoremap k <Nop>
nnoremap l <Nop>

nnoremap <silent> kb :<C-u>Unite -buffer-name=buffer -no-split buffer<CR>
nnoremap <silent> kc :<C-u>Unite -buffer-name=change -no-split change<CR>
nnoremap <silent> kd :<C-u>Unite -buffer-name=directory -no-split -default-action=lcd directory directory/new<CR>
nnoremap <silent> kf :<C-u>Unite -buffer-name=file -no-split file file/new<CR>
nnoremap <silent> kj :<C-u>Unite -buffer-name=jump -no-split jump<CR>
nnoremap <silent> kl :<C-u>Unite -buffer-name=line -no-split line<CR>
nnoremap <silent> kr :<C-u>Unite -buffer-name=rec -no-split file_rec/async<CR>
nnoremap <silent> kt :<C-u>Unite -buffer-name=tab tab<CR>
nnoremap <silent> ku :<C-u>Unite -buffer-name=undo -no-split undo<CR>
nnoremap <silent> kw :<C-u>Unite -buffer-name=window window<CR>
