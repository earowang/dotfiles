" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
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
" let the cursor stay in the middle
" autocmd InsertEnter * :set scrolloff=999
" autocmd InsertLeave * :set scrolloff=0

" set latex-suite
" let g:Tex_AutoFolding = 0
" let g:Tex_ViewRule_pdf='zathura 2>/dev/null'

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

" vim-plug manages Vim plugin
call plug#begin()
Plug 'jalvesaq/Nvim-R'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'flazz/vim-colorschemes'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-rooter'
" Plug 'jiangmiao/auto-pairs'
Plug 'wincent/terminus'
Plug 'chrisbra/csv.vim'
Plug 'pangloss/vim-javascript'
Plug 'wesQ3/vim-windowswap'
Plug 'mattn/emmet-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'tpope/vim-dispatch'
Plug 'reedes/vim-lexical'
Plug 'universal-ctags/ctags'
call plug#end()

" Set color scheme seoul256
let g:SnazzyTransparent = 1
colorscheme snazzy

" Change the default leader in EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

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


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Configure ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEnableSnipMate = 1

" vim-pandoc
let g:pandoc#completion#bib#mode = 'citeproc' 
let g:pandoc#after#modules#enabled = ["vim-table-mode", "ultisnips", "unite", "auto-pairs"]

" vim-table-mode
" markdown-compatible tables use
let g:table_mode_corner="|"

" key binding for make
setlocal makeprg=make\ file=%:r
nnoremap <F2> :Make<CR>

" configuration for vim-rooter
let g:rooter_patterns = ['Makefile', '*.Rproj', '.git/']

" configuration for unite
let g:unite_prompt = "➤ "
let g:unite_winheight = 20
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert = 1

let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files=5000

nnoremap <C-p> :Unite -force-redraw file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async,file,buffer,grep', 'ignore_pattern', '\docs/\|\cache/\|\.DS_Store\|\.git/\|\.Rproj\.user/')

" vimfiler
let g:vimfiler_as_default_explorer = 1
nnoremap <C-t> :VimFiler<cr>

" vimshell
nnoremap <C-s> :VimShell<cr>
let g:vimshell_prompt = "ilovevim➤ "

" spellchecker
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType text call lexical#init()
augroup END
let g:lexical#thesaurus = ['~/.config/nvim/dict/words.txt',]
let g:lexical#spelllang = ['en_us','en_au','en_gb']

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
