"---------------------------------------------------------------------------
" Hji: personal set up
"

set hlsearch
set number
set autochdir
set vb
set ignorecase

"
nmap <silent> ss  <Plug>ZoomWin

"MRU setup"
nnoremap <silent> ru     :MRU<CR>

"FuzzyFinder setup"
source ~/.FuzzyFinder.conf

" "EasyMotion
let g:EasyMotion_leader_key = 'e'

if !(exists('g:neocomplcache_same_filetype_lists'))
    let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists.vimwiki = 'tex'
let g:neocomplcache_same_filetype_lists.txt = 'tex'
let g:neocomplcache_same_filetype_lists.mail = 'cpp'

"vimwiki setup"
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 'path_html': '~/.vim/vimwiki_html/'}]
let g:vimwiki_browsers = ['firefox-browser']
" let g:vimwiki_browsers = ['/Applications/Google\ Chrome.app']
let g:vimwiki_rxComment = '^\s*%.*$'


""""""""""""""""""""""""""""""
" LaTeX Suite things
""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
filetype indent on
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_CompileRule_pdf = 'xelatex'

if !exists('g:Tex_IgnoredWarnings')
    let g:Tex_IgnoredWarnings =
                \'Underfull'."\n".
                \'Overfull'."\n".
                \'specifier changed to'."\n".
                \'You have requested'."\n".
                \'Missing number, treated as zero.'."\n".
                \'There were undefined references'."\n".
                \'Citation %.%# undefined'."\n".
                \"Font shape \`OMS/lmss/m/n\' undefined"."\n".
                \'LaTeX Warning:'."\n". 
                \"LaTeX Warning: Reference `%s' on page %n undefined"."\n"
                \"LaTeX Warning: Reference `%s' on page %n undefined"."\n"
                \'LaTeX Font Warning:'
endif
" This is the number of warnings in the g:Tex_IgnoredWarnings string which
" will be ignored.
if !exists('g:Tex_IgnoreLevel')
    let g:Tex_IgnoreLevel = 12
endif

"Tagbar"
nnoremap <silent> <leader>tr :TagbarToggle<CR>

"TagList"
nmap <silent> <leader>tl :Tlist<cr>

let g:Imap_UsePlaceHolders = 0


" Tabularize {
nmap <Leader>t& :Tabularize /&<CR>
vmap <Leader>t& :Tabularize /&<CR>
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:<CR>
vmap <Leader>t: :Tabularize /:<CR>
nmap <Leader>t:: :Tabularize /:\zs<CR>
vmap <Leader>t:: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,<CR>
vmap <Leader>t, :Tabularize /,<CR>
nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
nmap <Leader>t<Space> :Tabularize /<Space><CR>
vmap <Leader>t<Space> :Tabularize /<Space><CR>
" }


"" vim-easytag.vim"{{{
"let g:easytags_cmd = 'ctags'
"let g:easytags_file = '~/p4/tachyon-10/p4_tags'
"let g:easytags_always_enabled = 0 " set 1 would make it too slow 
"let g:easytags_updatetime_min = 1000
let g:easytags_auto_update = 0
"let b:easytags_auto_highlight = 0
""}}}



let &termencoding=&encoding
set fileencodings=utf-8,gbk,utf-16,big5 

"A.vim
let g:alternateSearchPath = "sfr:../include,sfr:../interface,sfr:../inc,sfr:../include/*,sfr:../interface/*,sfr:../inc/*,sfr:../inc/*/*,sfr:../src,sfr:../../src,sfr:../../../src,sfr:../*/*/src"


set foldenable
au BufRead,BufNewFile *.json            set foldmethod=syntax 
au BufRead,BufNewFile *.lua            set foldmethod=syntax 
au BufRead,BufNewFile *.luah           set foldmethod=syntax 
autocmd Syntax c,cpp,python,xml,html,xhtml setlocal foldmethod=syntax


" for intellij
" [Space]i : fold all
" [Space]u : 
" [Space]l : 
" [Space]h : 

" Folding."{{{
" If press h on head, fold close.
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press h on head, range fold close.
xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
noremap [Space]j zj
noremap [Space]k zk
noremap [Space]h zc
noremap [Space]l zo
noremap [Space]a za
" noremap [Space]m zM
noremap [Space]f zM 
"fold all
noremap [Space]i zMzv
noremap [Space]rr zR
" noremap [Space]f zf
noremap [Space]d zd
" noremap [Space]u :<C-u>Unite outline:foldings<CR>
noremap [Space]u zR
noremap [Space]gg :<C-u>echo FoldCCnavi()<CR>
"}}}


set nolist " get rid of ?

" Toggle relativenumber.
nnoremap <silent> [Space].
      \ :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> [Space]p
      \ :<C-u>call ToggleOption('paste')<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
      \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
      \ :<C-u>call ToggleOption('cursorline')<CR>
" Set autoread.
nnoremap [Space]ar
     \ :<C-u>setlocal autoread<CR>
" Output encoding information.
nnoremap <silent> [Space]en
      \ :<C-u>setlocal encoding? termencoding? fenc? fencs?<CR>
" Set spell check.
nnoremap [Space]ek
      \ :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w
      \ :<C-u>call ToggleOption('wrap')<CR>
" Echo syntax name.
nnoremap [Space]sy
      \ :<C-u>echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>


" replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" nnoremap <Leader>t :ta %s
nmap <leader>g :Rgrep <c-r>=expand("<cword>")<cr>
" nmap <leader>t :ta <c-r>=expand("<cword>")<cr>
nnoremap <leader>t :tag <c-r>=expand("<cword>")
" :ts, :tn, :tp


set tags=
nnoremap <leader>q :set tags=/home/haji/tools/code/tags
nnoremap <leader>u :set tags=



" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight parenthesis.
set showmatch
" Highlight when CursorMoved.
set cpoptions-=m
set matchtime=3
" Highlight <>.
set matchpairs+=<:>


"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>



" dbext
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=hji:dbname=test'


nnoremap <silent> <leader>w :call argumentrewrap#RewrapArguments()<CR>


" commented out line 181-185 in /home/haji/.cache/neobundle/neobundle.vim/autoload/neobundle/config.vim to make the auto filetype detection work
" commented out  
  " if reset_ftplugin
  "   call s:reset_ftplugin()
  " elseif filetype_before !=# filetype_after
  "   execute 'doautocmd FileType' &filetype
  " endif

inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
nmap <C-j> 5j
nmap <C-k> 5k


let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 2
let g:jedi#force_py_version = 3
let g:jedi#popup_select_first = 0

" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"

setl shiftwidth=2 softtabstop=2



" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'"

" auto close { in java/c code
imap {<CR> {<CR>}<C-o>O

" set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Monaco\ for\ Powerline:h13
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8

let g:fuf_mrufile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[\\])\.(hg|git|bzr)($|[\\])|.*(mail|Geeknote).*\.txt'

let g:vimwiki_ext2syntax = {'.md': 'markdown',
      \ '.mkd': 'markdown',
      \ '.wiki': 'media',
      \ '.txt': 'media'}

let g:GeeknoteFormat='vimwiki'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']
" use C-q to switch between on and off :-)
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-q> :SyntasticCheck<CR> :SyntasticToggleMode<CR>


noremap <C-t> :Autoformat<CR><CR>

