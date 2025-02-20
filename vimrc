autocmd VimEnter * :clearjumps


" ---- COMMAND ALIASES -------------------------------------------------------------------
command W   w
command Wa  wa
command Wq  wq
command Q   q
command Qa  qa


" ---- BUILT-IN EXTENSIONS ---------------------------------------------------------------
packadd comment
runtime ftplugin/man.vim


" ---- COMMAND MODE INPUT ----------------------------------------------------------------
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
execute "set cedit=\<C-O>"


" ---- OPTIONS ---------------------------------------------------------------------------
syntax on
filetype plugin indent on


" command history size
set history=1000


" look
set number
set wildmenu
set wildoptions=pum
set showcmd
set laststatus=2
set scrolloff=1
set shortmess=filnxtToOSs
set cmdwinheight=40


" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cindent
set cinoptions=g0


" search
set hlsearch
set incsearch


" swap file
set noswapfile


set autoread


" split
set splitbelow
set splitright
set splitkeep=screen
set equalalways


" jumps
set jumpoptions=stack


" buffers
set hidden


" input
set backspace+=indent,eol,start
set noesckeys


" timeouts
set updatetime=100
set timeout
set timeoutlen=1000
set ttimeoutlen=100


" fold
set foldmethod=syntax
set foldlevelstart=100


" it should be in cxx-cmake implemented and configured via settings.json
" yet for now stays
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-



" ---- MAPPINGS --------------------------------------------------------------------------

" execute command (one line)
" it could execute multiple lines that are added to the list
nnoremap <C-L>rc 0v$hy:<C-R>"<CR>


" quickfix window
nnoremap <silent> mc :ccl<CR>
nnoremap mqn :cnext<CR>
nnoremap mqp :cprev<CR>


" jumps
nnoremap <C-]> <C-]>zz
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz


" command window with immediate backward search
nnoremap q: q:<ESC>?
nnoremap q/ q/<ESC>?
nnoremap q? q?<ESC>?


" find but no jump
nnoremap <silent> *     :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> g*    :let @/=expand('<cword>') <bar> set hls <cr>

vnoremap <silent> *     y:let @/= '\<' . "<C-R>"" . '\>'<CR> :set hls<CR>
vnoremap <silent> g*    y:let @/="<C-R>""<CR> :set hls<CR>


" replace
nnoremap <C-L><C-S>     :%s/\<<C-R><C-W>\>/
nnoremap g<C-L><C-S>    :%s/<C-R><C-W>/
vnoremap <C-L><C-S>     y:%s/\<<C-R>"\>/
vnoremap g<C-L><C-S>    y:%s/<C-R>"/


" go quicker
nnoremap <C-J> 10j
nnoremap <C-K> 10k


" remove line and don't update register
nnoremap dD "_dd


" quickfix window and location list
nnoremap <silent> <C-F>             :lnext<CR>
nnoremap <silent> <C-B>             :lprev<CR>
nnoremap <silent> m<C-F>            :lfirst<CR>
nnoremap <silent> m<C-B>            :llast<CR>

nnoremap <silent> <C-L><C-F>        :cnext<CR>
nnoremap <silent> <C-L><C-B>        :cprev<CR>
nnoremap <silent> m<C-L><C-F>       :cfirst<CR>
nnoremap <silent> m<C-L><C-B>       :clast<CR>


" ---- COMMANDS --------------------------------------------------------------------------

command! -nargs=1 -complete=help H :enew | :set buftype=help | :keepalt h <args>


" ---- PLUGINS ---------------------------------------------------------------------------

" ---- vim-nerdtree ----------------------------------------------------------------------
let NERDTreeMinimalUI               = 1
let NERDTreeWinSize                 = 40
let NERDTreeCascadeSingleChildDir   = 0
let NERDTreeMapMenu                 = 'M'

nnoremap <silent> <C-L><C-N>        :NERDTreeToggle \| :horizontal wincmd =<CR>
nnoremap <silent> <C-L>nf           :NERDTreeFind<CR>

autocmd BufEnter * if winnr('$') == 1
\                   && exists('b:NERDTree')
\                   && b:NERDTree.isTabTree() | quit | endif


" ---- vim-tagbar ------------------------------------------------------------------------
let g:tagbar_compact                = 2
let g:tagbar_position               = 'topleft vertical'
let g:tagbar_autoclose              = 1

nnoremap <silent> <C-N><C-T>        :TagbarToggle<CR>


" ---- vim-asyncrun ----------------------------------------------------------------------
let g:asyncrun_open                 = 12


" ---- vim-delimitmate -------------------------------------------------------------------
let delimitMate_expand_cr           = 1


" ---- vim-fugitive ----------------------------------------------------------------------
nnoremap <silent> mgl               :Git log --graph --decorate<CR>
nnoremap <silent> mgL               :vert Git log --graph --decorate<CR>
nnoremap <silent> <C-L><C-G>        :Gedit :<CR>
nnoremap <silent> <C-L>g            :G<CR>
nnoremap <C-L>df                    :silent G fetch \| :G diff FETCH_HEAD HEAD<CR>


" ---- vim-cool --------------------------------------------------------------------------
let g:cool_total_matches            = 1



" ---- vim-ctrlp -------------------------------------------------------------------------
let g:ctrlp_match_current_file      = 1
let g:ctrlp_match_window            = 'bottom,order:ttb,min:30,max:30,results:50'
let g:ctrlp_working_path_mode       = ''
let g:ctrlp_bufname_mod             = ':~:p'
let g:ctrlp_bufpath_mod             = ''
let g:ctrlp_switch_buffer           = 'e'
let g:ctrlp_regexp                  = 1
let g:ctrlp_line_prefix             = '>>>> '
let g:ctrlp_user_command            = 'find .'
\                                   . ' -type f'
\                                   . ' -not -path "./build/*"'
\                                   . ' -not -path "./.git/*"'
\                                   . ' -printf "%P\n"'
let g:ctrlp_prompt_mappings         =
\ {
\   'PrtDeleteEnt()':   ['<c-q>'],
\   'ToggleType(1)':    ['<c-up>'],
\   'ToggleType(-1)':   ['<c-down>'],
\   'PrtCurRight()':    ['<c-f>'],
\   'PrtCurLeft()':     ['<c-b>'],
\ }

function! s:find_selected_tag(cmd)
    try
        let default_input           = get(g:, "ctrlp_default_input", "")
        let g:ctrlp_default_input   = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
        execute a:cmd
    finally
        if exists("default_input")
            let g:ctrlp_default_input = default_input
        endif
    endtry
endfunction

nnoremap <silent> mi :CtrlPBuffer<CR>
nnoremap <silent> mP :CtrlPBufTag<CR>
nnoremap <silent> mp :CtrlPTag<CR>
xnoremap <silent> mP :<c-u>call <SID>find_selected_tag("CtrlPBufTag")<CR>
xnoremap <silent> mp :<c-u>call <SID>find_selected_tag("CtrlPTag")<CR>




" ---- COLORS ----------------------------------------------------------------------------
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
