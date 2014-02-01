set nocompatible " be iMproved
filetype off " Vundle required!

" Vundle Settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/vimrc.bundles

" Vundle required! 
filetype plugin indent on 


" turn on syntax highlighting
syntax on

" backspace and delete problem
set backspace=indent,eol,start

" more history
set history=1000

" backup/swap file directory
set directory=~/.vim/swaps
set backup
set backupdir=~/.vim/backups

" status bar
set showcmd
set showmode
set number

" searching
set incsearch " incremental searching
set hlsearch " hightlight matching
set lazyredraw " do not redraw while running macros 

set showbreak="->""
set wrap linebreak nolist " only manuly insert line breaks
set showmatch " show matching brackets for a moment

" indent settings
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=0
set linespace=4
set smarttab
set autoindent
autocmd BufEnter *.md set filetype=markdown
autocmd FileType markdown setlocal textwidth=80
autocmd FileType html,css,haml,sass,scss,ruby,javascript,jade,coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 linespace=2
autocmd FileType python set textwidth=0
autocmd Syntax javascript set syntax=jquery 

" some stuff to get the mouse going in term
set mouse=a

" colors, fonts
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

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

  if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
      set go=aAce  " remove toolbar
      set guifont=Monaco:h13
      noremap <D-M-Left> :tabprevious<cr>
      noremap <D-M-Right> :tabnext<cr>
      map <D-1> 1gt
      map <D-2> 2gt
      map <D-3> 3gt
      map <D-4> 4gt
      map <D-5> 5gt
      map <D-6> 6gt
      map <D-7> 7gt
      map <D-8> 8gt
      map <D-9> 9gt
      map <D-0> :tablast<CR>
      set bg=dark
      if &background == "dark"
          hi normal guibg=black
          set transp=8
      endif
    endif
  endif
else
  "dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    "set term=gnome-256color
    "set term=ansi
    set t_Co=256
    "set background=dark
    colorscheme my_ir_black
  else
    set t_Co=256
    colorscheme default
  endif
endif

"set cursorline
set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"make <c-l> clear the highlight as well as redraw
nnoremap <C-c> :nohls<CR><C-L>
inoremap <C-c> <C-O>:nohls<CR>

"neocomplcache 
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1 
let g:neocomplcache_disable_auto_complete = 1 
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionType=2

"hide buffers when not displayed
set hidden

map <F1> <Esc>:w<CR>
imap <F1> <Esc>:w<CR>
map <C-e> :Errors<CR>

"snipmate setup
try
  source ~/.vim/snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

  "if we're in a rails env then read in the rails snippets
  if filereadable("./config/environment.rb")
    try
      call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    catch
      call ExtractSnips("~/vimfiles/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/vimfiles/snippets/eruby-rails", "eruby")
    endtry
  endif

  try
    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
  catch
    call ExtractSnips("~/vimfiles/snippets/html", "eruby")
    call ExtractSnips("~/vimfiles/snippets/html", "xhtml")
    call ExtractSnips("~/vimfiles/snippets/html", "php")
  endtry
endfunction

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" key mapping for inserting date
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"use ; to issue a command"
nnoremap ; :
let mapleader=","

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '\.swp$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
"let NERDTreeWinPos = "right"
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>

" Tagbar
let g:tagbar_left=0
let g:tagbar_width=30
nmap <F6> :TagbarToggle<cr>


nnoremap / /\v
vnoremap / /\v

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>
let g:gundo_right=1


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

" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,gb18030,big5



