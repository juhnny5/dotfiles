"   ::::::::::. ::: :::           ::::::::::::
"    `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
"     `]]nnn]]' [[[ [[[     ,['  [n    [[     	 Julien BRIAULT (Pil0t)
"      $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
"      888o     888o88oo,.__Y8,  ,8"   88,    
"      YMMMb    MMM""""YUMMM "YmmP     MMM  

" Automatic closeing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

" Wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>

" New line
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Toggle side window with `CTRL+n`
map <C-b> :NERDTreeToggle<CR>

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Enable autocomplete for .go files
au filetype go inoremap <buffer> . .<C-x><C-o>