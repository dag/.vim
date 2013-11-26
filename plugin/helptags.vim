function! s:Helptags()
  for l:dir in finddir('doc', &runtimepath, -1)
    silent! execute 'helptags' l:dir
  endfor
endfunction

command! Helptags call <SID>Helptags()
