" TODO: Ctrl-s for save
"set background=dark     " Assume a dark background
set t_Co=256
" colorscheme mustang

set number                      " always show line numbers, short hand is :set nu
 "    set relativenumber   " short hand is  set rnu     -- relative number instead of absolute number of lines, which is done by :set number



set title

set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo






" formatting {
    set nowrap                         " wrap long lines
    set autoindent                     " If you're indented, new lines will also be indent
    set smartindent  "Automatically indents lines after opening a bracket in programming languages
    set shiftwidth=4                   " use indents of 4 spaces (on SHIFT key?)
    set expandtab                        " tabs are spaces, not tabs
    set tabstop=2                     " an indentation every two columns, How much space Vim gives to a tab
    set softtabstop=2                 " let backspace delete indent
    set pastetoggle=<F12>              " pastetoggle (sane indentation on pastes)  -------   Press F12 if you want to paste! similar to :set paste    and :set nopaste 
    set smarttab  "Improves tabbing

    " Remove trailing whitespaces and ^M chars
    "autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    "set backspace=2  "This makes the backspace key function like it does in other programs.
    set backspace=indent,eol,start  " backspace for dummys

"}

"fold {
    set foldmethod=indent   "Lets you hide sections of code+++++
    set foldnestmax=10      "deepest fold is 10 levels
    " set nofoldenable        "dont fold by default
    " set foldenable          "auto fold code
    set foldlevel=1         "this is just what i use
    "Some common key bindings to expand or collaps folds:
    "`za` - toggles
    "`zc` - closes
    "`zo` - opens
    "`zR` - open all
    "`zM` - close all
"}


filetype plugin indent on      " Automatically detect file types.
scriptencoding utf-8

"Display invisivle characters/ Whitespaces {
    "set list   " to view all the characters e.g. eol($), eof, beginning of line(^), etc 
    "set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
"}




"Setting up the directories {
    if v:version >= 730
        set backup                         " backups are nice ...
        "set undofile                    " so is persistent undo ...
        "set undolevels=1000 "maximum number of changes that can be undone
        "set undoreload=10000 "maximum number lines to save for undo on a buffer reload
        set history=1000                  " Store a ton of history (default is 20)
    endif
"}

"Highligh cursor line {
    set cursorline                  " highlight current line
    hi cursorline guibg=#333333     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor
"}

" Search {
    set incsearch                    " find as you type search
    set hlsearch                    " highlight search terms
    set ignorecase                    " case insensitive search
"}

set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full    " command <Tab> completion, list matches, then longest common part, then all.

set scrolljump=5                 " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor


" Show ruler..
if has('cmdline_info')
    set ruler                      " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                    " show partial commands in status line and selected characters/lines in visual mode
endif

" More declarative status line
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options        
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"--- The following commands make the navigation keys work like standard editors
    imap <silent> <Down> <C-o>gj
    imap <silent> <Up> <C-o>gk
    nmap <silent> <Down> gj
    nmap <silent> <Up> gk
"--- Ends navigation commands

"--- The following adds a sweet menu, press F4 to use it.
    source $VIMRUNTIME/menu.vim
    set wildmenu
    set cpo-=<
    set wcm=<C-Z>
    map <F4> :emenu <C-Z>
"--- End sweet menu

set whichwrap+=<,>,[,] "set arrow keys to go to next/prev lines at the end/beginning of line

" -----Some mappings to let vim work without going to insert mode explicitly for
" basic keys like backspace, enter, tab, ...
"
    " map the backspace key '<BS>' in normal mode so that it deletes the preceding character and returns to normal mode
    map <BS> i<BS><ESC>l
    map <TAB> i<TAB><space><ESC>l
    " map the space key '<space>' in normal mode so that it inserts a space and returns to normal mode
    map <space> i<space><ESC>l
    " map the return key '<CR>' in normal mode so that it inserts a blank line and returns to normal mode
    map <CR> i<CR><ESC>

    " ESC takes the carret one to the left. To avoid that map it:
    ":inoremap <silent> <Esc> <Esc>`^


    " Mapping for Ctrl-s
    :inoremap <c-s> <c-o>:Update<CR> "a
    " If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it. i
command -nargs=0 -bar Update if &modified 
   \|    if empty(bufname('%'))
   \|        browse confirm write
   \|    else
   \|        confirm write
   \|    endif
   \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>


" plugin specific settings
    set autochdir   " This sets the current directory to the current file's directory not where vim started

    " setup pathogen
       " execute pathogen#infect()
   
    " NERDtree 
    let g:NERDTreeDirArrows=0
    "map <silent> <F1> :NERDTreeToggle %:p:h<CR> " This maps my F1 key to toggle(open/close) NERDTree using the path 
    "of the currently active buffer. If no buffer is open, it opens in the currently launched Macvim directory.    

    " Ctrlp.vim does not search hidden files by default 
    let g:ctrlp_show_hidden = 1 

" -------------------------------- Functions

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
       \ 'backup': 'backupdir', 
       \ 'views': 'viewdir', 
       \ 'swap': 'directory'}
       ", 
       "\ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory 
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories() 

" To remember where we left off in editing a file
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction

    augroup resCur
      autocmd!
      if has("folding")
        autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
      else
        autocmd BufWinEnter * call ResCur()
      endif
    augroup END

    " To unfold the block if it is where we edited last
    if has("folding")
      function! UnfoldCur()
        if !&foldenable
          return
        endif
        let cl = line(".")
        if cl <= 1
          return
        endif
        let cf  = foldlevel(cl)
        let uf  = foldlevel(cl - 1)
        let min = (cf > uf ? uf : cf)
        if min
          execute "normal!" min . "zo"
          return 1
        endif
      endfunction
    endif
