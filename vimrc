"*** Prepare to load bundles ***
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"*** Different bundles
Bundle 'gmarik/vundle'

" UI Additions
Bundle 'godlygeek/csapprox'
Bundle 'vim-scripts/zenesque.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'chrisbra/NrrwRgn'
" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'sjl/gundo.vim'
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
if executable('ack-grep') || executable('ack')
    Bundle 'mileszs/ack.vim'
endif
if executable('git')
    Bundle 'tpope/vim-fugitive'
endif
Bundle 'benmills/vimux'
Bundle 'ZoomWin'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'godlygeek/tabular'
Bundle 'mutewinter/swap-parameters'
" Automatic Helper
Bundle 'garbas/vim-snipmate'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
" Language related
Bundle 'tpope/vim-rails'
Bundle 'mattn/zencoding-vim'
Bundle 'swaroopch/vim-markdown-preview'
Bundle 'sampsyo/autolink.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'ZeusTheTrueGod/vim-format-js.git'
Bundle 'rodjek/vim-puppet'

" Others
"if executable('ctags')
"   Bundle 'xolox/vim-easytags'
"endif
Bundle 'tpope/vim-repeat'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

"Fix vim defaults
let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader

set nocompatible
set lazyredraw
set ttyfast
set backspace=indent,eol,start  " backspace works as expected
set nostartofline               " Make j/k respect the columns (after all, this is not a freaking typewriter) 
set modeline                    " Respect modeline of the file (the famous "vi:noai:sw=3 ts=6" on the beginning of the files)
set hidden                      " Avoid asking to save before hiding
set enc=utf-8
set nospell "I hate that stupid spell checking, it sucks, really!!!

filetype on
filetype plugin on
filetype indent on
syntax on

" Basic UI 
set novisualbell
set shm=atIWswxrnmlf
set ruler
set numberwidth=1
set report=2
set laststatus=2    
set statusline=%f
set showcmd
set showmode
set nu

set autoread " Set autoread when a file is changed outside
set autowriteall " Write on make/shell commands
set hidden " Turn on hidden"

set history=1000 " Increase the lines of history
set nobackup
set noswapfile


set clipboard+=unnamed " Yanks go on clipboard instead
set nospell " Spell checking on
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete

" Command-mode completion
"
set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
set wildmode=list:longest
" Insert-mode completion
set complete=.,w,b,u,U,t,i,d

" Scrolling
set scroll=5
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Matching
set showmatch
set matchpairs=(:),{:},[:],<:>

" Search and replace
set gdefault        " Make regexp matches everything, instead of just the first one 
set incsearch       " Search all instances
set hlsearch        " Highlight matched regexp 
set ignorecase
set smartcase       " Intelligent case-smart searching


" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Platform Specific Configuration
"-------------------------------------------------

set fileformats=unix

set matchtime=2 " Decrease the time to blink

set number " Show line numbers

set formatoptions+=rnlmM " Optimize format options
set wrap " Set wrap
set textwidth=80 " Change text width
set colorcolumn=0 " Indicate text border
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
set linebreak " Wrap long lines at a blank
set fillchars=diff:⣿,vert:│ " Change fillchars

" COLORCHEMES
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' } 
colorscheme zenesque 

nnoremap <silent>\t :colorscheme Tomorrow-Night-Eighties<CR>
nnoremap <silent>\j :colorscheme jellybeans<CR>
nnoremap <silent>\h :colorscheme hybrid<CR>
nnoremap <silent>\s :colorscheme solarized<CR>
nnoremap <silent>\z :colorscheme zenesque<CR>

"-------------------------------------------------
" => Indent and Tab Related
"-------------------------------------------------

set autoindent " Preserve current indent on new lines
set cindent " set C style indent
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop

nnoremap <Leader><Space> :set hlsearch!<CR>


"-------------------------------------------------
" => Filetype Specific
"-------------------------------------------------

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

" C and C++
augroup ft_c
    autocmd!
    " TODO
augroup END

" Perl
augroup ft_perl
    autocmd!
    " TODO
augroup END

" Ruby
augroup ft_ruby
    autocmd!
    " TODO
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

" Redesign moving keys in insert mode
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Navigation between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Remap ; to :
nnoremap ; :
vnoremap ; :


" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Tagbar
"--------------------------------------------------

nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NERD_tree
"--------------------------------------------------

nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>O :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeDirArrows=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => NERD_commenter
"--------------------------------------------------

let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Ack
"--------------------------------------------------

if executable('ack-grep') || executable('ack')
    nnoremap <Leader>a :Ack!<Space>
endif
if has('unix') && executable('ack-grep')
    let g:ackprg='ack-grep -H --nocolor --nogroup --column'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Syntastic
"--------------------------------------------------

nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => fugitive
"--------------------------------------------------

if executable('git')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push origin HEAD<CR>
endif


"--------------------------------------------------
" => Gundo
"--------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vimux
"--------------------------------------------------

nnoremap <Leader>vp :VimuxPromptCommand<CR>
vnoremap <Leader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nnoremap <Leader>vx :VimuxClosePanes<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vc :VimuxClearRunnerHistory<CR>

set exrc
