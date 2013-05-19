"set background=dark     " Assume a dark background
set t_Co=256
colorscheme mustang

set number                      " always show line numbers

set title

set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages





" formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" If you're indented, new lines will also be indent
	set smartindent  "Automatically indents lines after opening a bracket in programming languages
	set shiftwidth=4               	" use indents of 4 spaces (on SHIFT key?)
	set expandtab 	  	     		" tabs are spaces, not tabs
	set tabstop=4 					" an indentation every four columns, How much space Vim gives to a tab
	set softtabstop=4 				" let backspace delete indent
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)  -------   Press F12 if you want to paste! similar to :set paste    and :set nopaste 
    set smarttab  "Improves tabbing

	" Remove trailing whitespaces and ^M chars
	"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    "set backspace=2  "This makes the backspace key function like it does in other programs.
    set backspace=indent,eol,start  " backspace for dummys

"}






"fold {
	set foldmethod=indent   "Lets you hide sections of code
	set foldnestmax=10      "deepest fold is 10 levels
"	set nofoldenable        "dont fold by default
"	set foldenable  		"auto fold code
	set foldlevel=1         "this is just what i use
	"Some common key bindings to expand or collaps folds:
	"`za` - toggles
	"`zc` - closes
	"`zo` - opens
	"`zR` - open all
	"`zM` - close all
"}


filetype plugin indent on  	" Automatically detect file types.
scriptencoding utf-8

"Display invisivle characters/ Whitespaces {
	"set list   " to view all the characters e.g. eol($), eof, beginning of line(^), etc 
	"set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
"}




"Setting up the directories {
set backup 						" backups are nice ...
set undofile					" so is persistent undo ...
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set history=1000  				" Store a ton of history (default is 20)
"}

"Highligh cursor line {
	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor
"}

" Search {
	set incsearch					" find as you type search
	set hlsearch					" highlight search terms
	set ignorecase					" case insensitive search
"}

set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.

set scrolljump=5 				" lines to scroll when cursor leaves screen
set scrolloff=3 				" minimum lines to keep above and below cursor

"






if has('cmdline_info')
	set ruler                  	" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	set showcmd                	" show partial commands in status line and selected characters/lines in visual mode
endif


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





function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
			  \ 'backup': 'backupdir', 
			  \ 'views': 'viewdir', 
			  \ 'swap': 'directory', 
			  \ 'undo': 'undodir' }

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
