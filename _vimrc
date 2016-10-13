" *** Resources
" 	http://learnvimscriptthehardway.stevelosh.com/
"	http://obahua.com/setup-vim-for-go-development/


" *** Pathogen - plugin manager
"	http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen/
call pathogen#infect()
call pathogen#helptags()


" *** General
filetype plugin on  			" Enable filetype plugins
let mapleader=" "			" Leader key
set nocompatible			" Use vim settings, rather then vi settings - This must be first, because it changes other options as a side effect
set backspace=2				" Deal with backspace issues on windows (See http://vim.wikia.com/wiki/Backspace_and_delete_problems)
set clipboard=unnamedplus,unnamed	" Share system clipboard - X window, added unnamed to cater for MS Windows based git (See http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default)
set noerrorbells visualbell t_vb=	" Disable the annoying beep, see http://vim.wikia.com/wiki/Disable_beeping
set nowrap				" Disable line wrapping
set number				" Display line numbers
syntax on				" Ensure syntax is on - MS Windows installation seems to require this explicitly, was automatic on linux instances


" **** Command to remove trailing spaces - mapped to F3 - See http://vim.wikia.com/wiki/Remove_unwanted_spaces
:nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" *** neocomplete - autocompletion plugin
let g:neocomplete#enable_at_startup=1


" *** NERDTree - plugin
autocmd VimEnter * NERDTree		" Open NERDTree when vim opened
nmap <F2> :NERDTreeToggle<CR>		" Map F2 to toggle nerdtree on/off


" *** vim-go - plugin
"	Run :GoUpdateBinaries to ensure all the required go tools are available - will install all tools listed at the top of https://github.com/fatih/vim-go/blob/master/plugin/go.vi://github.com/fatih/vim-go/blob/master/plugin/go.vim
" Had to disable as this is too expensive - scans all sources on gopath - buy a SSD to solve this, see http://unix.stackexchange.com/questions/65595/how-to-know-if-a-disk-is-an-ssd-or-an-hdd
let g:go_fmt_command = "gofmt"		" Use goimports on save (goimports calls gofmt anyway)

" *** PENDING
"	Possibly use native file explorer rather than using NERDTree plugin - See https://medium.com/@mozhuuuuu/vimmers-you-dont-need-nerdtree-18f627b561c3
"
