" Author:  Travis Cyronek
" Date:    3 August 2017
" Purpose: Vim configuration settings


" ----- Plugin Management (Vundle) ----- " {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'jpalardy/vim-slime'
Plugin 'vim-latex/vim-latex'
call vundle#end()

" }}}


" ----- Editing Settings ----- " {{{

" Filetype, Spell Check, and Encoding
filetype plugin on
filetype indent on
autocmd filetype latex,tex let b:did_indent=1
autocmd filetype latex,tex setlocal indentexpr=
autocmd filetype latex,tex setlocal spell spelllang=en_us
set encoding=utf-8

" Searching
set hlsearch  " highlight matches
set incsearch " search as characters are entered
set wildmenu  " visual autocomplete menu for commands

" Tabs
set expandtab     " sets tabs to spaces
set softtabstop=4 " number of spaces in tab when editing
set tabstop=4     " number of visual spaces per tab
set shiftwidth=4  " make indents a single tab

" Folding and Splitting
set foldenable        " enables folding
set foldmethod=marker " create folds with {{{ }}}
set splitbelow        " split window below
set splitright        " split window to the right

" Miscellany
set backspace=indent,eol,start " backspace acts as normal
set clipboard=unnamed          " vim saves to / takes from the system clipboard

" }}}


" ----- User Interface ----- " {{{

" Text
syntax on                                          " enables syntax processing
set cursorline                                     " highlight current line
set cursorcolumn                                   " highlight current column
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10 " must have unicode chars
set showmatch                                      " highlight matching for {[()]}

" Color
colorscheme solarized " a nice color scheme
set background=dark   " background dark / light
set t_Co=256          " let it use all colors

" Window
set cmdheight=2          " command line height
set columns=120 lines=65 " default size of window (when not in fullscreen)
set laststatus=2         " status bar open by default
set lazyredraw           " don't redraw mid macro
set number               " row numbering
set relativenumber       " numbering is relative to selected line
set numberwidth=5        " line-number margin width
set guioptions -=m       " removes the menubar
set guioptions -=T       " removes the toolbar

" }}}


" ----- Custom Key Bindings ----- " {{{

" F2 toggles Nerd Tree and LEADER-F2 toggles command to list/switch buffers
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <leader><f2> :buffers<cr>:buffer<Space>

" F3 and LEADER-F3 toggle syntastic syntax checking
nnoremap <f3> :SyntasticCheck<cr>
nnoremap <leader><f3> :SyntasticReset<cr>
nnoremap <a-f3> :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>

" F4 and LEADER-F4 copile latex document and open viewer
nnoremap <f4> :call Tex_RunLaTeX()<cr>
nnoremap <leader><f4> :call Tex_ViewLaTeX()<cr>

" }}}


" ----- Airline ----- " {{{

let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts=1    " allow it to use powerline fonts / symbols
if !exists('g:airline_symbols')    " makes sure it doesn't overwrite stuff
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" }}}


" ----- NerdTree ----- " {{{

let g:NERDTreeWinPos="right"

" }}}


" ----- Syntastic ----- " {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }

" }}}


" ----- Vim-Slime ----- " {{{

let g:slime_target="conemu"
"let g:slime_target="tmux"

" }}}


" ----- Vim-Latex (aka Latex Suite) ----- " {{{

let g:Tex_flavor="latex"
let g:Tex_CompileRule_pdf="pdflatex --interaction=nonstopmode $*"

" set target format to pdf and tell what reader to use
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf,bibtex,pdf"
let g:Tex_ViewRule_pdf="SumatraPDF"

" do not go to the location of the first error after compile
let g:Tex_GotoError=0

" disable the automatic folding upon opening .tex file
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" }}}
