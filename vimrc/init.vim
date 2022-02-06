
" setting
set autoread
set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" set mouse=a
set noswapfile
set showcmd
set timeoutlen=400
set ttyfast
" set ttymouse=xterm2
set wildmenu wildmode=longest,list

"complete
inoremap {<CR> {<CR>}<UP><C-o>$<CR>
inoremap [<CR> [<CR>]<UP><C-o>$<CR>
inoremap (<CR> (<CR>)<UP><C-o>$<CR>

" visual
set ambiwidth=double
set autoindent
set cursorline
set termguicolors

"set list
set matchtime=1
set number
set smartindent
set showmatch
set splitright
set title
set virtualedit=onemore
set visualbell
set wildmode=list:longest

"cursorcolumn
highlight Visual ctermbg=5
set display=lastline
set laststatus=2
set listchars=eol:\|,tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set pumheight=10

" tab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" file type
augroup fileTypeConvert
  autocmd!
  autocmd BufNewFile,BufRead *.txt setfiletype text
  autocmd BufNewFile,BufRead *.conf setfiletype config
augroup END

augroup fileTypeIndent
  autocmd!
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2
  autocmd FileType html setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType vue setlocal ts=2 sts=2 sw=2
  autocmd FileType python setlocal ts=4 sts=4 sw=4
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2
  autocmd FileType config setlocal ts=2 sts=2 sw=2
augroup END


" search
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set belloff=all
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan



" keymap
:command! SudoSave :w !sudo tee %
inoremap <silent> jj <Esc>
noremap!  
noremap ; :
nnoremap OO :<C-u>call append(expand('.'), '')<Cr>
"nnoremap <S-h> ^
"nnoremap <S-l> $
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap ft :set filetype=
set backspace=indent,eol,start
set hidden
set nobackup
set whichwrap=b,s,h,l,<,>,[,],~
vnoremap > >gv
vnoremap < <gv




function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'),'<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]
        let no = i
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr),':t')
        let title = '['.title.']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i ==tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill#'
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction

let &tabline = '%!' . s:SID_PREFIX() .'my_tabline()'
set showtabline=2

nnoremap [Tag] <Nop>
nmap t [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]' .n ':<C-u>tabnext' . n . '<CR>'
endfor

map <silent> [Tag]t :tablast <bar> tabnew<CR>
map <silent> [Tag]w :tabclose<CR>
map <silent> [Tag]n : tabnext<CR>
map <silent> [Tag]p : tabprevious<CR>










" Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" dein
" --------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
" if runtime error do that
" :call dein#recache_runtimepath()
syntax enable





