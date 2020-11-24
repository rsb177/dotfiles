" Setup python for neovim
if has("win32")
  let g:python_host_prog = '~/.pyenv/pyenv-win/versions/2.7/python.exe'
  let g:python3_host_prog = '~/.pyenv/pyenv-win/versions/3.8.5/python.exe'
else
  let g:python3_host_prog = '~/.pyenv/versions/3.8.6/bin/python'
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'haishanh/night-owl.vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

let g:coc_global_extensions = ['coc-json', 'coc-xml', 'coc-python', 'coc-html', 'coc-go', 'coc-tsserver', 'coc-vetur', 'coc-emmet', 'coc-spell-checker', 'coc-prettier', 'coc-snippets', 'coc-tailwindcss', 'coc-highlight', 'coc-explorer', 'coc-powershell']

" Initialize plugin system
call plug#end()

au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

syntax on
set ruler
set number

let g:airline_powerline_fonts = 1
" vim-airline
let g:airline_theme = 'night_owl'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

if (has("termguicolors"))
 set termguicolors
endif

" Always make comments green
function! MyHighlights() abort
    hi Comment guifg=#9FCA56 ctermfg=LightGreen gui=italic cterm=italic
    hi jsComment guifg=#9FCA56 ctermfg=LightGreen gui=italic cterm=italic
    hi shComment guifg=#9FCA56 ctermfg=LightGreen gui=italic cterm=italic
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme night-owl

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set shell=pwsh.exe

"" Map leader to ,
let mapleader=','

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap n nzzzv
nnoremap N Nzzzv

set scrolloff=5


" Coc Keymapping
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" CoC Explorer
nmap <C-n> :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
