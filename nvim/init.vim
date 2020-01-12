" vim-plug manages Vim plugin
call plug#begin()
Plug 'jalvesaq/Nvim-R'
	" R plugin split window horizontally
	" set r folding
	let r_syntax_folding = 1
	let R_min_editor_width = 66
	let R_rconsole_width = 66
	let R_objbr_w = 66
	let R_objbr_place = "BOTTOM"
	let rout_follow_colorscheme = 1
	let R_nvim_wd = -1
	let R_notmuxconf = 1
	let R_show_arg = 0
	let R_show_arg_help = 0
	let R_start_libs = "base,stats,graphics,grDevices,utils,methods,ggplot2,dplyr,tidyr,purrr,readr"
	" let R_in_buffer = 0
	" let R_applescript = 1
	vmap <Space> <Plug>REDSendSelection
	nmap <Space> <Plug>RDSendLine
	autocmd FileType r inoremap <buffer> \\ <Esc>:normal! a %>%<CR>a 
	autocmd FileType rmd inoremap <buffer> \\ <Esc>:normal! a %>%<CR>a 
	map <silent> <LocalLeader>t :call RAction("tail")<CR>
	map <silent> <LocalLeader>h :call RAction("head")<CR>
	map <silent> <LocalLeader>la :call g:SendCmdToR("devtools::load_all('.')")<CR>
	map <silent> <LocalLeader>dt :call g:SendCmdToR("devtools::test()")<CR>

	let R_app = "radian"
	let R_cmd = "R"
	let R_hl_term = 0
	let R_args = []  " if you had set any
	let R_bracketed_paste = 1

Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }

Plug 'SirVer/ultisnips'
	" Configure ultisnips
	let g:UltiSnipsUsePythonVersion = 3
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
	let g:UltiSnipsEnableSnipMate = 1

Plug 'easymotion/vim-easymotion'
	" Change the default leader in EasyMotion
	let g:EasyMotion_leader_key = '<Leader>'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
	let g:pandoc#completion#bib#mode = 'citeproc' 
	let g:pandoc#after#modules#enabled = ["vim-table-mode", "ultisnips"]

Plug 'tpope/vim-dispatch'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'flazz/vim-colorschemes'
Plug 'dhruvasagar/vim-table-mode'
	" markdown-compatible tables use
	let g:table_mode_corner="|"

Plug 'airblade/vim-rooter'
	let g:rooter_patterns = ['Makefile', '*.Rproj', '.git/']

Plug 'mattn/emmet-vim'
Plug 'connorholyday/vim-snazzy'
	let g:SnazzyTransparent = 1

Plug 'reedes/vim-lexical'
	" spellchecker
	augroup lexical
		autocmd!
		autocmd FileType markdown,mkd call lexical#init()
		autocmd FileType text call lexical#init()
	augroup END
	let g:lexical#thesaurus = ['~/.config/nvim/dict/words.txt',]
	let g:lexical#spelllang = ['en_us','en_au','en_gb']

Plug 'universal-ctags/ctags'
	let g:tagbar_type_r = {
			\ 'ctagstype' : 'r',
			\ 'kinds'     : [
					\ 'f:Functions',
					\ 'g:GlobalVariables',
					\ 'v:FunctionVariables',
			\ ]
	\ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
	let g:fzf_layout = { 'up': '~30%' }
	nnoremap <C-p> :Files<cr>
	nnoremap <space>s :Buffers<cr>

Plug 'jceb/vim-orgmode'
Plug 'chrisbra/csv.vim'
Plug 'pangloss/vim-javascript'
call plug#end()

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

if has("syntax")
  syntax on
endif
syntax enable
set autoread
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set cindent
set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set number
set history=700
set nobackup
set nowritebackup
set modeline 
set noswapfile
set t_Co=256                        " force vim to use 256 colors
set cc=80  " colorcolumn 80
let maplocalleader = ","
let g:mapleader = ","
set ruler
set mouse=a		" Enable mouse usage (all modes)
set foldmethod=syntax
set relativenumber number
set wrap linebreak columns=80
filetype on

" set saved folding
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" A syntax for placeholders
" Pressing Control-j jumps to the next match.
" Completions using placeholders
inoremap () ()<Esc>:let leavechar=")"<CR>i
inoremap [] []<Esc>:let leavechar="]"<CR>i
inoremap {} {}<Esc>:let leavechar="}"<CR>i
inoremap "" ""<Esc>:let leavechar="\""<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

" Remap quit, save
cnoremap Q q
cnoremap Qa qa
cnoremap Wq wq
cnoremap W w

" terminal exit
tnoremap <C-[> <C-\><C-n>

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" key binding for make
setlocal makeprg=make\ file=%:r
nnoremap <F2> :Make<CR>

colorscheme snazzy
