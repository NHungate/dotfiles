""""""""""""""""
"   vim-plug   "
""""""""""""""""
call plug#begin()

"" My Plugins
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'

"" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'

"" Completion
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" UI
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

"" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'chrisbra/NrrwRgn'
Plug 'gregsexton/MatchTag'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'

"" Linting
Plug 'w0rp/ale'

"" Notes
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'

"" No-distraction editor mode
Plug 'junegunn/goyo.vim'

"" Colorschemes
Plug 'morhetz/gruvbox'

"" Web Development
""" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'wokalski/autocomplete-flow'

""" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript', 'xml'] }

""" Javascript
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript', 'xml'] }
Plug 'sbdchd/neoformat'

call plug#end()
""""""""""""""""
" End vim-plug "
""""""""""""""""

"" Prevent autocomplete for tags
set cpt-=t

""""""""""""""""
" Vim Settings "
""""""""""""""""

"" Change leader to space
let mapleader="\<Space>"

"" Colors
" colorscheme molokai

set termguicolors
set background=dark
let g:gruvbox_sign_column = "bg0"
let g:gruvbox_number_column = "bg1"
colorscheme gruvbox

"" Indentation
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " indenting is 4 spaces
set expandtab       " tabs are spaces

"" UI Config
set number                " show line numbers
set showcmd               " show command in bottom bar
set lazyredraw            " redraw only when we need to
set showmatch             " Show matching bracket
set colorcolumn=80        " Make a mark for column 80
set wildmode=list:longest " Show list of commands with Tab completion
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
" set splitright
" set splitbelow

"" Search Improvements
set hlsearch        " highlight matches
set smartcase       " case-sensitive when capitals are used
set ignorecase      " Search is case insensitive

"" Folding
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested folds max
set foldmethod=syntax " auto-fold based on indentation

"" Buffer
au BufRead,BufNewFile *.md set filetype=markdown " .md = markdown syntax
au BufRead,BufNewFile *.cshtml set filetype=html
au BufRead,BufNewFile *.twig set filetype=html
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

" NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
    set ttimeoutlen=0
endif

"" Custom extras
augroup configgroup
    autocmd!
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType javascript.jsx setlocal tabstop=2
    autocmd FileType javascript.jsx setlocal shiftwidth=2
    autocmd FileType javascript.jsx setlocal softtabstop=2
    autocmd FileType typescript setlocal tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd FileType typescript setlocal softtabstop=2
    autocmd BufWritePre *.js,*.jsx Neoformat
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
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal softtabstop=2
    let g:html_indent_inctags = "html,body,head,tbody"
augroup END

""""""""""""
" Keybinds "
""""""""""""
set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/backup/

"" Check if files have changed
nmap <F5> :checktime<CR>

"" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

"" leader bindings
nnoremap <Leader>w :w<CR>

"" Remove search highlighting
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"" System Clipboard Yank/Put
vmap <Leader>y "+y
vmap <Leader>d "+d

vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>p "+p
nmap <Leader>P "+P

nmap <C-k>g :Goyo<CR>

"" Buffer navigation binds
nmap <leader>n :bn<cr>
nmap <leader>N :bp<cr>
nmap <silent> <leader>D :bp\|bd #<CR>
nmap <Leader>b :FufBuffer<cr>

"" Create a VIM session to resume
nnoremap <Leader>O :source Session.vim<CR>
nnoremap <leader>s :NERDTreeClose<CR>:mksession!<CR>

"" Handle location window
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

"""""""""""""
" Functions "
"""""""""""""

function! BotTerm()
    :bel split | wincmd J | resize 15 | term
endfunction
nnoremap <C-w>t :call BotTerm()<CR>

""""""""""""""""""
" Library Config "
""""""""""""""""""

"" FZF
nmap <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

"" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'jspc#omni'
\]

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"" CtrlP
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_arg_map = 1

"" Emmet
let g:user_emmet_settings = {
            \  'javascript' : {
            \      'extends': 'jsx',
            \  },
            \  'javascript.jsx': {
            \      'extends': 'jsx'
            \  }
            \}

"" NERDTree
map <C-\> :NERDTreeToggle<CR><C-W>=
map <C-]> :NERDTreeFind<CR><C-W>=
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" vim-jsx
let g:jsx_ext_required = 0

"" indent guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"" ale
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

"" airline
" let g:airline_section_a = ''
let g:airline_section_b = ''
let g:airline_section_c = '%f %m%r%h%w%q'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L:%c'
" let g:airline_section_error = '%{ALEGetStatusLine()}'
" let g:airline_section_warning = ''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:vim_json_syntax_conceal = 0
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
