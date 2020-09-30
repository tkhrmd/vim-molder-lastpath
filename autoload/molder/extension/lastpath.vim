function! molder#extension#lastpath#init() abort
  let l:jumplist = getjumplist()[0]

  if !len(l:jumplist)
    return
  endif

  let l:lastjump = l:jumplist[len(l:jumplist) - 1]
  let l:lastpath = resolve(expand('#' . l:lastjump['bufnr'] . ':p'))

  let l:lastdir = fnamemodify(l:lastpath, ':p:h')
  let l:bufdir = resolve(expand('%:p:h'))

  if l:lastdir !=# l:bufdir
    return
  endif

  let l:lastfile = fnamemodify(l:lastpath, ':t')
  call search('\V\^'.escape(l:lastfile, '\').'\$', 'cw')
endfunction
