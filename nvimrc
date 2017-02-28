""""""""""""""""
"   vim-plug   "
""""""""""""""""
call plug#begin()

"" My Plugins
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'
Plug 'neomake/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'

"" Web Development
""" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'typescript', 'xml'] }
Plug 'othree/html5.vim', { 'for': ['html'] }

""" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }

""" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] } | Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
Plug 'moll/vim-node', { 'for': ['javascript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }

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
colorscheme molokai

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
    autocmd BufWritePost,BufReadPost *.js Neomake
    autocmd BufWritePost,BufReadPost *.ts Neomake
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType typescript setlocal tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd FileType typescript setlocal softtabstop=2
    autocmd BufWritePre *.py,*.js,*.ts :call Preserve("%s/\\s\\+$//e")
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

"" Buffer navigation binds
nmap <leader>n :bn<cr>
nmap <leader>N :bp<cr>
nmap <silent> <leader>D :bp\|bd #<CR>
nmap <Leader>b :FufBuffer<cr>

"" Create a VIM session to resume
nnoremap <Leader>O :source Session.vim<CR>
nnoremap <leader>s :mksession!<CR>

"" Handle location window
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

"""""""""""""
" Functions "
"""""""""""""

"" Remove trailing whitespace
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction 
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

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

" autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" CtrlP
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_arg_map = 1

"" NeoMake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']

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
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" vim-jsx
let g:jsx_ext_required = 0
