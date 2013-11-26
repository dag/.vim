function! s:Edit(name, count)
  let l:dir = finddir(a:name, &cdpath, a:count)
  if !empty(l:dir)
    execute 'lcd' l:dir
    edit .
  else
    let l:file = findfile(a:name, &cdpath, a:count)
    if !empty(l:file)
      let l:dir = fnamemodify(l:file, ':p:h')
      let l:file = fnamemodify(l:file, ':t')
      execute 'lcd' l:dir
      execute 'edit' l:file
    endif
  endif
endfunction

function! s:Complete(arglead, cmdline, cursorpos)
  if a:arglead[0] ==# '/'
    return glob(a:arglead.'*', 0, 1)
  endif
  let l:names = []
  let l:seen = {}
  for l:path in split(&cdpath, ',', 1)
    if empty(l:path)
      let l:path = expand('%:h')
    endif
    for l:dir in glob(l:path.'/'.a:arglead.'*', 0, 1)
      let l:name = l:dir[len(l:path)+1:]
      if !has_key(l:seen, l:name)
        call add(l:names, l:name)
        let l:seen[l:name] = 1
      endif
    endfor
  endfor
  return l:names
endfunction

command! -complete=customlist,<SID>Complete -count -nargs=1
  \ Edit call <SID>Edit(<q-args>, <count>)
command! -complete=customlist,<SID>Complete -count -nargs=1
  \ New <count>Split <args>
command! -complete=customlist,<SID>Complete -count -nargs=1
  \ Split split <Bar> <count>Edit <args>
command! -complete=customlist,<SID>Complete -count -nargs=1
  \ Tab tab split <Bar> <count>Edit <args>
command! -complete=customlist,<SID>Complete -count -nargs=1
  \ Vnew <count>Vsplit <args>
command! -complete=customlist,<SID>Complete -count -nargs=1
  \ Vsplit vsplit <Bar> <count>Edit <args>
