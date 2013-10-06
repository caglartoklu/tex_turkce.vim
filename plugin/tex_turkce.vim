" -*- vim -*-
" FILE: tex_turkce.vim
" PLUGINTYPE: plugin
" DESCRIPTION: Converts Turkish characters to their Tex represention and back.
" HOMEPAGE: https://github.com/caglartoklu/tex_turkce.vim
" LICENSE: https://github.com/caglartoklu/tex_turkce.vim/blob/master/LICENSE
" AUTHOR: caglartoklu

if exists("b:loaded_tex_turkce_plugin")
    " If it is already loaded, do not load it again.
    finish
endif
let b:loaded_tex_turkce_plugin = 1

" Define the commands:
command! -range=% TrToTex :call ConvertToTex(<f-line1>,<f-line2>)
command! -range=% TrFromTex :call ConvertFromTex(<f-line1>,<f-line2>)


function! s:SetEncoding()
    " Set the encoding locally, for this buffer.
    " This function is automatically called before each command.
    setlocal encoding=utf-8
endfunction


function! ConvertToTex(lineStart, lineFinish)
    " Converts characters to normal encoding.
    " From Vim documentation (:help s_flags):
    "   g : all occurences in the line.
    "   I : do not ignore case for the pattern.
    "   e : When the search pattern fails, do not issue an error message
    call s:SetEncoding()

    exec a:lineStart . ',' . a:lineFinish . 's/ç/\\c{c}/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ç/\\c{C}/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ı/{\\i}/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/İ/\\.I/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ğ/\\u{g}/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ğ/\\u{G}/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ö/\\"o/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ö/\\"O/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ş/\\c{s}/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ş/\\c{S}/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ü/\\"u/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ü/\\"U/gIe'
endfunction


function! ConvertFromTex(lineStart, lineFinish)
    " Converts characters to Unicode.
    " From Vim documentation (:help s_flags):
    "   g : all occurences in the line.
    "   I : do not ignore case for the pattern.
    "   e : When the search pattern fails, do not issue an error message
    call s:SetEncoding()

    exec a:lineStart . ',' . a:lineFinish . 's/\\c{c}/ç/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\c{C}/Ç/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/{\\i}/ı/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\.I/İ/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/\\u{g}/ğ/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\u{G}/Ğ/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/\\"o/ö/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\"O/Ö/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/\\c{s}/ş/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\c{S}/Ş/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/\\"u/ü/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/\\"U/Ü/gIe'
endfunction
