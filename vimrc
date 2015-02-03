" -----------------------------------------------
" -                   Vundle                    -
" -----------------------------------------------
" Essential/Usability fuctions
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'csscomb/vim-csscomb'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'itchyny/lightline.vim'
" Plugin 'Raimondi/delimitMate'
" Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------
" -               End of Vundle                 -
" -----------------------------------------------

" Usability Preferences

" Change leader to comma
let mapleader="\<Space>"

syntax on
" Colors

let g:PromptTerm=0
let g:SolarColorSet="light"


if &term =~ '256color'
    set t_ut=
endif

" Indentation
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " indenting is 4 spaces
set expandtab       " tabs are spaces
set smartindent     " indent blocks automatically

" UI Config
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch
set colorcolumn=80  " Make a mark for column 80

" Search Improvements
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set smartcase       " case-sensitive when capitals are used
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested folds max
set foldmethod=indent   " auto-fold based on indentation

" Buffer
au BufRead,BufNewFile *.md set filetype=markdown    " .md = markdown syntax
set hidden          " deleted buffers are hidden instead
set history=1000    " increase undo history

" General Usability Improvements
set autoread        " read file after saving or opening buffer
set scrolloff=3     " keep 3 lines visible around cursor at all times
set title           " title of window = vim

filetype on
filetype plugin on

" Change Default Behaviors
set ttimeoutlen=200 " fix shift-o delay
set backspace=indent,eol,start  " backspace is not limited to current edit position
set visualbell      " use visual cues for bell instead of sound

" Custom extras
set wildmode=list:longest       " ?

" Keybinds
" Toggle Colors adjusts for term type
function! ToggleSolarColors(currentBG)
    if a:currentBG == "dark"
        let g:SolarColorSet="light"
        set background=light
    else
        let g:SolarColorSet="dark"
        set background=dark
    endif
    colorscheme Solarized
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

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Switch ' to more useful `
nnoremap ' `
nnoremap ` '

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" save session

" leader bindings

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Buffer navigation binds
nmap <leader>n :bn<cr>
nmap <leader>b :bp<cr>
nmap <leader>d :bd<cr>

" Create a VIM session to resume
nnoremap <leader>s :mksession<CR>

" Plugin Support

" Indent Guides
let g:indent_guides_guide_size = 1

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

" delimitMate
let delimitMate_expand_cr = 1

" Toggle background color
call togglebg#map("<F6>")

" YouCompleteMe Options
let g:ycm_add_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
set omnifunc=syntaxcomplete#Complete

" HTML Completion
inoremap <F2> </<C-X><C-O>

" UltiSnips Support
let g:UltiSnipsExpandTrigger="<c-j>"

" Lightline
set laststatus=2
" let g:lightline = {
"     \ 'colorscheme': '16color',
"     \ }
" let g:lightline.enable = {
"     \ 'tabline': 0
"     \ }

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" set laststatus=0
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

