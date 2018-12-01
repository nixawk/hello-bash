
" Date  : Fri Oct 23 UTC 2015
" Author: Nixawk

"''''''''''''''''''''''''''
" Installation
"''''''''''''''''''''''''''

" $ mkdir -p ~/.vim/bundle
" $ cd ~/.vim/bundle
" $ git clone https://github.com/gmarik/Vundle.vim
" $ vim
" :PluginInstall


"''''''''''''''''''''''''''
" General
"''''''''''''''''''''''''''

set nocompatible
filetype off 
set ts=4
set nobackup
set nowritebackup
set cursorcolumn
set cursorline
set laststatus=2
set encoding=utf-8
set t_Co=256
colorscheme slate
"set background=dark


if !exists("au_loaded")                                        " https://github.com/rapid7/metasploit-framework/wiki/Style-Tips
    let au_loaded = 1
    augroup rb
        au FileType ruby set shiftwidth=2 tabstop=2 softtabstop=2 textwidth=78
        au FileType ruby set expandtab
        au FileType ruby hi BogusWhitespace ctermbg=darkgreen guibg=darkgreen
        au FileType ruby match BogusWhitespace /\s\+$\|^\t\+ \+\|^ \+\t\+/
    augroup END
endif


augroup vimrc_autocmds 
    autocmd!                                                   
	" highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END


"'''''''''''''''''''''''''
" Vundle - Plugins
"'''''''''''''''''''''''''

" ** Plugins Install **

" $ vim  
" vim :PluginINstall


" ** Plugins Help    **

" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ


"'''''''''''''''''''''''''
" Plugins Keys Maps
"'''''''''''''''''''''''''

                                                                " Global Plugins Keys Maps
map <c-n>t :NERDTreeToggle<CR>
set pastetoggle=<c-p>t
map <c-t>t :TlistToggle<CR>

map <c-g>g : Gstatus<CR>
map <c-g>l : Glog<CR>
map <c-g>b : Gbrowse<CR>

map <c-t>p : tabprevious<CR>
map <c-t>n : tabnext<CR>
map <c-t>c : tabnew<CR>


" <leader>K      - pymode doc
" <leader>R      - pymode run
" <leader>B      - python breakpoint
" C-A            - autocompletion
" C-c-g          - goto defination 
" c-p-p          - CtrlP

" c-m            - multi_cursor_next_key
" c-m-p          - multi_cursor_prev_key
" c-m-x          - multi_cursor_skip_key


"'''''''''''''''''''''''''
" Plugins Settings
"'''''''''''''''''''''''''


set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on 

call vundle#begin()                                             " Plugins Manager

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'octol/vim-cpp-enhanced-highlight'


" ***********************
" ** Plugin:  molokai
"    Desc  :  Molokai color schema for vim

let g:molokai_original = 1                                     " match the original monokai background color
let g:rehash256 = 1                                            " an alternative schema under development for color terminals


" ***********************
" ** Plugin:  NERDTree
"    Desc  :  A tree explorer plugin for vim


autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" ***********************
" ** Plugin:  python-mode
"    Desc  :  Vim python-mode. PyLint, Rope Pydoc, breakpoints from box.


syntax on
let g:pymode = 1                                               " turn on the whole plugin
let g:pymode_warnings = 1                                      " turn off plugin's warnings
let g:pymode_paths = []                                        " add paths to sys.path
let g:pymode_trim_whitespaces = 1                              " trim unused white spaces on save
let g:pymode_options = 0                                       " setup default python options
let g:pymode_options_max_line_length = 79                      " setup max line length
let g:pymode_options_colorcolumn = 1                           " enable colorcolum display at max_line_length
let g:pymode_quickfix_minheight = 3                            " setup pymode quickfix window
let g:pymode_quickfix_maxheight = 6
let g:pymode_python = 'python'                                 " By default pymode looks for current python version
let g:pymode_indent = 1                                        " Enable pymode indentation . 
let g:pymode_doc = 1                                           " turns on the documentation script
let g:pymode_doc_key = '<leader>K'                             " Bind keys to show documentation for current word (selection)
let g:pymode_run = 1                                           " turns on the run code script
let g:pymode_run_bind = '<leader>R'                            " Binds keys to run python code
let g:pymode_breakpoint = 1                                    " enable functionality
let g:pymode_breakpoint_key = '<leader>B'                      " Binds keys to breakpoint code
let g:pymode_lint = 1                                          " turns on code checking
let g:pymode_lint_on_write = 1                                 " check code on every save (if file has been modified)
let g:pymode_lint_unmodified = 0                               " check code on every save
let g:pymode_lint_on_fly = 0                                   " check code when editing (on the fly)
let g:pymode_lint_message = 1                                  " show error message if cursor placed at the error line
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']    " default mode checkers (pylint, pep8, mccabe, pep257, pyflakes.)
let g:pymode_lint_sort = ['E', 'C', 'I']                       " sort errors by relevance
let g:pymode_rope_lookup_project = 0                           " prevent searching in parent dirs
let g:pymode_rope_completion = 1                               " turn off code completion support
let g:pymode_rope_complete_on_dot = 0                          " turn off autocompletion when typing a period
let g:pymode_rope_completion_bind = '<C-A>'                    " keymap for autocomplete
let g:pymode_rope_goto_definition_bind = '<C-c>g'              " Goto definition
let g:pymode_rope_goto_definition_cmd = 'new'                  " Command for open window when definition has been found
let g:pymode_syntax = 1                                        " turn on pymode syntax
let g:pymode_syntax_slow_sync = 1                              " Slower syntax synchronization
let g:pymode_syntax_all = 1                                    " Enable all python highlights
let g:pymode_syntax_indent_errors =g:pymode_syntax_all
let g:pymode_syntax_space_errors =g:pymode_syntax_all
let g:pymode_folding = 0


" ***********************
" ** Plugin:  Powerline
"    Desc  :  Powerline is a statusline plugin for vim
"    Download : pip install powerline-status
"               pip install --user git+git://github.com/powerline/powerline

" ***********************
" ** Plugin: vim-fugitive
"    Desc  : a Git wrapper
"    Cmd   : Gstatus, Glog, ...

autocmd QuickFixCmdPost *grep* cwindow                         " Gstatus - git status ....


" ***********************
" ** Plugin: ctrlp
"    Desc  : Fuzzy file, buffer, mru, tag, etc finder.
"    Cmd   : CtrlP, CtrlPBuffer, CtrlPMRU, CtrlPMixed

let g:ctrlp_map = '<c-p>p'                                     " default mapping and default command to invoke CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                       " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'                   " MacOSX/Linux


" ***********************
" ** Plugin: vim-markdown 
"    Desc  : Markdown Vim Mode

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1


" ***********************
" ** Plugin: airline
"    Desc  : lean & mean status/tabline


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" ***********************
" ** Plugin: nerdcommenter
"    Desc  : 

filetype plugin on


" ***********************
" ** Plugin: taglist
"    Desc  : Source code browser


let Tlist_Auto_Open=0
let Tlist_Show_One_FIle=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Ctags_Cmd="/usr/bin/ctags"
set autochdir                                                  " Please install ctags 
                                                               " https://github.com/VundleVim/Vundle.vim/issues/152

" ***********************
" ** Plugin: vim-multiple-cursors
"    Desc  : True Sublime Text style multiple selections


let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-m>p'
let g:multi_cursor_skip_key='<C-m>x'
let g:multi_cursor_quit_key='<Esc>'


call vundle#end()                                              " Plugins Manager



