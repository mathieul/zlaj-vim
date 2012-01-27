"
" Inspiration coming mostly from https://github.com/mislav/vimfiles/blob/master/vimrc
"
set nocompatible
call pathogen#infect()
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number
set ruler                       " show the cursor position all the time
set cursorline
set list listchars=tab:\ \ ,trail:·
" set list listchars=tab:▸\ ,eol:¬,trail:·
set showcmd                     " display incomplete commands
set wildmenu
set wildmode=list:longest,full

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set colorcolumn=80

"" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Simple GUI
if has("gui_running")
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
endif

"" Theme
set background=dark
colorscheme solarized

"" Leader
" let mapleader="\\"
let mapleader=","

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" provide some context when editing
set scrolloff=3

" don't use Ex mode, use Q for formatting
map Q gq


" Command-T configuration
let g:CommandTMaxHeight=20

"" Mapping keys
nnoremap <leader><space> :noh<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT test<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>
map <leader>gg :topleft 30 :split Gemfile<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <D-t> :CommandTFlush<cr>\|:CommandT<cr>
imap <D-t> <Esc>:CommandTFlush<cr>\|:CommandT<cr>
map <D-F> :Ack<space>
map <D-/> \\\
imap <D-/> <Esc>\\\
vmap <D-]> >gv
vmap <D-[> <gv

" remove trailing spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" underline current line
nnoremap <leader>1 yypVr=

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" tabular setup
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :Tabularize /:\zs<cr>
nmap <leader>a> :Tabularize /=><cr>
vmap <leader>a> :Tabularize /=><cr>
nmap <leader>a, :Tabularize /, \zs<cr>
vmap <leader>a, :Tabularize /, \zs<cr>

" recovery config
set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" setup file types handled by vim-pasta (white list or black list, not both)
let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml', 'haml']
"let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']
