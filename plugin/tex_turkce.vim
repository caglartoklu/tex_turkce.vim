" -*- vim -*-
" FILE: tex_turkce.vim
" PLUGINTYPE: plugin
" DESCRIPTION: Converts Turkish characters to their TeX/HTML representation and back.
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
command! -range=% TrToHtml :call ConvertToHtml(<f-line1>,<f-line2>)
command! -range=% TrFromHtml :call ConvertFromHtml(<f-line1>,<f-line2>)
command! -range=% TrTo :call ConvertToGeneric(<f-line1>,<f-line2>)
command! -range=% TrFrom :call ConvertFromGeneric(<f-line1>,<f-line2>)


function! s:SetEncoding()
    " Set the encoding locally, for this buffer.
    " This function is automatically called before each command.
    setlocal encoding=utf-8
endfunction


function! ConvertToTex(lineStart, lineFinish)
    " ç => c{c}
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
    " c{c} => ç
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


function! ConvertToHtml(lineStart, lineFinish)
    " ç => &ccedil;
    call s:SetEncoding()

    exec a:lineStart . ',' . a:lineFinish . 's/ç/\&ccedil;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ç/\&Ccedil;/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ı/\&#305;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/İ/\&#304;/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ğ/\&#287;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ğ/\&#286;/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ö/\&ouml;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ö/\&Ouml;/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ş/\&#351;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ş/\&#350;/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ü/\&uuml;/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ü/\&Uuml;/gIe'
endfunction


function! ConvertFromHtml(lineStart, lineFinish)
    " &ccedil => ç
    call s:SetEncoding()

    exec a:lineStart . ',' . a:lineFinish . 's/&ccedil;/ç/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#231;/ç/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&Ccedil;/Ç/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#199;/Ç/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/&#305;/ı/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#304;/İ/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/&#287;/ğ/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#286;/Ğ/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/&ouml;/ö/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#246;/ö/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&Ouml;/Ö/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#214;/Ö/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/&#351;/ş/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#350;/Ş/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/&uuml;/ü/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#252;/ü/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&Uuml;/Ü/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/&#220;/Ü/gIe'
endfunction


function! ConvertToGeneric(lineStart, lineFinish)
    " generic function, calls the appropriate one
    let ftype = &filetype
    if ftype == 'tex'
        call ConvertToTex(a:lineStart, a:lineFinish)
    elseif ftype == 'html'
        call ConvertToHtml(a:lineStart, a:lineFinish)
    endif
endfunction


function! ConvertFromGeneric(lineStart, lineFinish)
    " generic function, calls the appropriate one
    let ftype = &filetype
    if ftype == 'tex'
        call ConvertFromTex(a:lineStart, a:lineFinish)
    elseif ftype == 'html'
        call ConvertFromHtml(a:lineStart, a:lineFinish)
    endif
endfunction
