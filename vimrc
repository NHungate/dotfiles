set nocompatible              " be iMproved, required
"-------------------------"
" NeoBundle Plugin Manager"
"-------------------------"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

"" My Plugins
NeoBundle 'tmhedberg/matchit'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ervandew/supertab'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'godlygeek/tabular'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
NeoBundle 'https://bitbucket.org/ns9tks/vim-l9'
NeoBundle 'scrooloose/syntastic'

"" Web Development
""" HTML
NeoBundle 'mattn/emmet-vim'

""" Javascript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"-----------------"
" End of NeoBundle"
"-----------------"

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
syntax on                 " Enable syntax highlighting
set number                " show line numbers
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to
set showmatch             " Show matching bracket
set colorcolumn=80        " Make a mark for column 80
set wildmode=list:longest " Show list of commands with Tab completion

"" Search Improvements
set incsearch       " search as characters are entered
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
set history=1000                                 " increase undo history

"" General Usability Improvements
set autoread        " read file after saving or opening buffer
set scrolloff=3     " keep 3 lines visible around cursor at all times
set title           " title of window = vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Prevent comment insertion

"" Change Default Behaviors
set timeout
set timeoutlen=750
set ttimeoutlen=250
set backspace=indent,eol,start " backspace is not limited to current edit position
set visualbell                 " use visual cues for bell instead of sound

"" Session settings
set ssop-=options " Do not store global or local values in a session

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
 set ttimeout
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

"" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

"" HTML Completion
inoremap <F2> </<C-X><C-O>

"" leader bindings
nnoremap <Leader>w :w<CR>

"" Remove search highlighting
nnoremap <leader>/ :nohlsearch<CR>

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

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
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'css'] }

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

"" Neocomplete
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Enable heavy features.
"" Use camel case completion.
""let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
""let g:neocomplcache_enable_underbar_completion = 1

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
    "let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplcache_enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplcache_enable_insert_char_pre = 1

"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplcache_force_omni_patterns')
  "let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
