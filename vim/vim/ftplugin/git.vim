silent! unmap <buffer> *

nnoremap <buffer> <silent> <C-J> :call search("commit")<CR>w
nnoremap <buffer> <silent> <C-K> 0:call search("commit", "b")<CR>w
