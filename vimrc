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
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'L9'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/vimproc.vim'

"" Web Development
NeoBundle 'csscomb/vim-csscomb'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/Neocomplete.vim'
"NeoBundle 'Valloric/YouCompleteMe'

"" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
"-----------------"
" End of NeoBundle"
"-----------------"

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Usability Preferences
"" Change leader to space
let mapleader="\<Space>"

"" Colors

let g:PromptTerm=0
let g:SolarColorSet="light"


if &term =~ '256color'
    set t_ut=
endif

set t_Co=256

"" Indentation
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " indenting is 4 spaces
set expandtab       " tabs are spaces
set smartindent     " indent blocks automatically
set copyindent

"" UI Config
syntax on
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch
set colorcolumn=80  " Make a mark for column 80

"" Search Improvements
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set smartcase       " case-sensitive when capitals are used
"" turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

"" Folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested folds max
set foldmethod=indent   " auto-fold based on indentation

"" Buffer
au BufRead,BufNewFile *.md set filetype=markdown    " .md = markdown syntax
set hidden          " deleted buffers are hidden instead
set history=1000    " increase undo history

"" General Usability Improvements
set autoread        " read file after saving or opening buffer
set scrolloff=3     " keep 3 lines visible around cursor at all times
set title           " title of window = vim

filetype on
filetype plugin on

"" Change Default Behaviors
set ttimeoutlen=200 " fix shift-o delay
set backspace=indent,eol,start  " backspace is not limited to current edit position
set visualbell      " use visual cues for bell instead of sound

"" Custom extras
set wildmode=list:longest       " ?

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
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
augroup END


" Keybinds
nmap <F12> :set paste!<CR>
"" Toggle Colors adjusts for term type
function! ToggleSolarColors(currentBG)
    if a:currentBG == "dark"
        let g:SolarColorSet="light"
        set background=light
    else
        let g:SolarColorSet="dark"
        set background=dark
    endif
    colorscheme solarized
    " execute 'AirlineRefresh'
endfunc

function! TogglePromptTermColor()
    if g:solarized_termcolors == 16
        let g:solarized_termcolors = 256
    else
        let g:solarized_termcolors = 16
    endif
endfunc

call ToggleSolarColors(SolarColorSet)
nmap <F9> :call ToggleSolarColors(SolarColorSet)<CR>
nmap <F10> :call TogglePromptTermColor()<CR>

"" Move vertically by visual line
nnoremap j gj
nnoremap k gk

"" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

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

"" leader bindings

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" Buffer navigation binds
nmap <leader>n :bn<cr>
nmap <leader>b :bp<cr>
nmap <leader>d :bd<cr>

"" Create a VIM session to resume
nnoremap <leader>s :mksession!<CR>

" Plugin Support
"" Indent Guides
let g:indent_guides_guide_size = 1

"" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

"" delimitMate
let delimitMate_expand_cr = 1

"" Toggle background color
call togglebg#map("<F6>")

"" YouCompleteMe Options
let g:ycm_add_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_collect_identifiers_from_tags_files=1
set omnifunc=syntaxcomplete#Complete

"" HTML Completion
inoremap <F2> </<C-X><C-O>
nmap <leader>tt :TagbarToggle<CR>

"" UltiSnips Support
let g:UltiSnipsExpandTrigger="<c-j>"

"" Lightline
" set laststatus=2

"" Create buffer tab bar
set showtabline=2
set tabline=%!Tabline()
function! Tabline()
  let line = ""
  for buf in range(1, bufnr('$'))
    if !buflisted(buf)
        continue
    endif
    if buf == bufnr("%")
      let line = line."%#TabLineSel#".fnamemodify(bufname(buf), ":t")."%## "
    else
      let line = line."".fnamemodify(bufname(buf), ":t")." "
    endif
  endfor
  return line
endfunction

au FileType gitcommit setl nobuflisted
