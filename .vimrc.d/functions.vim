"   ::::::::::. ::: :::           ::::::::::::
"    `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
"     `]]nnn]]' [[[ [[[     ,['  [n    [[     	 Julien BRIAULT (Pil0t)
"      $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
"      888o     888o88oo,.__Y8,  ,8"   88,    
"      YMMMb    MMM""""YUMMM "YmmP     MMM  

" Do not open NERDTree for a single file
function! StartUp()
    if !argc() && !exists("s:std_in")
        NERDTree
    end
    if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
    end
endfunction

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction