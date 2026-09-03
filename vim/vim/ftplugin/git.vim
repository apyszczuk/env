silent! unmap <buffer> *

nnoremap <buffer> <silent> <C-J> :call search("commit")<CR>w
nnoremap <buffer> <silent> <C-K> 0:call search("commit", "b")<CR>w
nnoremap <buffer> mgd :G difftool -y <C-R><C-W>^..<C-R><C-W><CR>
nnoremap <buffer> mgD :G difftool -y <C-R><C-W><CR>
