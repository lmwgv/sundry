set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set tabstop=4
set shiftwidth=4
set expandtab
"set guifont=gohufont-11
set guifont=Hack:h9
set nobackup
set number
set nowrap
set fileencodings=utf-8
set encoding=utf-8
set hidden

nmap <C-t> :browse enew<CR>
nmap <C-o> :browse e<CR>
nmap <C-TAB> :bnext<CR>
nmap <C-S-TAB> :bprevious<CR>
nmap <C-F4> :bp <BAR> bd #<CR>
nmap <C-q> :wq<CR>
nmap <C-s> :w<CR>
nmap , ^
nmap - $
imap nnn <Esc>
imap nns <Esc>:w<CR>
imap nnq <Esc>:wq<CR>

noremap      n      j
noremap      N      J
noremap     zn     zj
noremap <c-w>n <c-w>j
noremap <c-w>N <c-w>J

noremap      e      k
noremap      E      K
noremap     ze     zk
noremap <c-w>e <c-w>k
noremap <c-w>E <c-w>K

noremap      i      l
noremap      I      L
noremap     zi     zl
noremap     zI     zL
noremap <c-w>i <c-w>l
noremap <c-w>I <c-w>L
noremap     [i     [l|" nop
noremap     [I     [L|" nop
noremap     ]i     ]l|" nop
noremap     ]I     ]L|" nop

noremap      j      e
noremap      J      E
noremap     gj     ge
noremap     gJ     gE
noremap     zj     ze
noremap     zJ     zE

noremap      k      n
noremap      K      N
noremap     gk     gn|" nop
noremap     zk     zn
noremap     zK     zN
noremap <c-w>k <c-w>n

noremap      l      i
noremap      L      I
noremap     gl     gi
noremap     gL     gI
noremap     zl     zi
noremap <c-w>l <c-w>i
noremap     [l     [i
noremap     [L     [I
noremap     ]l     ]i
noremap     ]L     ]I

" The nops are used to hide the old keys so as to remove temptations to
" confuse oneself by using a mixture of old and new.

" The langmap will disturb other mappings, but it gives an easy overview of
" what the above mappings do:
"
" set langmap=kn,KN,nj,NJ,je,JE,ek,EK,li,LI,il,IL

" Experimental SHIT!!!!!!
let g:mapleader = ' '

execute pathogen#infect()

colo madeofcode

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=250"

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pyc)$',
\}
let g:ctrlp_working_path_mode = 'r'

let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
