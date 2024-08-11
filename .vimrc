" -------------------------------------- "
"                                        "
"       Plugin Management (Vundle)       "
"                                        "
" -------------------------------------- "


set nocompatible
filetype off
set shellslash

if has("gui_running")
    set rtp+=C:\users\travis\.vim\bundle\Vundle.vim
else
    set rtp+=/c/users/travis/.vim/bundle/Vundle.vim
endif

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                     " plugin manager, must be first

" Editing
Plugin 'frazrepo/vim-rainbow'                     " rainbow brackets
Plugin 'kshenoy/vim-signature'                    " show marks in gutter
Plugin 'jpalardy/vim-slime'                       " to send code to other windows
Plugin 'terryma/vim-smooth-scroll'                " allows adjustment of scroll speed
Plugin 'tpope/vim-surround'                       " quoting/parenthesizing made simple

" User Interface
Plugin 'powerline/fonts'                          " fonts for status line
Plugin 'Yggdroot/indentLine'                      " show indent lines
Plugin 'vim-airline/vim-airline'                  " statusline
Plugin 'vim-airline/vim-airline-themes'           " additional statusline themes
Plugin 'altercation/vim-colors-solarized'         " best color scheme

" File Searching
Plugin 'kien/ctrlp.vim'                           " fuzzy file searcher
Plugin 'preservim/nerdtree'                       " project drawer
Plugin 'preservim/tagbar'                         " viewer for file's tags

" Language Support
Plugin 'tpope/vim-fugitive'                       " git integration
Plugin 'airblade/vim-gitgutter'                   " shows git differences in the gutter
Plugin 'JuliaEditorSupport/julia-vim'             " .jl file support
Plugin 'vim-latex/vim-latex'                      " latex support
"Plugin 'lervag/vimtex'                           " another latex support
Plugin 'vimwiki/vimwiki'                          " personal wiki package

call vundle#end()


" -------------------- "
"                      "
"       Settings       "
"                      "
" -------------------- "


" Filetype, Spell Check, and Encoding
filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd filetype latex,plaintex let b:did_indent=1
autocmd filetype latex,plaintex setlocal indentexpr=
autocmd filetype text,tex,latex,plaintex,markdown setlocal spell spelllang=en_us
autocmd filetype text,tex,latex,plaintex,markdown setlocal textwidth=100
autocmd filetype qf wincmd J

" Text
syntax on                                         " enables syntax processing
set guifont=Hack\ Nerd\ Font\ Mono:h12
set hlsearch                                      " highlight matches
set incsearch                                     " search as characters are entered
set wildmenu                                      " visual autocomplete menu for commands
set showmatch                                     " highlight matching for {[()]}
set expandtab                                     " sets tabs to spaces
set softtabstop=4                                 " number of spaces in tab when editing
set tabstop=4                                     " number of visual spaces per tab
set shiftwidth=4                                  " make indents a single tab
"set cursorline                                   " highlight current line
"set cursorcolumn                                 " highlight current column

" Colors / Window
colorscheme solarized                             " a nice colorscheme
set background=dark                               " background dark / light
set t_Co=256                                      " let the terminal use all colors
set vb t_vb=
set noequalalways                                 " don't equalize window sizes
set cmdheight=1                                   " command line height
set laststatus=2                                  " status bar open by default
set lazyredraw                                    " don't redraw mid macro
set number                                        " row numbering
set relativenumber                                " numbering is relative to current line
set numberwidth=5                                 " line-number margin width
if has("gui_running")
    set guioptions -=m                            " removes the menubar
    set guioptions -=T                            " removes the toolbar
    set guioptions -=r                            " removes the right-hand scrollbar
    set guioptions -=l                            " removes the left-hand scrollbar
    set guioptions -=L
endif
"set lines=55 columns=130

" Miscellany
set encoding=utf-8
set nobackup
set noswapfile
set backspace=indent,eol,start                    " backspace acts as normal
set clipboard=unnamed                             " vim saves to / takes from the system clipboard
set conceallevel=0                                " don't try to conceal commands for brevity
set selection=inclusive                           " visual select under the cursor
set belloff=all                                   " disable notification bells
set foldenable                                    " enables folding
set foldmethod=marker                             " create folds with {{{ }}}
set foldlevelstart=0                              " so the folds aren't closed upon file opening
set splitbelow                                    " split window below
set splitright                                    " split window to the right

" TagBar (Plugin)
let g:tagbar_position='left'
let g:tagbar_width=30

" NERDTree (Plugin)
let g:NERDTreeWinSize=30

" indentLine (Plugin)
let g:indentLine_setColors=1                      " 0 means don't overwrite colorscheme

" Airline (Plugin)
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled=1        " use airline for tabs
let g:airline#extensions#tabline#show_buffers=0   " turn off buffers in the tab line
let g:airline#extensions#tabline#tab_min_count=2  " only show if there are 2 tabs
let g:airline_powerline_fonts=1                   " allow use of powerline fonts / symbols
if !exists('g:airline_symbols')                   " makes sure it doesn't overwrite stuff
    let g:airline_symbols = {}
endif
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Vim-Signature (Plugin)
highlight SignColumn ctermbg=none
highlight SignatureMarkText ctermbg=none ctermfg=White

" Vim-Latex (Plugin)
let g:Tex_flavor="latex"
let g:Tex_CompileRule_pdf="pdflatex --interaction=nonstopmode $*"
let g:Tex_DefaultTargetFormat="pdf"               " set target format to pdf and tell what reader to use
let g:Tex_MultipleCompileFormats="pdf,bibtex,pdf" " checks to see if bibtex needs to be run
let g:Tex_ViewRule_pdf="SumatraPDF"               " open in SumataPDF
let g:Tex_GotoError=0                             " do not go to the location of the first error after compile
let g:tex_conceal=""                              " so vim doesn't try to conceal latex commands
let g:Tex_EnvironmentMaps=0                       " turn off environment macros
let g:tex_indent_brace=0
let g:tex_indent_item=0
let g:tex_indent_and=0
let Tex_FoldedSections=""                         " disable the automatic folding upon opening .tex file
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" VimTeX (Plugin)
"let g:vimtex_compile_progname='latexmk'
"let g:vimtex_syntax_conceal_disable=1
"let g:vimtex_quickfix_open_on_warning=0

" Vim-Slime (Plugin)
let g:slime_target="vimterminal"
"let g:slime_python_ipython=1

" VimWiki
"let g:vimwiki_list = [{'syntax': 'markdown', 'est': 'md'}]


" ------------------------------- "
"                                 "
"       Custom Key Bindings       "
"                                 "
" ------------------------------- "


" source .vimrc
nnoremap <Leader><F1> :source ~/.vimrc<CR>

" toggle file explorer / tagbar
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <Leader><F2> :TagbarToggle<CR>

" buffer switch
nnoremap bl :buffers<CR>:buffer<Space>

" toggle rainbow brackets
nnoremap <F3> :RainbowToggle<CR>

" delete trailing whitespace
nnoremap <Leader><F3> :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><CR>

" latex
nnoremap <F4> :call Tex_RunLaTeX()<CR>
nnoremap <Leader><F4> :call Tex_ViewLaTeX()<CR>
"nnoremap <F4> :VimtexCompileSS<CR>
"nnoremap <Leader><F4> :VimtexCompile<CR>

" smooth scrolling
noremap <silent><C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent><C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" resize window
map <Up> <C-W>+
map <Down> <C-W>-
map <Left> <C-W><
map <Right> <C-W>>
"nnoremap <C-W><Right> :vertical resize +5 <CR>
"nnoremap <C-W><Left> :vertical resize -5 <CR>
"nnoremap <C-W><Up> :resize +5 <CR>
"nnoremap <C-W><Down> :resize -5 <CR>
