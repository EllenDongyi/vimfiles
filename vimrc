

set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"turn on syntax highlighting
syntax on
"turn on ftplugins and indent files
filetype plugin indent on

set backspace=indent,eol,start
set history=1000

set showcmd
set showmode

set incsearch
set hlsearch
set showmatch
set lazyredraw

set number
set showbreak=///
set wrap linebreak nolist

set directory=~/.vim/swaps
set backup
set backupdir=~/.vim/backups

set linespace=2

set cursorline

set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"make <c-l> clear the highlight as well as redraw
nnoremap <C-c> :nohls<CR><C-L>
inoremap <C-c> <C-O>:nohls<CR>

"enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"some stuff to get the mouse going in term
set mouse=a

"hide buffers when not displayed
set hidden


if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  colorscheme railscasts
  set guitablabel=%M%t
  set lines=40
  set columns=115

  if has("gui_gnome")
    set t_Co=256
    set term=gnome-256color
    colorscheme railscasts
    set guifont=Monospace\ Bold\ 12
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  "dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  "set railscasts colorscheme when running vim in gnome terminal
  if $COLORTERM == 'gnome-terminal'
    ""set term=gnome-256color
    ""set term=ansi
    set t_Co=256
    set background=dark
    colorscheme railscasts
    "colorscheme solarized
  else
    colorscheme default
  endif
endif

"Enabling Zencoding
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \  'erb' : {
      \    'extends' : 'html',
      \  },
      \}
let g:user_zen_expandabbr_key='<c-k>'

"indent_guides settings
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"""Key mappings

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

""key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"use ; to issue a command"
nnoremap ; :
let mapleader=","

nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <F6> :TlistToggle<CR>
nnoremap <C-A> :IndentGuidesToggle<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>


"""useful functions

"visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
""dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction



"set fileencodings=utf8,cp936,gb18030,big5
set encoding=utf8

