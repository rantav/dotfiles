set hlsearch
set smarttab
syntax on
"set tabstop=2
"set smartindent
"set smarttab
"set hlsearch
"set autoindent
"set ignorecase
"set showmode
"set incsearch

set nocompatible
set nobackup          " do not keep a backup file, use versions instead
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set cindent
set expandtab
set shiftwidth=2
map Q gq
if &t_Co > 2 || has("gui_running")
  syntax on
endif
filetype plugin indent on
if has("autocmd")
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType actionscript setlocal textwidth=78
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
  \ endif
  augroup END
else
  set autoindent
endif " has("autocmd")



set encoding=utf-8

map <C-S> :w<CR>
:imap <C-s> <ESC>:w<cr>a
set nu

" actionscript language
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" Copy to another file in the same directory as the current file
" (Thanks Douglas Potts)
if has("unix")
    map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,w :w <C-R>=expand("%:p:h") . "\" <CR>
endif


" Find files
function! Find(name)
  let l:_name = substitute(a:name, "\\s", "*", "g")
  let l:list=system("find . -iname '*".l:_name."*' -not -name \"*.class\" -and -not -name \"*.swp\" | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif

  if l:num != 1
    echo l:list
    let l:input=input("Which ? (<enter>=nothing)\n")

    if strlen(l:input)==0
      return
    endif

    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif

    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif

    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif

  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction

command! -nargs=1 Find :call Find("<args>")



set autoread

nmap <F6> /}<CR>zf%<ESC>:nohlsearch<CR>


" , #perl # comments
map ,# :s/^/#/<CR>

" " ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR><Esc>:nohlsearch<CR>

" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>

" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>


"Enable spell checking.
if has("spell")
  "Turn spelling on by default for English UK.
  "Center is correctly spelled. Centre is not, and
  "shows with spell local colors. Misspelled words
  "show like soo.
"  set spell
"  setlocal spell spelllang=en_us

  "Toggle spelling with F4 key.
  map <F4> :set spell!<CR>
  "Change the default highlighting
  highlight SpellBad ctermfg=yellow ctermbg=red

  " limit it to just the top 10 items
  set sps=best,10
  " ]s Next misspelled word
  " [s Previous misspelled word
  " zg Add to good words list
endif

" Highlight long lines
"match ErrorMsg '\%>80v.\+'


" To use this, add the following to your .vimrc:
"
"    if filereadable("/google/src/head/depot/eng/vim/google.vim")
"        source /google/src/head/depot/eng/vim/google.vim
"    else
"        source /home/build/public/eng/vim/google.vim
"    endif
"
" (This will look first in SrcFS which is much faster than /home/build for
" many sites.  For some sites, e.g. BHZ, even SrcFS is slow so you may
" instead want to look for suggestions here:
"   http://wiki/Main/VimEditor#Tips_for_very_remote_offices
" These tips may be helpful even for folks with fast SrcFS access.)
"
" If you want syntax highlighting enabled, you should enable it *before*
" sourcing this script by adding "syntax on" to your .vimrc

" Note: this file is *preferred* over google/util/google.vim.
" If you run into problems, please email vi-users.

" Add <mydir>/runtime and <mydir>/runtime/after to appropiate places in Vim's
" runtimepath. The former is made the second element, while the latter is made
" the second to last element. This should put Google paths between the user's
" personal settings and Vim's factory settings on both the "normal" part of the
" path and the "after" part of the path.
let s:rt_before = expand('<sfile>:p:h') . '/runtime'
if has('win32') || has('win64')
  let s:rt_before = substitute(s:rt_before, '\\', '/', 'g')
endif
let s:rt_after = s:rt_before . '/after'
let &runtimepath = substitute(&runtimepath, '^\([^,]*\),\(.*\),\([^,]*\)$', '\1,' . s:rt_before . ',\2,' . s:rt_after . ',\3', '')

" This will generally be /google/src/head/depot or /home/build/public, but may
" something else (eg. a SrcFS client sync'd to a specific CL, or the base of an
" actual P4 client).
let s:base_path = expand('<sfile>:p:h:h:h')

runtime coding-style.vim
runtime google-filetypes.vim
runtime gsearch.vim
runtime gcheckstyle.vim

set makeprg=/usr/local/symlinks/make-dbg

let s:marked_line_on_screen = 0

" Trims excess newlines from the end of the buffer.  Also adds a newline if the
" last line doesn't have one.
function! GoogleTrimNewlines ()
  let lines = line('$')
  let done = 0
  " loop so that we can also delete trailing lines consisting of only whitespace
  while !done
    " erase last line if it's only whitespace
    %s/^\s*\%$//e

    " erase trailing blank lines
    %s/\n*\%$/\r/e
    %s/\n*\%$//e

    " if we actually did anything, assume that we have more to do
    let done = lines == line('$')
    let lines = line('$')
  endwhile
endfunction

" Trim spaces at the end of line (lint complains if they exist)
function! GoogleTrimEOLSpaces ()
    :%s/\s\+$//eg
endfunction

function! GoogleMarkCurrPos ()
  " mark the curr position, as well as the first visible character on that
  " line. We need the latter because certain sorts of window decorations (eg:
  " 'number') can cause the first position to be non-zero.
  normal! mzg0my

  " remember the marked position wrt the screen
  let s:marked_col_on_screen = wincol()
  let s:marked_line_on_screen = winline()
endfunction

function! GoogleRestorePos ()
  " jump back to the old "first character on the line", and remember offsets
  silent! normal! `y
  let col_offset = wincol() - s:marked_col_on_screen
  let line_offset = winline() - s:marked_line_on_screen

  " jump to actual marked position
  silent! normal! `z

  " scroll window to correct for offsets
  if col_offset < 0
    exe "normal! " . -col_offset . "zh"
  elseif col_offset > 0
    exe "normal! " . col_offset . "zl"
  endif
  if line_offset < 0
    exe "normal! " . -line_offset . "\<C-Y>"
  elseif line_offset > 0
    exe "normal! " . line_offset . "\<C-E>"
  endif
endfunction

" Trims newlines and at the end of the file if this is a file of an appropriate
" type.
function! GoogleConditionallyTrimNewlines ()
  if &ft == 'cpp' || &ft == 'c' || &ft == 'java' || &ft == 'python' || &ft == 'make'
    if match(getline('$'), '^\s*$') >= 0
      call GoogleMarkCurrPos()
      call GoogleTrimNewlines()
      call GoogleRestorePos()
    endif
  endif
endfunction

" Trim newlines at the end of certain files before saving
au BufWritePre * call GoogleConditionallyTrimNewlines()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You can turn off automatic boilerplate generation by adding the
" following command to your .vimrc *before* sourcing google.vim:
"
"    let  g:disable_google_boilerplate=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Autogen(fnam)
  " This doesn't work on Windows, because autogen is a bash script.
  if has('win32') || has('win64')
    " TODO: Use Cygwin if it's installed.
    return
  endif

  if filereadable(s:base_path . '/google/tools/autogen')
    exe '.!' . s:base_path . '/google/tools/autogen ' . a:fnam . ' 2>/dev/null'
  else
    exe '.!/home/build/public/google/tools/autogen ' . a:fnam . ' 2>/dev/null'
  endif
  $
  silent ?^\s*$
  normal! $
endfunction

command! Autogen call Autogen(expand('%'))

if ! exists('g:disable_google_boilerplate') || ! g:disable_google_boilerplate
  aug google_boilerplate
    autocmd!
    autocmd BufNewFile * silent! Autogen
  aug END
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following settings are optional, but recommended. You may wish to
" override these options in your personal .vimrc after sourcing this file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enables extra vim features (which break strict compatibility with vi)
set nocompatible

" allows files to be open in invisible buffers
set hidden

" show trailing spaces in yellow (or red, for users with dark backgrounds).
" "set nolist" to disable this.
" this only works if syntax highlighting is enabled.
"set list
set listchars=tab:\ \ ,trail:\ ,extends:?,precedes:?
if &background == "dark"
  highlight SpecialKey ctermbg=Red guibg=Red
else
  highlight SpecialKey ctermbg=Yellow guibg=Yellow
end
" if you would like to make tabs and trailing spaces visible without syntax
" highlighting, use this:
"   set listchars=tab:?\ ,trail:\?,extends:?,precedes:?

" make backspace "more powerful"
set backspace=indent,eol,start

" makes tabs insert "indents" at the beginning of the line
set smarttab

" reasonable defaults for indentation
set autoindent nocindent nosmartindent

let is_bash=1                  " informs sh syntax that /bin/sh is actually bash
let java_allow_cpp_keywords=1  " don't highlight C++ kewords as errors in Java
let java_highlight_functions=1 " highlight method decls in Java (when syntax on)


source ~/.vim/thrift.vim


" scala newish stuff
filetype indent on
set ic
set lbr
" colorscheme delek

" XML folding
" au BufNewFile,BufRead *.xml,*.htm,*.html so ~/.vim/XMLFolding.vim
"
"let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax


au BufRead,BufNewFile *.avdl,*.genavro setlocal filetype=avro-idl

" Solarized:
if has('gui_running')
  set background=light
else
  "set background=dark
  set background=dark
endif
colorscheme solarized
