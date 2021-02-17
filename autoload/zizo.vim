function! zizo#toggle()
    :only

    if g:zizo != 0
        let g:zizo = 0
        return
    endif

    let g:zizo = 1

    let l:grid = {
        \ 1: [1, 1],
        \ 2: [2, 1],
        \ 3: [3, 1],
        \ 4: [2, 2],
        \ 5: [3, 2],
        \ 6: [3, 2],
        \ 7: [4, 2],
        \ 8: [4, 2],
        \ 9: [3, 3],
        \ 10: [4, 3],
        \ 11: [4, 3],
        \ 12: [4, 3],
      \ }

    let l:buffers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
    let l:count = len(l:buffers)

    let l:col = l:grid[l:count][0]
    let l:row = l:grid[l:count][1]


    let l:index = 0
    silent exec "normal! :b" . l:buffers[l:index] . "\<CR>"
    for l:x in range(l:col - 1)
        :vsplit
        let l:index = l:index + 1
        if l:count <= l:index
            return
        endif
        silent exec "normal! :b" . l:buffers[l:index] . "\<CR>"
    endfor

    for l:x in range(l:col)
        for l:y in range(l:row - 1)
            :split
            let l:index = l:index + 1
            if l:count <= l:index
                return
            endif
            silent exec "normal! :b" . l:buffers[l:index] . "\<CR>"
        endfor
        silent exec "normal! \<C-w>\<C-h>"
    endfor
endfunction
