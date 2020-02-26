execute pathogen#infect()

if &term =~ '256color'
    set t_ut=
endif

set history=9999

filetype plugin on
filetype indent on

set autoread
set ruler
set nu
set hid
set so          =7
set cmdheight   =1
set fdm         =syntax

set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set backspace   =eol,start,indent
set mat         =2
set t_vb        =
set tm          =500
set foldcolumn  =2
set whichwrap  +=<,>,h,l

syntax enable 
colorscheme  py-darcula
set guifont =Fira\ Code\ Regular:h11
set encoding=utf8
set ffs     =unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth  =4
set tabstop     =4

set ai
set si
set wrap!

" Setup the common commands
nmap <C-j>  <C-W>j
nmap <C-k>  <C-W>k
nmap <C-h>  <C-W>h
nmap <C-l>  <C-W>l
nmap <F2>   :source ~/.vimrc<CR>
nmap <F5>   :tabedit 
if has('macunix')
    " If we're on mac, we need to use shift in many of the commands
    nmap <SC-down>  <C-W><C-J>
    nmap <SC-up>    <C-W><C-K>
    nmap <SC-right> <C-W><C-L>
    nmap <SC-left>  <C-W><C-H>
    nmap <AC-down>  :tablast<CR>
    nmap <AC-up>    :tabfirst<CR>
    nmap <AC-right> :tabn<CR>
    nmap <AC-left>  :tabp<CR>
    nmap <F6>       :split<CR>
    nmap <F7>       :set hlsearch!<CR>
    nmap <F8>       :call RealSyntasticToggle()<CR>
    nmap <F9>       :TagbarToggle<CR>
    nmap <F10>      :NERDTreeToggle<CR>
else
    " All other OSes don't try to use these keybindings, so let's use them
    " here.
    nmap <C-down>   <C-W><C-J>
    nmap <C-up>     <C-W><C-K>
    nmap <C-right>  <C-W><C-L>
    nmap <C-left>   <C-W><C-H>
    nmap <A-down>   :tablast<CR>
    nmap <A-up>     :tabfirst<CR>
    nmap <A-right>  :tabn<CR>
    nmap <A-left>   :tabp<CR>
    nmap <F8>       :split<CR>
    nmap <F9>       :set hlsearch!<CR>
    nmap <F10>      :call RealSyntasticToggle()<CR>
    nmap <F11>      :TagbarToggle<CR>
    nmap <F12>      :NERDTreeToggle<CR>
endif

let g:tagbar_left   =1
let g:tagbar_width  =35

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
autocmd BufNewFile,BufRead *.cls set syntax=vb

if !exists('g:NERDTreeIndicatorMapCustom')
    let g:NERDTreeIndicatorMapCustom        ={}
endif
let g:NERDTreeDirArrowExpandable            ='▶'
let g:NERDTreeDirArrowCollapsible           ='▼'
let g:NERDTreeWinPos                        ='right'
let g:NERDTreeWinSize                       =35
let g:NERDTreeIndicatorMapCustom.Modified   ='•'
let g:NERDTreeIndicatorMapCustom.Staged     ='+'
let g:NERDTreeIndicatorMapCustom.Untracked  =' '
let g:NERDTreeIndicatorMapCustom.Renamed    ='→'
let g:NERDTreeIndicatorMapCustom.Unmerged   ='═'
let g:NERDTreeIndicatorMapCustom.Deleted    ='╳'
let g:NERDTreeIndicatorMapCustom.Dirty      ='!'
let g:NERDTreeIndicatorMapCustom.Clean      ='✓'
let g:NERDTreeIndicatorMapCustom.Ignored    ='☒'
let g:NERDTreeIndicatorMapCustom.Unknown    ='?'

if !exists('g:syntastic_mode_map')
    let g:syntastic_mode_map                ={}
endif
let g:syntastic_python_checkers             =['mypy', 'python3.7']
if filereadable('/home/bwofter/.mypy.ini')
    let g:syntastic_python_mypy_args        ='--config-file=/home/bwofter/.mypy.ini'
else
    let g:syntastic_python_mypy_args        =''
endif
let g:syntastic_loc_list_height             =5
let g:syntastic_always_populate_loc_list    =1
let g:syntastic_auto_loc_list               =1
let g:syntastic_check_on_open               =1
let g:syntastic_check_on_wq                 =0
let g:syntastic_mode_map.mode               ='active'
let g:syntastic_mode_map.active_filetypes   =[]
let g:syntastic_mode_map.passive_filetypes  =[]

if !exists('g:tagbar_type_groovy')
    let g:tagbar_type_groovy                ={}
endif
let g:groovy_highlight_all                  =1
let g:groovy_regex_strings                  =1
let g:groovy_highlight_functions            =1
let g:groovy_mark_braces_in_parens_as_errors=1
let g:groovy_comment_strings                =1
let g:tagbar_type_groovy.ctagstype          ='groovy'
let g:tagbar_type_groovy.kinds              =['p:package:1', 'c:classes', 'i:interfaces', 't:traits',
                                             \'e:enums', 'm:methods', 'f:fields:1']

let g:ycm_collect_identifiers_from_tags_files   =1
let g:ycm_python_interpreter_path               =''
let g:ycm_python_sys_path                       =[]
let g:ycm_extra_conf_vim_data                   =['g:ycm_python_interpreter_path', 'g:ycm_python_sys_path']
if filereadable('/home/bwofter/global_extra_conf.py')
    let g:ycm_global_ycm_extra_conf             ='/home/bwofter/global_extra_conf.py'
endif

if !exists('g:airline_symbols')
    let g:airline_symbols               ={}
endif
let g:airline_theme                     ='darcula'
let g:airline#extensions#tabline#enabled=1
let g:airline_left_alt_sep              =''
let g:airline_right_alt_sep             =''
let g:airline_left_sep                  =''
let g:airline_right_sep                 =''
let g:airline_symbols.readonly          ='ro'
let g:airline_symbols.whitespace        =''
let g:airline_symbols.linenr            ='['
let g:airline_symbols.maxlinenr         =']'
let g:airline_symbols.branch            =''
let g:airline_symbols.notexists         ='x'
let g:airline_symbols.dirty             ='!'
let g:airline_symbols.crypt             =''
let g:airline_symbols.space             =' '
let g:airline_symbols.ellipsis          ='…'

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
