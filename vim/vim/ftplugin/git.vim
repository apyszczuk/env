silent! unmap <buffer> *

nnoremap <buffer> <silent> <C-J> :call search("commit")<CR>
nnoremap <buffer> <silent> <C-K> :call search("commit", "b")<CR>
