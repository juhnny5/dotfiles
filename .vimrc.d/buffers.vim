" Add YAML stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Add Bash template to .sh files
au bufnewfile *.sh 0r /home/pil0t/.vim/templates/bash.template

" Add Python template to .py files
au bufnewfile *.py 0r /home/pil0t/.vim/templates/python3.template

" Add Perl template to .pl files
au bufnewfile *.pl 0r /home/pil0t/.vim/templates/perl.template

" Add Go template to .go files
" "au bufnewfile *.go 0r /home/pil0t/.vim/templates/go.template

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*aliases set ft=sh

" Make sure .bashrc, path.bashrc and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*.bashrc set ft=sh

" Highlight trailing spaces
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
" let g:vimsyn_folding='af'

" Remove automatically trailing spaces
autocmd BufWritePre * :%s/\s\+$//e