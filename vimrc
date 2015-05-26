" Settings {{{

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=500

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not
" currently loaded in a window.
" If you try and quit Vim while there are hidden buffers, you will raise an
" error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces, all file types
" set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers AND use relative number
set number
set relativenumber

" Highlight tailing whitespace
set list listchars=tab:»·,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
" set splitright

" Highlight the current line and column
set cursorline
set cursorcolumn

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Display the mode you're in.
set showmode

" Complete files like a shell.
set wildmode=list:longest

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

set autoindent

set tags=./tags;

set t_Co=256

set fillchars+=vert:\ 

" Vertical line at 80 characters
set textwidth=80
set colorcolumn=+1

" Keep focus split large, others minimal
set winwidth=84
set winheight=7
set winminheight=7
set winheight=999

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Enable built-in matchit plugin
runtime macros/matchit.vim

set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

" }}}


" Plugins {{{

filetype off " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself
Plugin 'gmarik/Vundle.vim'                " Vundle, the plug-in manager for Vim                   | https://github.com/gmarik/Vundle.vim

" General Vim
Plugin 'gcmt/wildfire.vim'                " Smart selection of the closest text object            | https://github.com/gcmt/wildfire.vim
Plugin 'godlygeek/tabular'                " Vim script for text filtering and alignment           | https://github.com/godlygeek/tabular
Plugin 'ervandew/supertab'                " Use <Tab> for all your insert completion needs        | https://github.com/ervandew/supertab
Plugin 'tomtom/tcomment_vim'              " An extensible & universal comment vim-plugin          | https://github.com/tomtom/tcomment_vim
Plugin 'vim-scripts/BufOnly.vim'          " Delete all the buffers except current/named buffer    | https://github.com/vim-scripts/BufOnly.vim
Plugin 'jlanzarotta/bufexplorer'          " Open/close/navigate vim's buffers                     | https://github.com/jlanzarotta/bufexplorer

" Ruby-specific
Plugin 'vim-ruby/vim-ruby'                " Vim/Ruby Configuration Files                          | https://github.com/vim-ruby/vim-ruby
Plugin 'kana/vim-textobj-user'            " Create your own text objects                          | https://github.com/kana/vim-textobj-user
Plugin 'nelstrom/vim-textobj-rubyblock'   " A custom text object for selecting ruby blocks        | https://github.com/nelstrom/vim-textobj-rubyblock
Plugin 'scrooloose/syntastic'             " Syntax checking hacks for vim                         | https://github.com/scrooloose/syntastic

" Searching and Navigation
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim                        | https://github.com/scrooloose/nerdtree
Plugin 'skwp/greplace.vim'                " Global search and replace for vi                      | https://github.com/skwp/greplace.vim
Plugin 'rking/ag.vim'                     " Vim plugin for the_silver_searcher                    | https://github.com/rking/ag.vim
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits | https://github.com/christoomey/vim-tmux-navigator
Plugin 'ctrlpvim/ctrlp.vim'               " Active fork of kien/ctrlp.vim—Fuzzy file finder       | https://github.com/ctrlpvim/ctrlp.vim

" Look and Feel
Plugin 'altercation/vim-colors-solarized' " Precision colorscheme for the vim text editor         | https://github.com/altercation/vim-colors-solarized
Plugin 'bling/vim-airline'                " Status/tabline for vim                                | https://github.com/bling/vim-airline

" Tim Pope
Plugin 'tpope/vim-fugitive'               " Git wrapper for vim                                   | https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-git'                    " Vim Git runtime files                                 | https://github.com/tpope/vim-git
Plugin 'tpope/vim-endwise'                " Add 'end' keyword when needed                         | https://github.com/tpope/vim-endwise
Plugin 'tpope/vim-surround'               " Quoting/parenthesizing made simple                    | https://github.com/tpope/vim-surround
Plugin 'tpope/vim-rails'                  " Ruby on Rails power tools                             | https://github.com/tpope/vim-rails
Plugin 'tpope/vim-ragtag'                 " HTML/XML mappings                                     | https://github.com/tpope/vim-ragtag
Plugin 'tpope/vim-obsession'              " Continuously updated session files                    | https://github.com/tpope/vim-obsession
Plugin 'tpope/vim-rake'                   " Extended funtionality for rails.vim                   | https://github.com/tpope/vim-rake
Plugin 'tpope/vim-bundler'                " Vim goodies for Bundler, rails.vim, rake.vim          | https://github.com/tpope/vim-bundler


" Related to testing & tmux
Plugin 'benmills/vimux'                   " Vim plugin to interact with tmux                      | https://github.com/benmills/vimux
Plugin 'jgdavey/tslime.vim'               " Send command from vim to a running tmux session       | https://github.com/jgdavey/tslime.vim
Plugin 'thoughtbot/vim-rspec'             " Run Rspec specs from Vim                              | https://github.com/thoughtbot/vim-rspec
Plugin 'skalnik/vim-vroom'                " A vim plugin for running your Ruby tests              | https://github.com/skalnik/vim-vroom

" Related to vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'     " [vim-snipmate dependency]                             | https://github.com/MarcWeber/vim-addon-mw-utils
Plugin 'tomtom/tlib_vim'                  " [vim-snipmate dependency]                             | https://github.com/tomtom/tlib_vim
Plugin 'garbas/vim-snipmate'              " Textmate-style snippet behavior for vim               | https://github.com/garbas/vim-snipmate
Plugin 'honza/vim-snippets'               " vim-snipmate default snippets                         | https://github.com/honza/vim-snippets

" Other
Plugin 'kchmck/vim-coffee-script'         " CoffeeScript support for vim                          | https://github.com/kchmck/vim-coffee-script
Plugin 'bronson/vim-trailing-whitespace'  " Highlights trailing whitespace in red                 | https://github.com/bronson/vim-trailing-whitespace
Plugin 'duff/vim-scratch'                 " Create a temporary scratch buffer                     | https://github.com/duff/vim-scratch
Plugin 'airblade/vim-gitgutter'           " Shows a git diff in the 'gutter'                      | https://github.com/airblade/vim-gitgutter
Plugin 'mattn/webapi-vim'                 " Allow vim to interface with web APIs                  | https://github.com/mattn/webapi-vim
Plugin 'vim-scripts/Gist.vim'             " Post gists from vim                                   | https://github.com/vim-scripts/Gist.vim
Plugin 'Glench/Vim-Jinja2-Syntax'         " An up-to-date jinja2 syntax file                      | https://github.com/Glench/Vim-Jinja2-Syntax

" All of your Plugins must be added before the following line
call vundle#end()                         " required
filetype plugin indent on                 " required

" }}}


" General Mappings {{{

let mapleader = " "

" Misc
map <leader>ev :tabe ~/.vimrc<CR>
map <leader>r :source ~/.vimrc<CR>:AirlineRefresh<CR>
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>ra :%s/
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR> " Fix indentation on paste
map <leader>i mmgg=G`m<CR> " For indenting code
map <leader>h :nohl<CR> " Clear highlights
map <leader>s :%s/\s\+$//e<CR> " Manually clear trailing whitespace
imap <C-[> <C-c> " Return to normal mode faster
map <C-t> <esc>:tabnew<CR> " Open a new tab with Ctrl+T
inoremap jj <C-c> " jj to switch back to normal mode
nnoremap <leader><leader> <c-^> " Switch between the last two files
map Q <Nop> " Disable Ex mode
map K <Nop> " Disable K looking stuff up
nmap <leader>O O<Esc> " Add new line ABOVE without leaving normal mode

" Delete all lines beginning with '#' regardless of leading space.
map <leader>d :g/^\s*#.*/d<CR>:nohl<CR>

" Run 'git blame' on a selection of code
vmap <leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Reminders :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" }}}


" Plugin-specific Mappings and Settings {{{

" NERDTree
map <leader>\ :NERDTreeToggle<CR>

" Tcomment
map <leader>/ :TComment<CR>

" Bufexplorer - unmapping defaults because they cause delay for <leader>b
map <leader>b :ToggleBufExplorer<CR>

" Obsession
map <leader>ob :Obsession<CR>

" vim-rspec
map <leader>f :call RunCurrentSpecFile()<CR>
map <leader>n :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>
let g:rspec_command = 'call VimuxRunCommand("clear; bin/rspec {spec}")'

" vroom.vim (alternative plugin to vim-rspec)
" map <leader>n :VroomRunNearestTest<CR>
" map <leader>f :VroomRunTestFile<CR>
" map <leader>l :VroomRunLastTest<CR>
" let g:vroom_use_vimux = 1
" let g:vroom_use_colors = 1
" let g:vroom_use_bundle_exec = 0
" let g:vroom_map_keys = 0
" let g:vroom_clear_screen = 0

" Vimux
" Prompt for a command to run map
map <leader>vp :VimuxPromptCommand<CR>

" Inspect runner pane map
map <leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand. If a pane is closed manually,
" the vim-rspec commands will no longer cause a new pane to open. Calling
" :VimuxCloseRunner() will 'reset' Vimux, after which the vim-rspec commands
" will pop open a new pane as they did initially.
map <leader>vq :VimuxCloseRunner<CR>

" Zoom the tmux runner page
map <leader>vz :VimuxZoomRunner<CR>

" Set the size of the vimux window.
let g:VimuxHeight = "30"

" CtrlP
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 15

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" Custom rails.vim commands
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
command! RSroutes :sp config/routes.rb
command! RVroutes :vs config/routes.rb
command! Rfactories :e spec/factories.rb
command! RTfactories :tabe spec/factories.rb
command! RSfactories :sp spec/factories.rb
command! RVfactories :vs spec/factories.rb

" vim-scratch
map <C-s> :Sscratch<CR>

" Gist settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" }}}


" Commands {{{

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal lbr
au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype sh,markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,html,zsh,vim,css,scss,gitconfig setlocal shiftwidth=2 tabstop=2 expandtab

" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal path+=lib

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Close vim if only nerdtree window is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" Unmap GitGutter leaders that I don't use. This avoids delays for other leaders.
autocmd VimEnter * nunmap <leader>hp
autocmd VimEnter * nunmap <leader>hr
autocmd VimEnter * nunmap <leader>hs

" Unmap Bufexplorer leaders that I don't use. This avoids delays for other leaders.
autocmd VimEnter * nunmap <leader>bs
autocmd VimEnter * nunmap <leader>bv

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" }}}


" Airline (status line) {{{
" https://github.com/bling/vim-airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = 'Ln'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_theme='powerlineish'

" }}}


" Colorscheme {{{

" set background=light " light theme
set background=dark " dark theme
colorscheme solarized

" }}}
