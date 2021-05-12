" Plugins configuration
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'

	" Check syntax in Vim asynchronously and fix files
	Plugin 'dense-analysis/ale'
	" Insert or delete brackets, parens, quotes in pair.
	Plugin 'jiangmiao/auto-pairs'
	" Fuzzy file, buffer, mru, tag, etc finder
	Plugin 'ctrlpvim/ctrlp.vim'
	" A light and confiugrable statusline
	Plugin 'itchyny/lightline.vim'
	" An arctic, north-bluish clean and elegant Vim color theme.
	Plugin 'arcticicestudio/nord-vim'
	" Track the engine.
"	Plugin 'SirVer/ultisnips'
	" Auto close (X)HTML tags 
	Plugin 'alvan/vim-closetag'
	" Preview colours in source code while editing
	Plugin 'ap/vim-css-color'
	" A Git wrapper so awesome
	Plugin 'tpope/vim-fugitive'
	" Provides syntax highlighting and improved indentation
	Plugin 'pangloss/vim-javascript'
	" The react syntax highlighting and indenting plugin.
	Plugin 'maxmellon/vim-jsx-pretty'
	"  vim plugin wrapper for prettier, pre-configured with custom default
	"  prettier settings.
	Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
	" " Snippets are separated from the engine. Add this if you want them:
"	Plugin 'honza/vim-snippets'
	" YAML syntax/indent plugin.
	Plugin 'mrk21/yaml-vim'

	call vundle#end()
	filetype plugin indent on
	
" General Vim settings
	syntax on
	set autoindent
	" For HotModuleReload
	set backspace=indent,eol,start
	set backupcopy=yes
	set cursorline
	set dir=/tmp/
	set expandtab
	set hlsearch
	let mapleader=";"
	set number
	set relativenumber 
	set shiftwidth=2
	set splitbelow
	set splitright
	set tabstop=2
	set listchars=tab:\|\ 
	set pastetoggle=<F2>
	set mouse=a
	set incsearch
	" Color Scheme
	colorscheme nord
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
	" Highlight overlength
	augroup vimrc_autocmds
		autocmd BufEnter * highlight OverLength ctermbg=red guibg=#592929
		autocmd BufEnter * match OverLength /\%81v.*/
	augroup END
	" Netrw configuration
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3

" Plugin Configurations
	" Ale
	let g:ale_fixers = {
			\ 'javascript': ['eslint']
			\ }
	let g:ale_sign_error = '❌'
	let g:ale_sign_warning = '⚠️'
	let g:ale_fix_on_save = 1
	" Ctrlp.vim configuration
	set wildignore+=*/node_modules/*,*/dist/*
	let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
	" Lightline
	set laststatus=2
	set noshowmode
	let g:lightline = {
	      \ 'colorscheme': 'nord',
				\ 'active': {
	      \   'left': [ [ 'mode', 'paste'  ],
	      \             [ 'gitbranch', 'readonly', 'filename', 'modified'  ] ]
	      \ },
				\ 'component_function': {
      	\   'gitbranch': 'FugitiveHead'
      	\ },
			  \ }
	"" UltiSnips Configuration
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="vertical"
	" Vim-closetag
	let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.md'

" KeyBindings
	" Configuration
	nnoremap <C-n> :set relativenumber!<CR>:set number!<CR>:echo "Toggle linenumbers"<CR>
	nnoremap <leader><tab> :set list!<CR>
	"FileManagement
	inoremap <leader>p <Esc>:CtrlP<CR>
	nnoremap <leader>p :CtrlP<CR>
	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>
	inoremap <leader>w <Esc>:Prettier<CR>:w<CR>
	nnoremap <leader>w :Prettier<CR>:w<CR>
	inoremap <leader>x <ESC>:Prettier<CR>:x<CR>
	nnoremap <leader>x :Prettier<CR>:x<CR>
	autocmd FileType markdown inoremap <leader>w <Esc>:w<CR>
	autocmd FileType markdown nnoremap <leader>w :w<CR>
	autocmd FileType markdown inoremap <leader>x <ESC>:x<CR>
	autocmd FileType markdown nnoremap <leader>x :x<CR>
	"Move in tabs and windows
	nnoremap <leader>j <C-w>j
	nnoremap <leader>k <C-w>k
	nnoremap <leader>h <C-w>h
	nnoremap <leader>l <C-w>l
	nnoremap <leader>H :tabfirst<CR>
	nnoremap <leader>J :tabp<CR>
	nnoremap <leader>K :tabn<CR>
	nnoremap <leader>L :tablast<CR>
	"Move Lines Up/Down
	nnoremap <C-j> :m .+1<CR>==
	nnoremap <C-k> :m .-2<CR>==
	inoremap <C-j> <Esc>:m .+1<CR>==gi
	inoremap <C-k> <Esc>:m .-2<CR>==gi
	vnoremap <C-j> :m '>+1<CR>gv=gv
	vnoremap <C-k> :m '<-2<CR>gv=gv
	"Move in file
	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg
	inoremap jj <Esc>
	vnoremap <leader><leader> <Esc>
	map <tab> %
	nnoremap <leader>z zMzvzz
	"Searchs
	nnoremap n nzzzv
	nnoremap N Nzzzv
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	" Unfold
	nnoremap <Space> za
	" UltraSnips open
	inoremap <leader>u <ESC>:UltiSnipsEdit<CR>
	nnoremap <leader>u :UltiSnipsEdit<CR>
	" Reload
	nnoremap <leader>r :so ~/.vimrc<CR>:echo "Reload Vim Config"<CR>

	" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Auto load
	" Triger `autoread` when files changes on disk
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * 
		\ if mode() != 'c' | checktime | endif
	set autoread 

	" Notification after file change
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded."
		\ | echohl None

filetype plugin indent on
