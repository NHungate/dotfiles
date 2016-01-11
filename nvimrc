""""""""""""""""
"   vim-plug   "
""""""""""""""""
call plug#begin()

"" My Plugins
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
" Plug 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
" Plug 'https://bitbucket.org/ns9tks/vim-l9'
Plug 'scrooloose/syntastic'

"" Web Development
""" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }

""" Javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'jelera/vim-javascript-syntax' 
Plug 'moll/vim-node'

call plug#end()

""""""""""""""""
" End vim-plug "
""""""""""""""""
" Usability Preferences
"" Change leader to space
let mapleader="\<Space>"

"" Colors
colorscheme base16-default
set background=dark

"" Indentation
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " indenting is 4 spaces
set expandtab       " tabs are spaces
set smartindent     " indent blocks automatically
set copyindent

"" UI Config
set number                " show line numbers
set showcmd               " show command in bottom bar
set lazyredraw            " redraw only when we need to
set showmatch             " Show matching bracket
set colorcolumn=80        " Make a mark for column 80
set wildmode=list:longest " Show list of commands with Tab completion

"" Search Improvements
set hlsearch        " highlight matches
set smartcase       " case-sensitive when capitals are used
set ignorecase      " Search is case insensitive

"" Folding
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested folds max
set foldmethod=indent " auto-fold based on indentation

"" Buffer
au BufRead,BufNewFile *.md set filetype=markdown " .md = markdown syntax
au BufRead,BufNewFile *.cshtml set filetype=html 
set hidden                                       " deleted buffers are hidden instead

"" General Usability Improvements
set title           " title of window = vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Prevent comment insertion

"" Change Default Behaviors
set timeout
set timeoutlen=750
set visualbell                 " use visual cues for bell instead of sound

"" Session settings
set ssop-=folds " Do not store folds

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
 set ttimeoutlen=0
endif

"" Custom extras
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.html setlocal tabstop=2
    autocmd BufEnter *.html setlocal shiftwidth=2
    autocmd BufEnter *.html setlocal softtabstop=2
augroup END

" Keybinds

"" Toggle Paste mode
nmap <F12> :set paste!<CR>

"" Check if files have changed
nmap <F5> :checktime<CR>

"" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

"" HTML Completion
inoremap <F2> </<C-X><C-O>

"" leader bindings
nnoremap <Leader>w :w<CR>

"" Remove search highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"" System Clipboard Yank/Put
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" Buffer navigation binds
nmap <leader>n :bn<cr>
nmap <leader>N :bp<cr>
nmap <silent> <leader>D :bp\|bd #<CR>
nmap <Leader>b :FufBuffer<cr>

"" Create a VIM session to resume
nnoremap <Leader>O :source Session.vim<CR>
nnoremap <leader>s :mksession!<CR>

" Plugin Support
"" CtrlP
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_arg_map = 1

"" CtrlP C-Matcher
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=10 ctermbg=10
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd guibg=11 ctermbg=11

"" Syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'css', 'html'] }
let g:syntastic_javascript_checkers = ['jshint']

"" TagBar
nmap <F8> :TagbarToggle<CR>

"" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" Functions
"" Remove trailing whitespace
command! StripTrailingWhitespaces call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"" Handlebars
let g:mustache_abbreviations = 1
