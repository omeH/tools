set nocompatible " be iMproved, required
filetype off 	 " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required
"---------=== Code/project navigation ===-------------
" Plugin 'Shougo/unite.vim' 		" Navigation between buffers and files
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar' 		" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim' 	" Pending tasks list
Plugin 'rosenfeld/conque-term' 		" Consoles as buffers
Plugin 'tpope/vim-surround'		" Parentheses, brackets, quotes, XML tags, and more
Plugin 'kien/rainbow_parentheses.vim'   " Color all 

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
Plugin 'scrooloose/syntastic'		" Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'		" Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'		" Sparkup (XML/jinja/htlm-django/etc.) support

" --- Clojure ---
Plugin 'tpope/vim-fireplace'            " Clojure completion	
Plugin 'guns/vim-clojure-highlight'	" Highlighting code
Plugin 'guns/vim-clojure-static'        " Highlighting for static types

" --- CSS ---
Plugin 'JulesWang/css.vim'		" CSS syntax file
Plugin 'groenewege/vim-less'		" Vim syntax for LESS (dynamic CSS)

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'	" Vastly improved Javascript indentation and syntax support in Vim

" --- HTML ---
Plugin 'othree/html5.vim'		" HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'		" Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" --- Python ---
Plugin 'davidhalter/jedi-vim'		" Awesome Python autocompletion with VIM
Plugin 'klen/python-mode'		" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'   " PEP8 indent
Plugin 'tshirtman/vim-cython'		" Cython support

" --- Rust ---
Plugin 'wting/rust.vim'			" Vim support for Rust file detection and syntax highlighting

call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
let mapleader=","
set backspace=indent,eol,start
" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

" Activate a permanent ruler and add line highlightng as well as numbers.
" Also disable the sucking pydoc preview window for the omni completion
" and highlight current line and disable the blinking cursor.
set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
    set cursorline
endif
set ttyfast

" Enable Syntax Colors
" in GUI mode we go with fruity and Monaco 13
" in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
    " GUI? Then maximize windows and set custom color sheme
    set lines=50 columns=125
    colorscheme fruity-molokai
" special settings for vim
if has("mac")
    set guifont=Consolas:h13
    set fuoptions=maxvert,maxhorz
else
    " set default font for GUI
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
    " set guifont=Input\ Mono\ Regular\ 10
endif
else
   " its terminal, setup another theme
   colorscheme molokai
endif

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell 	" turn off visual bell
set enc=utf-8		" utf-8 default encoding
set ls=2 		" always show status bar
set incsearch		" incremental search
set hlsearch		" highlighted search results
set nu			" line numbers
set scrolloff=5		" keep some more lines for scope
set t_Co=256		" Enable 256 colors in the terminal

" Swaps and backups
if has("win32") || has("win64")
    set dir=$TMP
    set backupdir=$TMP
else
    set dir=/tmp
    set backupdir=/tmp
endif

" disable backup and swap files
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" Hide some panels
set guioptions-=m 	" remove menu bar
set guioptions-=T 	" remove toolbar
set guioptions-=r 	" remove right-hand scroll bar

" Tab Settings
set smarttab
set tabstop=8

" Highlight characters past column 120
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" Unite settings
" nnoremap <F1> :Unite file<CR>	" browse the list of files in the current directory
" nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" TaskList settings
map <F2> :TaskList<CR> " show pending tasks list

" NERDTreeToggle setting
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open

" SnipMate
let g:snips_author="omeH"
let g:snips_github="https://github.com/omeH"
" let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

" ConqueTerm
autocmd FileType python nnoremap <F5> :ConqueTermSplit ipython<CR>
autocmd FileTYpe python nnoremap <F6> :exe "ConqueTermSplit ipython" . expand("%")<CR>
let g:CouqueTerm_Color = 0
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Jedi-vim
let g:jedi#popup_on_dot = 0 	 	" Disable the automatic suggestions
let g:jedi#popup_select_first = 0	" Disable first select from auto-complete

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
noremap <f7> :w<CR>:SyntasticCheck<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

"=====================================================
" Python-mode settings
"=====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="EE501,E201,E202,W601,C0110"
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-Left>  :vertical resize +5<cr>
nnoremap <M-Right> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<CR>

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Switch between syntax
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>
nnoremap <leader>Tv :set ft=vim<CR>
nnoremap <leader>Tr :set ft=ruby<CR>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- Clojure ---
autocmd FileType clj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'
autocmd FileType python inoremap ( ()<Left>
autocmd FileType python inoremap [ []<Left>
autocmd FileType python inoremap { {}<Left>

" --- Rust ---
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

"=====================================================
" User functions
"=====================================================
" Small helper that inserts a random uuid4
" ----------------------------------------
function! InsertUUID4()
python << endpython
if 1:
    import uuid, vim
    s = str(uuid.uuid4())
    cpos = vim.current.window.cursor
    cline = vim.current.line
    vim.current.line = cline[:cpos[1] + 1] + s + cline[cpos[1] + 1:]
    vim.current.window.cursor = (cpos[0], cpos[1] + len(s))
endpython
endfunction

" --- SpellLang ---
setlocal spell spelllang=en,ru

" --- mouse ---
set mouse=a
