execute pathogen#infect()

set history=500

filetype plugin on
filetype indent on

set autoread
set fdm=indent

set so=7

set ruler
set nu

set cmdheight=1

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw 

set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

syntax enable 
colorscheme monokai
set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si
set wrap!

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap <C-down> <C-W><C-J>
nmap <C-up> <C-W><C-K>
nmap <C-right> <C-W><C-L>
nmap <C-left> <C-W><C-H>
nmap <A-right> :tabn<CR>
nmap <A-left> :tabp<CR>
nmap <F2> :source ~/.vimrc<CR>
nmap <F5> :tabedit
nmap <F8> :split<CR>
nmap <F9> :set hlsearch!<CR>
nmap <F10> :call RealSyntasticToggle()<CR>
nmap <F11> :TagbarToggle<CR>
nmap <F12> :NERDTreeToggle<CR>

let g:tagbar_left = 1
let g:tagbar_width = 35

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufRead *.cls set syntax=vb

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 35

let g:NERDTreeIndicatorMapCustom = {
            \ 'Modified'  : '•',
            \ 'Staged'    : '+',
            \ 'Untracked' : '*',
            \ 'Renamed'   : '→',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '╳',
            \ 'Dirty'     : '!',
            \ 'Clean'     : '✓',
            \ 'Ignored'   : '☒',
            \ 'Unknown'   : '?'
            \ }

let g:syntastic_python_checkers = ['mypy', 'python3']
let g:syntastic_python_mypy_args = '--config-file=/home/bwofter/.mypy.ini'
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 
            \ 'mode'                : 'active',
            \ 'acive_filetypes'     : [],
            \ 'passive_filetypes'   : []
            \}

let g:groovy_highlight_all = 1
let g:groovy_regex_strings = 1
let g:groovy_highlight_functions = 1
let g:groovy_mark_braces_in_parens_as_errors = 1
let g:groovy_comment_strings = 1
let g:tagbar_type_groovy = {
            \ 'ctagstype' : 'groovy',
            \ 'kinds'     : [
            \ 'p:package:1',
            \ 'c:classes',
            \ 'i:interfaces',
            \ 't:traits',
            \ 'e:enums',
            \ 'm:methods',
            \ 'f:fields:1'
            \ ]
            \ }

let g:ycm_collect_identifiers_from_tags_files = 1

let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {
            \ 'readonly': 'ro',
            \ 'whitespace': '',
            \ 'linenr': '[',
            \ 'maxlinenr': ']',
            \ 'branch': '',
            \ 'notexists': 'x',
            \ 'dirty': '!',
            \ 'crypt': '',
            \ 'space': ' ',
            \ 'ellipsis': '…'
            \ }

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr('%')
    let l:alternateBufNum = bufnr('#')

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr('%') == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute('bdelete! ' . l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(':' . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute 'normal! vgvy'

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, '\n$', '', '')

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine('%s' . '/' . l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! RealSyntasticToggle()
    if (!exists('b:syntastic_live'))
        let b:syntastic_live = 0
    endif
    if b:syntastic_live == 1
        SyntasticReset
        let b:syntastic_live = 0
    else
        SyntasticCheck
        let b:syntastic_live = 1
    endif
endfunction
