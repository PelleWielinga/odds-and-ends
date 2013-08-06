" Syntax Highlighting
syntax on
set t_Co=256
colorscheme mustang

" Tabs
set shiftwidth=2
set tabstop=2
set expandtab 
set shiftround
set autoindent

au FileType c,java setlocal shiftwidth=4
au FileType c,java setlocal tabstop=4

au FileType make setlocal noexpandtab

" Search
set hlsearch
set incsearch

" Buffers
noremap ;e :buffers<CR>:buffer!<Space>
noremap <C-l> :bp!<CR>
noremap <C-h> :bn!<CR>

" Misc
set number
set backspace=2

" Comments
let b:comment = '#'
au FileType vim let b:comment = '"'
au FileType c,cpp,java let b:comment = "//"

map <silent> ;/ :call Comment(b:comment)<CR>
map <silent> ;? :call UnComment(b:comment)<CR>

" XML formatting
au FileType xml exe "map <silent> <C-S-F> :1,$!xmllint --format --recover - 2>/dev/null<CR>"

" File types
au BufRead,BufNewFile *.vimdir      set filetype=vim
au BufRead,BufNewFile config*       set filetype=gitconfig

" Functions

function Comment(cmt)
  let line = getline('.')
  let cmtlen = strlen(a:cmt)
  let white = "          "[0:cmtlen-1]
  if line[0:cmtlen-1] == white
    call setline('.', a:cmt . line[(cmtlen):])
  elseif line[0:(cmtlen-1)] != a:cmt
    while (line[0] == ' ')
      let line = line[1:]
    endwhile
    call setline('.', a:cmt . line)
  endif
endfunction

function UnComment(cmt)
  let line = getline('.')
  let cmtlen = strlen(a:cmt)
  let white = "          "[0:cmtlen-1]
  if line[0:cmtlen-1] == a:cmt
    if line[cmtlen] == ' '
      call setline('.', white . line[(cmtlen):])
    else
      call setline('.', line[(cmtlen):])
    endif
  endif
endfunction
