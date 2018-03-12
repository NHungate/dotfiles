""""""""""""""""
"   vim-plug   "
""""""""""""""""
call plug#begin()

"" Essentials
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-completion-manager' " pip3 install --user neovim jedi mistune psutil setproctitle
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript', 'xml'] }
Plug 'machakann/vim-highlightedyank'
Plug 'wellle/targets.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

"" Causes visual issues
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

"" UI
Plug 'mhinz/vim-grepper'
Plug 'milkypostman/vim-togglelist'

"" Navigation
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'gregsexton/MatchTag'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'bronson/vim-visual-star-search'
Plug 'chrisbra/NrrwRgn'

"" Whitespace
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'

"" No-distraction editor mode
Plug 'junegunn/goyo.vim'

"" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'morhetz/gruvbox'

"" Web Development
""" Syntax
" Plug 'janko-m/vim-test'
" Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

""" Javascript
Plug 'roxma/nvim-cm-tern', { 'do': 'npm install' }
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

let g:netrw_altfile=1
"" Change leader to space
let mapleader="\<Space>"
map <Leader>a ggVG

"" Colors
set termguicolors
set background=dark
colorscheme gruvbox

"" Backups
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"" Persistant undo
set undofile
if !has('nvim')
  set undodir=~/.vim/undo//
endif

"" Indentation
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " indenting is 2 spaces
set expandtab " tabs are spaces

"" UI Config
""" Show absolute line numbers in insert mode and relative line numbers in other modes
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set showcmd " show command in bottom bar
set lazyredraw " redraw only when we need to
set showmatch " Show matching bracket
set colorcolumn=80 " Make a mark for column 80
set wildmode=list:longest " Show list of commands with Tab completion
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set splitbelow splitright

"" Mouse Scroll disable
set mouse=a " Enable mouse events in supported terminals
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

"" Terminal cursor highlight
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

"" Search Improvements
set hlsearch " highlight matches
set smartcase " case-sensitive when capitals are used
set ignorecase " Search is case insensitive
set inccommand=nosplit " Highlight and live update while substituting

"" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " auto-fold based on indentation

"" Buffer
au BufRead,BufNewFile *.md set filetype=markdown " .md = markdown syntax
au BufRead,BufNewFile *.cshtml set filetype=html
au BufRead,BufNewFile *.twig set filetype=html
set hidden " deleted buffers are hidden instead

"" General Usability Improvements
set title " title of window = vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Prevent comment insertion

"" Ignore folders and specific files
""" Lib folders
set wildignore+=*/lib/**,*/_3rd_party_/**,*/node_modules/**,*/bower_components/**

""" Images
set wildignore+=*.png,*.PNG,*.jpg,*.jpeg,*.JPG,*.JPEG,*.pdf

""" Fonts
set wildignore+=*.ttf,*.otf,*.woff,*.woff2,*.eot

"" Change Default Behaviors
set timeout
set timeoutlen=750
set updatetime=250
set visualbell " use visual cues for bell instead of sound

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

"" Alt. buffer shortcut
nnoremap <BS> <C-^>

"" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

"" Exit terminal with Esc or insert Esc with C-v
" if has('nvim')
"   tnoremap <Esc> <C-\><C-n>
"   tnoremap <C-v><Esc> <Esc>
" endif

"" Convenient save mapping
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

"" Buffer navigation binds
nmap <silent> <Leader>D :bp\|bd #<CR>

"" Create a VIM session to resume
nnoremap <Leader>O :source Session.vim<CR>
nnoremap <Leader>s :NERDTreeClose<CR>:mksession!<CR>

""""""""""""""""""
" Library Config "
""""""""""""""""""

"" FZF
nmap <C-p> :Files<CR>
nmap <Leader>b :Buffers<CR>
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
map <C-\> :NERDTreeToggle<CR>
map <C-]> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeHijackNetrw=0

"" vim-jsx
let g:jsx_ext_required = 0

"" ale
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'

"" airline
let g:airline_section_b = ''
let g:airline_section_c = '%f %m%r%h%w%q'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L:%c'
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
" let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = []

"" vim-javascript
let g:vim_json_syntax_conceal = 0
let g:javascript_plugin_flow = 1
" let g:javascript_plugin_jsdoc = 1

"" tern_for_vim
let g:tern_map_keys=1
nmap <F11> :TernDefPreview<CR>
nmap <F12> :TernDef<CR>

""" vim-hardtime
" nmap <c-k>h :HardTimeToggle<CR>
" let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

"" Goyo
" nmap <c-k>z :Goyo<CR>

"" Grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
vnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Open Grepper-prompt for a particular Grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

augroup vimrc
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

"" Use nvr in nvim term mode
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

"" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]

"" Tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
inoremap <silent> <M-h> <Esc>:TmuxNavigateLeft<CR>
inoremap <silent> <M-j> <Esc>:TmuxNavigateDown<CR>
inoremap <silent> <M-k> <Esc>:TmuxNavigateUp<CR>
inoremap <silent> <M-l> <Esc>:TmuxNavigateRight<CR>
vnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
vnoremap <silent> <M-j> :TmuxNavigateDown<CR>
vnoremap <silent> <M-k> :TmuxNavigateUp<CR>
vnoremap <silent> <M-l> :TmuxNavigateRight<CR>
if has('nvim')
  tnoremap <silent> <M-h> <c-\><c-n>:TmuxNavigateLeft<CR>
  tnoremap <silent> <M-j> <c-\><c-n>:TmuxNavigateDown<CR>
  tnoremap <silent> <M-k> <c-\><c-n>:TmuxNavigateUp<CR>
  tnoremap <silent> <M-l> <c-\><c-n>:TmuxNavigateRight<CR>
endif

let g:flow#enable = 0
let g:flow#showquickfix = 0

"" NrrwRgn
nmap <F3> <Plug>NrrwrgnWinIncr

"" Lightline
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'warning',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.component_function = { 'filename': 'LightLineFilename' }

function! LightLineFilename()
  " return pathshorten(fnamemodify(expand('%'),':~:.'))
  return expand('%')
endfunction

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings' ]] }


"" Hardtime
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 5
let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
