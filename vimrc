"
" Pathogen load
"
filetype off

call pathogen#infect()
call pathogen#helptags()
"
" General settings
"
set hidden                                      " buffer change, more undo "
set history=200                                 " default 20 "
"set iskeyword+=_,$,@,%,#                        " not word dividers "
set laststatus=2                                " always show statusline "
set listchars=tab:>\                            " > to highlight <tab> "
set list                                        " displaying listchars "
"set mouse=a                                     " mouse in all modes "
set nocompatible                                " don't vi-compatible "
set noshowmode                                  " hide mode in cmd-line "
"set noexrc                                      " don't use other .*rc(s) "
"set nostartofline                               " no goto #1 char in line "
set nowrap                                      " don't wrap lines "
set numberwidth=5                               " 99999 lines "
"
""" Golding
"
"set foldcolumn=0 " hide folding column
"set foldmethod=indent " folds using indent
"set foldnestmax=10 " max 10 nested folds
"set foldlevelstart=99 " folds open by default
"
""" Search and replace
"
set gdefault                                " default s//g (global)
set incsearch                               " "live"-search
set ignorecase                              " case insensitive search
"
""" Matching
"
set matchtime=2                             " time to blink match {}
set matchpairs+=<:>                         " for ci< or ci>
set showmatch                               " tmpjump to match-bracket
"
""" Return to last edit position when opening files
"
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif
"
"""" Files
"
"set autochdir                                   " always use curr. dir.
set autoread                                    " refresh if changed
set backup                                      " backup curr file
set backupdir=~/.vim/backup,/tmp                " backup director{y,ies}
set backupext=~                                 " append ~ to backups
set confirm " confirm changed files
set noautowrite " never autowrite
set updatecount=50 " update swp after 50chars   "


"
" User interface
"
"
" Syntax highlighting
"
filetype plugin indent on                       " enable ft+plugin detect "
syntax on                                       " syntax highlighting "
set t_Co=256                                    " 256-colors "
set background=dark                             " we're using a dark bg "
"colorscheme delek                               " select colorscheme "
highlight Normal ctermbg=NONE                   " use terminal background "
highlight nonText ctermbg=NONE                  " use terminal background "
au BufRead,BufNewFile *.txt set ft=sh           " opens .txt w/highlight "
" Highlight characters past 80
"augroup vimrc_autocmds
"        autocmd BufEnter * highlight OverLength ctermbg=black guibg=#212121
"        autocmd BufEnter * match OverLength /\%80v.*/
"augroup END

"
" Interface general
"
"set cursorline                                  " hilight cursor line "
"set more                                        " ---more--- like less "
"set number                                      " line numbers "
"set scrolloff=5                                 " lines above/below cursor "
"set showcmd                                     " show cmds being typed "
"set title                                       " window title "
"set visualbell                                  " visual instead of beep "
"set wildignore=.bak,.pyc,.o,.ojb,.,a,           " ignore said files "
"        \.pdf,.jpg,.gif,.png,
"        \.avi,.mkv,.so
"set wildmenu                                    " better cmd-completion "
"set wildmode=list:longest                       " wildmode huge list "
"
" Text formatting
"
set autoindent                                  " preserve indentation "
set backspace=indent,eol,start                  " smart backspace "
set expandtab                                   " no real tabs "
set nrformats+=alpha                            " incr/decr letters C-a/-x "
set shiftround                                  " be clever with tabs "
set shiftwidth=4                                " default 8 "
set smartcase                                   " igncase,except capitals "
set smartindent                                 " see autoindent "
set smarttab                                    " tab to 0,4,8 etc. "
set softtabstop=4                               " "tab" feels like <tab> " "
set tabstop=4                                   " replace <TAB> w/4 spaces "


"
" Keybindings
"
" Remap <leader>
let mapleader = ","

" Toggle text wrapping
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Toggle nu mode on and off
map <leader>nu :set nu!<cr>
" Toggle hlsearch mode on and off
map <leader>hl :set hlsearch!<cr>
" Toggle ignorecase mode on and off
map <leader>ic :set ignorecase!<cr>

" Delete previous word with C-BS
imap <C-BS> <C-W>

" Folding using space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Quickly edit/source .vimrc
noremap <leader>ve :edit ~/.vimrc<CR>
noremap <leader>vs :source ~/.vimrc<CR>

" Yank(copy) to system clipboard
noremap <leader>y "+y

noremap <leader>d :bd<cr>
noremap <leader>o :only<cr>
noremap <leader>k :BufOnly<CR>

:noremap <C-b> <Esc>:CtrlPBuffer<CR>
:noremap <C-t> <Esc>:CtrlPTag<CR>

:noremap <S-Up> <Esc>]c
:noremap <S-Down> <Esc>[c

:noremap <F5> <Esc>:pc<CR>
:noremap <F6> <Esc>:ccl<CR>
:noremap <F7> <Esc>[c
:noremap <F8> <Esc>]c

:noremap <F9> <Esc>:bp<cr>
:noremap <F10> <Esc>:bn<cr>
:noremap <F11> <Esc>:cp<cr>
:noremap <F12> <Esc>:cn<cr>

map <C-F> <Esc>:Grep 
"map <C-R> <Esc>:Replace  

nmap <leader>p :call pymode#troubleshooting#Test()<cr>
nmap <leader>h :help PythonModeKeys<cr>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<cr>
nmap <leader>a <Esc>:Ack!
nmap <leader>af <Esc>:AckFile!
map <leader>n :NERDTreeToggle<cr>
map <leader>f :set foldlevel=99<cr>

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>

set foldmethod=indent
set foldlevel=99

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" GitGutter
"
let g:gitgutter_highlight_lines = 0
set updatetime=1000

" Solarized
"
colorscheme solarized
"colorscheme molokai
"let g:solarized_termcolors=256

" Tmuxline
"
"let g:tmuxline_preset = 'nightly_fox'
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'b'    : '#W',
      "\'c'    : '#H',
      "\'win'  : '#I #W',
      "\'cwin' : '#I #W',
      "\'x'    : '%a',
      "\'y'    : '#W %R',
      "\'z'    : '#H'}

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$\| \+\ze\t/

    
	        	        	

"
" Encoding
"
set encoding=utf-8                              " For Powerline glyphs "

" Airline fonts
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Mouse
"
set mouse=a
"set selectmode=mouse

":vmap <C-C> "+y
":vmap <C-V> "+p

" Tagbar
"
map <leader>tt :TagbarToggle<cr>


" Easygrep command
"
let g:EasyGrepInvertWholeWord = 1
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepRecursive = 1
let g:EasyGrepAllOptionsInExplorer = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepFilesToExclude = "workdir,absp,.repo"
"let g:EasyGrep_OperationModes = "User"
set grepprg=ack-grep\ --no-color\ --nogroup
"set wildignore+=*pickles*

" CtrlP
"
let g:ctrlp_extensions = ['tag', 'quickfix']
" ctrlp ignores by default cached folders as .repo
let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore pickles --ignore sandbox* --ignore absp --ignore workdir'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
"let g:ctrlp_custom_ignore = {
    "\ 'file': '\v\.pyc$'
    "\ }

"
" Python mode
"
let g:pymode_utils_whitespaces = 0
let g:pymode_rope = 0
let g:pymode_lint_checker = "pyflakes,pep8,mccabe,pylint"
let g:pymode_lint_onfly = 1
let g:pymode_lint_jump = 0
let g:pymode_breakpoint = 1
let g:pymode_run = 1

set hlsearch

" Set to auto read when a file is changed from the outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
