syntax on
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=120
set autoindent
packadd termdebug
highlight ColorColumn ctermbg=lightgray
set mouse=a
if has('gui_running')
	colorscheme slate
	set guifont=Hack\ 11
endif
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
set cin!
map zo o<esc>
map zO O<esc>
map z<down> o<esc>k
map z<up> O<esc>j
nnoremap <F1> :make!<cr>
nnoremap <F4> :! ./gmake.sh<cr>
nnoremap <F5> :! clear ; ./x*<cr>
nnoremap <F9> :mksession! Vim/current.vim<cr>
nnoremap <F10> :source Vim/current.vim<cr>
nnoremap <F11> :! ~/Coding/Bash/randomScript/vimPull.sh<cr>
nnoremap <F12> :! ~/Coding/Bash/randomScript/vimPush.sh<cr>
