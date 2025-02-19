" PATHOGEN
" let g:pathogen_disabled = ['vim-nerdtree']
execute pathogen#infect()


" EDITOR
syntax on
filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set noswapfile
set autoread
set splitbelow
set splitright
set hlsearch
set wildmenu
set wildoptions=pum
set showcmd
set scrolloff=1
set jumpoptions=stack
" add 's' because search count is all I need (provided by plugin)
set shm=filnxtToOSs

" TODO: dont know exactly what it does but public keyword in a class is not
" indented, and thats ok.
set cindent
set cinoptions=g0

set laststatus=2

set hidden
set noequalalways

set backspace+=indent,eol,start
set updatetime=100

set noesckeys
set incsearch

set timeout
set timeoutlen=1000
set ttimeoutlen=100

nnoremap g<C-L><C-S> :%s/<C-R><C-W>/
nnoremap <C-L><C-S> :%s/\<<C-R><C-W>\>/
vnoremap g<C-L><C-S> y:%s/<C-R>"/
vnoremap <C-L><C-S> y:%s/\<<C-R>"\>/

nnoremap <C-J> 10j
nnoremap <C-K> 10k

nnoremap mqn :cnext<CR>
nnoremap mqp :cprev<CR>
nnoremap mln :lnext<CR>
nnoremap mlp :lprev<CR>

nnoremap dD "_dd

nnoremap m0 :<C-u>registers<CR>:put<Space>

let g:tagbar_compact=2
let g:tagbar_position = 'topleft vertical'
let g:tagbar_autoclose=1

au FocusGained,BufEnter * :silent! !

augroup CursorLineActiveWindow
    autocmd!
    autocmd WinEnter,BufWinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END



" PLUGINS

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeWinSize=40
let NERDTreeCascadeSingleChildDir=0

" autocmd VimEnter * NERDTree
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <silent> <C-L><C-N> :NERDTreeToggle \| :horizontal wincmd =<CR>

let NERDTreeMapMenu='M'
nnoremap <silent> <C-L>nf :NERDTreeFind<CR>


" TAGBAR
nnoremap <silent> <C-N><C-T> :TagbarToggle<CR>


" ASYNC RUN
let g:asyncrun_open = 12

nnoremap mfw :AsyncRun! -strip grep --exclude-dir=.git -R -n <cword> .<CR>
command! -nargs=+ -complete=file Finder :call ffinder#find_file(<f-args>)

" DELIMITMATE
let delimitMate_expand_cr = 1


nnoremap <silent> mgl :Git log --graph --decorate<CR>
nnoremap <silent> mgL :vert Git log --graph --decorate<CR>



" BUFFER LIST
" map <silent> mi :call BufferList()<CR>


" ALTFN
" nnoremap <silent> ma :call AltFn_Switch ()<CR>
" nnoremap <silent> mA :call AltFn_SwitchHSplit ()<CR>
" nnoremap <silent> mQ :call AltFn_SwitchVSplit ()<CR>





" DEV

" let g:qfwindow_build_output_autoclose = 1

" function! Post_build_task()
"     let l:msg   = "Success: "
"     let l:st    = 0

"     if g:asyncrun_code != 0
"         let l:msg = "Failure: "
"         let l:st = 1 
"     else
"         let l:list = getqflist()
"         for item in l:list
"             if item["valid"] == 1
"                 let l:st = 1
"                 break
"             endif
"         endfor
"     endif

"     echo l:msg . &makeprg
"     if l:st == 0 && g:qfwindow_build_output_autoclose == 1
"         :ccl
"     endif

" endfunction

" function! s:remove_build_directory()
"     if input("Delete build? [yes/no]: ") == "yes"
"         call delete("build", "rf")
"     endif
" endfunction

" set tags=.vim-tmp/tags
" set makeprg=cmake\ -Bbuild\ -H.\ &&\ cmake\ --build\ build\ --\ -j8
" nnoremap <silent> mk :AsyncRun -program=make -post=call\ Post_build_task()<CR>:copen<CR>:wincmd J<CR>:25wincmd _<CR>
" nnoremap <silent> mk :AsyncRun -program=make -post=call\ Post_build_task()<CR>:copen<CR>
" nnoremap mC :call <SID>remove_build_directory()<CR>

" function! Generate_ctags ()
"     call system ("ctags -R --exclude=build --exclude=.git --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ --tag-relative=yes -f .vim-tmp/tags")
" endfunction

" function! Generate_cscope ()
"     call system ("cscope -Rb -f .vim-tmp/cscope.out -s .")
" endfunction

" function! Add_cscope ()
"     cs add .vim-tmp/cscope.out
" endfunction

" function! Update_cscope ()
"     cs reset
" endfunction

" nnoremap me :cs find s <C-R>=expand("<cword>")<CR><CR>
" nnoremap mU :call mkdir(".vim-tmp")<CR> :call Generate_ctags()<CR> :call Generate_cscope()<CR> :call Add_cscope()<CR>
" nnoremap mu :call Generate_ctags()<CR> :call Generate_cscope()<CR> :call Update_cscope()<CR>


set grepprg=internal
command! -nargs=+ Grepl :lgrep <args> | :lopen | :wincmd L

nnoremap m*  :Grepl  "\<<C-R>=expand("<cword>")<CR>\>" src/cpp/**<CR>
nnoremap mg* :Grepl  "<C-R>=expand("<cword>")<CR>" src/cpp/**<CR>

vnoremap m*  y:Grepl "\<<C-R>"\>" src/cpp/**<CR>
vnoremap mg* y:Grepl "<C-R>"" src/cpp/**<CR>


" COLORS

colorscheme gruvbox
set background=dark

hi Normal ctermbg=NONE ctermfg=252
hi StatusLine ctermbg=252 ctermfg=236
hi StatusLineNC ctermfg=234
hi CursorLine ctermbg=234
hi CursorLineNr ctermbg=234
hi TablineSel cterm=none ctermbg=237 ctermfg=222
hi TablineFill cterm=none ctermbg=235 ctermfg=252
hi Pmenu cterm=none ctermbg=none ctermfg=222
hi PmenuSel cterm=none ctermbg=234 ctermfg=220

" for buffer list
hi BufferSelected   ctermfg=252   ctermbg=NONE cterm=bold
hi BufferNormal     ctermfg=252   ctermbg=NONE cterm=NONE

hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC




hi DiffDelete   cterm=none ctermbg=none ctermfg=167
hi DiffAdd      cterm=none ctermbg=none ctermfg=142
hi DiffChange   cterm=none ctermbg=none ctermfg=108
hi DiffText     cterm=none ctermbg=none ctermfg=123





hi User1 ctermfg=007 ctermbg=236
hi User2 ctermfg=007 ctermbg=236
hi User3 ctermfg=236 ctermbg=236
hi User4 ctermfg=239 ctermbg=236

command! UploadToWKO :AsyncRun -cwd=bin -post=:ccl upload_to_wko

nnoremap mc :ccl<CR>
" nnoremap md :UploadToWKO<CR>
nnoremap <silent> md :bd<CR>

command! -nargs=1 -complete=help H :enew | :set buftype=help | :keepalt h <args>

" nnoremap <silent> ms :call quickhl#toggle_highlight_cword()<CR>


" <3
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

set history=1000

" because c_<C-F> has new meaning, and command window is still needed
exe "set cedit=\<C-O>"
set cmdwinheight=40





set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
" nnoremap me :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" nnoremap me :lcs find s <C-R>=expand("<cword>")<CR><CR> \| :lopen<CR> \| :wincmd p<CR>
nnoremap mE :cstag <C-R>=expand("<cword>")<CR><CR>




let g:ctrlp_match_current_file = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:30,max:30,results:50'
let g:ctrlp_working_path_mode = ''

let g:ctrlp_bufname_mod = ':~:p'
let g:ctrlp_bufpath_mod = ''
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_prompt_mappings =
\ {
\   'PrtDeleteEnt()':   ['<c-q>'],
\   'ToggleType(1)':    ['<c-up>'],
\   'ToggleType(-1)':   ['<c-down>'],
\   'PrtCurRight()':    ['<c-f>'],
\   'PrtCurLeft()':     ['<c-b>'],
\ }
let g:ctrlp_regexp = 1
let g:ctrlp_line_prefix = '>>>> '

let g:ctrlp_user_command='find . -type f -not -path "./build/*" -printf "%P\n"'

function! GetSelectedText()
    return getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
endfunction

" change it to take from visually selected text
function! FindSelectedTag(cmd, mode)
    try
        let default_input_save = get(g:, 'ctrlp_default_input', '')
        if a:mode == "visual"
            let g:ctrlp_default_input = GetSelectedText()
        elseif a:mode == "normal"
            let g:ctrlp_default_input = expand("<cword>")
        endif

        execute '' . a:cmd
    finally
        if exists('default_input_save')
            let g:ctrlp_default_input = default_input_save
        endif
    endtry
endfunction

nnoremap <silent> mi :CtrlPBuffer<CR>

nnoremap <silent> mp :CtrlPBufTag<CR>
nnoremap <silent> m[ :CtrlPBufTagAll<CR>
nnoremap <silent> mo :CtrlPTag<CR>

xnoremap <silent> mp :<c-u>call FindSelectedTag("CtrlPBufTag", "visual")<CR>
xnoremap <silent> m[ :<c-u>call FindSelectedTag("CtrlPBufTagAll", "visual")<CR>
xnoremap <silent> mo :<c-u>call FindSelectedTag("CtrlPTag", "visual")<CR>

nnoremap <silent> m<C-p> :<c-u>call FindSelectedTag("CtrlPBufTag", "normal")<CR>
nnoremap <silent> m<C-[> :<c-u>call FindSelectedTag("CtrlPBufTagAll", "normal")<CR>
nnoremap <silent> m<C-o> :<c-u>call FindSelectedTag("CtrlPTag", "normal")<CR>


" let s:run_window_id=0
" function! s:get_run_window_id()
"     let s:run_window_id = win_getid()
" endfunction
" nnoremap <C-L>mr :call <SID>get_run_window_id()<CR>

" function! s:run_app()
"     call win_gotoid(s:run_window_id)
"     call term_start('./hms-ad-ea', {'cwd': 'dist', 'curwin': '1'})
" endfunction


" nnoremap <silent> mr :new \| :wincmd J \| :call term_start('./hms-ad-ea', {'cwd': 'dist'})<CR>
" nnoremap mr :vert call term_start('./hms-ad-ea', {'cwd': 'dist', 'curwin': '1'})<CR>
" nnoremap <silent> mr :call <SID>run_app()<CR>


" :command! -bar -nargs=0 XD :cs find s f1
" :redir => m | :silent XD | redir END | put=m
" :redir => m | :silent XD | redir END | let x=m
" extend CtrlP with :cscope result; :reg, :ju, :tags




" runtime ftplugin/man.vim
" set keywordprg=:Man
xnoremap <silent> mt :Tabularize /=/l20c1l0<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15


set foldmethod=syntax
set foldlevelstart=100

nnoremap <silent> m8 :let @" = expand("%")<CR>
command CopyPathWithSubstitute :exe 'let @" = "#include <" . substitute("'. @" . '" , "target/cpp/", "", "") . ">"' | :put "
nnoremap <silent> m9 :CopyPathWithSubstitute<CR>




let g:cool_total_matches = 1
nnoremap <C-L>ca :call CoolToggle()<CR>

" let g:ctrlp_extensions = ['cmd_hist']

" command! CtrlPCmdHist call ctrlp#init(ctrlp#cmd_hist#id())
" nnoremap <C-L><C-H> :CtrlPCmdHist<CR>

" command! CtrlPSearchHist call ctrlp#init(ctrlp#search_hist#id())
" nnoremap <C-L>/ :CtrlPSearchHist<CR>



nnoremap <silent> <C-L>w :w<CR>
nnoremap <silent> <C-L><C-G> :Gedit :<CR>
nnoremap <silent> <C-L>g :G<CR>

nnoremap <C-L>df :G fetch \| :echo "(git fetch && git diff FETCH_HEAD HEAD)" \| :silent G diff FETCH_HEAD HEAD<CR>

" <3
nnoremap <C-]> <C-]>zz
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz

" <3
nnoremap q: q:<ESC>?


autocmd VimEnter * :clearjumps


" nnoremap <expr> <C-W>mb ':<C-U>MoveBelow ' . v:count . "<CR>"



" find but no immediately jump <3
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

vnoremap <silent> * y:let @/= '\<' . "<C-R>"" . '\>'<CR> :set hls<CR>
vnoremap <silent> g* y:let @/="<C-R>""<CR> :set hls<CR>




" function! Rename_current_file()
"     let l:curr = expand("%:p")
"     if empty(l:curr)
"         echo "No file name."
"         return
"     endif

"     let l:bufnum    = bufnr()
"     let l:name      = input("Rename: " . l:curr . " -> ", l:curr)
"     call rename(l:curr, l:name)
"     let l:name      = fnamemodify(l:name, ":.")
"     exe ":bd! "     . l:bufnum
"     exe ":e "       . l:name

" endfunction



" defaults
nnoremap <silent> <C-F>      :cnext<CR>
nnoremap <silent> <C-B>      :cprev<CR>
nnoremap <silent> m<C-F>     :cfirst<CR>
nnoremap <silent> m<C-B>     :clast<CR>

let s:qf_ll_mappings_state = 0
function s:switch_qf_ll_mappings()
    if s:qf_ll_mappings_state == 0
        nnoremap <silent> <C-F>      :lnext<CR>
        nnoremap <silent> <C-B>      :lprev<CR>
        nnoremap <silent> m<C-F>     :lfirst<CR>
        nnoremap <silent> m<C-B>     :llast<CR>
        let s:qf_ll_mappings_state = 1
        echo "set mappings for location list"
    else
        nnoremap <silent> <C-F>      :cnext<CR>
        nnoremap <silent> <C-B>      :cprev<CR>
        nnoremap <silent> m<C-F>     :cfirst<CR>
        nnoremap <silent> m<C-B>     :clast<CR>
        let s:qf_ll_mappings_state = 0
        echo "set mappings for quickfix window"
    endif
endfunction

nnoremap <silent> mqf :call <SID>switch_qf_ll_mappings()<CR>



" add mapping for jumping forward and backward on help tags |ad|





let g:taboo_tab_format=" %N %r%m "
let g:taboo_renamed_tab_format=" %N %l "




" execute command (line)
nnoremap <C-L>rc 0v$hy:<C-R>"<CR>



" need to better way than B and E, since it selects too much, yet idea superb
map m<C-]> vBoEy:tag <C-R>"<CR>
