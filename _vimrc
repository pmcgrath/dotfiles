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
set clipboard=unnamedplus 		" Share system clipboard - X window
set nowrap				" Disable line wrapping
set number				" Display line numbers


" *** vim-go - plugin
"	Run :GoUpdateBinaries to ensure all the required go tools are available - will install all tools listed at the top of https://github.com/fatih/vim-go/blob/master/plugin/go.vi://github.com/fatih/vim-go/blob/master/plugin/go.vim 
" Had to disable as this is too expensive - scans all sources on gopath - buy a SSD to solve this
" let g:go_fmt_command = "goimports"	" Use goimports on save (goimports calls gofmt anyway)


" *** NERDTree - plugin
autocmd VimEnter * NERDTree		" Open NERDTree when vim opened
nmap <F2> :NERDTreeToggle<CR>		" Map F2 to toggle nerdtree on/off


" *** PENDING
"	Possibly use native file explorer rather than using NERDTree plugin - See https://medium.com/@mozhuuuuu/vimmers-you-dont-need-nerdtree-18f627b561c3
