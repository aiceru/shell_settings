"------------------ VUNDLE ---------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'matchparenpp'
Plugin 'vim-google-scribe'
Plugin 'L9'
Plugin 'The-NERD-commenter'
Plugin 'fatih/vim-go'
Plugin 'ctrlp.vim'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------------------------

"----------------- CTAGS -----------------------
set tags=./tags
"set tags+=~/Work/arcus/repo/aiceru/arcus-c-client/tags
set tags+=~/Work/arcus/repo/naver/arcus/zookeeper/src/c/tags
"-----------------------------------------------

"----------------- SYNTAX ----------------------
syntax enable
set t_Co=256
set background=dark
colorscheme molokai
set nu
set ruler
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set hlsearch
set cursorline
hi CursorLine cterm=NONE ctermbg=236 guibg=#303030
"----------------- CSCOPE ----------------------
set csprg=/usr/local/opt/cscope/bin/cscope

set csto=0
set cst
set nocsverb

silent cs add cscope.out
"silent cs add ~/Work/arcus/repo/aiceru/arcus-c-client/cscope.out
silent cs add ~/Work/arcus/repo/naver/arcus/zookeeper/src/c/cscope.out
set csverb

func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<CR>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"---------------- NERDTREE ---------------------
nnoremap <silent> <F7> :NERDTreeToggle<CR>
"---------------- TAGBAR -----------------------
nnoremap <silent> <F8> :TagbarToggle<CR>
"-----------------------------------------------

nmap <C-\>/ /<C-R>=expand("<cword>")<CR>

"--------------- CUSTOM CMD --------------------
nnoremap <Leader><Space> :noh<CR>
nnoremap <F11> :set cursorline!<CR>
noremap <F12> :set invnumber<CR>
inoremap <F12> <C-O>:set invnumber<CR>
nnoremap <F9> :!make clean && make<CR>

"--------------- vim-go ------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmg_autosave = 0
let g:go_play_open_browser = 0
let g:go_bin_path=expand("~/.gotools")

"--------------- ctrlp -------------------------
" 기본 무시 설정
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'

" 단축키를 리더 키로 대체
nmap <leader>p :CtrlP<cr>

" 여러 모드를 위한 단축키
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"-------------- vim-airline -------------------
" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1

" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'

"---------------- buffers ---------------------
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>T :enew<cr>

" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>

" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>

"------------ molokai color -------------------
let g:molokai_original = 1
let g:rehash256 = 1