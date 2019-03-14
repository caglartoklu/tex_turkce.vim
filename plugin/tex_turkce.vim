" -*- vim -*-
" FILE: tex_turkce.vim
" PLUGINTYPE: plugin
" DESCRIPTION: Converts Turkish characters to their TeX/HTML representation and back.
" HOMEPAGE: https://github.com/caglartoklu/tex_turkce.vim
" LICENSE: https://github.com/caglartoklu/tex_turkce.vim/blob/master/LICENSE
" AUTHOR: caglartoklu


function! tex_turkce#SetSampleSettings()
    " Sample settings block for tex_turkce:
    " Simply copy the contents (inner block) of this function to your vimrc.

    " { Plugin 'caglartoklu/tex_turkce.vim'
        let g:text_turkce_advance_to_next_character = 1
        " nmap <leader>tr : TexTurkceReplaceOneChar<CR>
        nmap tr : TexTurkceReplaceOneChar<CR>
    " }
endfunction


if exists("b:loaded_tex_turkce_plugin")
    " If it is already loaded, do not load it again.
    finish
endif
let b:loaded_tex_turkce_plugin = 1


function! s:SetDefaultSettings()
    " Sets the default settings for once.
    " If the user does not load the settings in vimrc,
    " these values will be used.

    if !exists('g:text_turkce_advance_to_next_character')
        " enable/disable the plugin
        let g:text_turkce_advance_to_next_character = 1
    endif

    " TODO: 5 mapping
endfunction

call s:SetDefaultSettings()


" Define the commands:
command! -range=% TrToTex :call tex_turkce#ConvertToTex(<f-line1>,<f-line2>)
command! -range=% TrFromTex :call tex_turkce#ConvertFromTex(<f-line1>,<f-line2>)
command! -range=% TrToHtml :call tex_turkce#ConvertToHtml(<f-line1>,<f-line2>)
command! -range=% TrFromHtml :call tex_turkce#ConvertFromHtml(<f-line1>,<f-line2>)
command! -range=% TrToAnsi :call tex_turkce#ConvertToAnsi(<f-line1>,<f-line2>)
command! -range=% TrTo :call tex_turkce#ConvertToGeneric(<f-line1>,<f-line2>)
command! -range=% TrFrom :call tex_turkce#ConvertFromGeneric(<f-line1>,<f-line2>)


function! s:SetEncoding()
    " Set the encoding locally, for this buffer.
    " This function is automatically called before each command.
    setlocal encoding=utf-8
endfunction


function! tex_turkce#ConvertToTex(lineStart, lineFinish)
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


function! tex_turkce#ConvertFromTex(lineStart, lineFinish)
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


function! tex_turkce#ConvertToHtml(lineStart, lineFinish)
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


function! tex_turkce#ConvertFromHtml(lineStart, lineFinish)
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


function! tex_turkce#ConvertToAnsi(lineStart, lineFinish)
    " Converts Turkish characters with accents to
    " similar ones in ANSI.
    " This option is irreversible unless you use undo.
    call s:SetEncoding()

    exec a:lineStart . ',' . a:lineFinish . 's/ç/c/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ç/C/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ı/i/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/ý/i/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/İ/I/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ý/I/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ğ/g/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/ð/g/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ğ/G/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ð/G/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ö/o/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ö/O/gIe'

    " exec a:lineStart . ',' . a:lineFinish . 's/ş/$/gIe'
    " exec a:lineStart . ',' . a:lineFinish . 's/þ/$/gIe'
    " exec a:lineStart . ',' . a:lineFinish . 's/Ş/$/gIe'
    " exec a:lineStart . ',' . a:lineFinish . 's/Þ/$/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/ş/s/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/þ/s/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ş/S/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Þ/S/gIe'

    exec a:lineStart . ',' . a:lineFinish . 's/ü/u/gIe'
    exec a:lineStart . ',' . a:lineFinish . 's/Ü/U/gIe'
endfunction


function! tex_turkce#ConvertToGeneric(lineStart, lineFinish)
    " generic function, calls the appropriate one
    let ftype = &filetype
    if ftype == 'tex'
        call tex_turkce#ConvertToTex(a:lineStart, a:lineFinish)
    elseif ftype == 'html'
        call tex_turkce#ConvertToHtml(a:lineStart, a:lineFinish)
    else
        echo "No suitable tex_turkce converter found."
    endif
endfunction


function! tex_turkce#ConvertFromGeneric(lineStart, lineFinish)
    " generic function, calls the appropriate one
    let ftype = &filetype
    if ftype == 'tex'
        call tex_turkce#ConvertFromTex(a:lineStart, a:lineFinish)
    elseif ftype == 'html'
        call tex_turkce#ConvertFromHtml(a:lineStart, a:lineFinish)
    else
        echo "No suitable tex_turkce converter found."
    endif
endfunction


function! tex_turkce#ReplaceOneTurkishCharacter()
    " Replaces one character with its Turkish counterpart.
    " Turkish characters:
    " ğüşiöçĞÜŞİÖÇ
    " if the character is not one of them, it has no effect.

    " get the character under cursor.
    " https://stackoverflow.com/a/43582469
    let ch1 = strcharpart(getline('.')[col('.') - 1:], 0, 1)
    echo ch1
    let cmd = 'normal! '
    let found = 0

    if ch1 == 'g'
        let found = 1
        let cmd = cmd . 'rğ'
    elseif ch1 == 'u'
        let found = 1
        let cmd = cmd . 'rü'
    elseif ch1 == 's'
        let found = 1
        let cmd = cmd . 'rş'
    elseif ch1 == 'i'
        let found = 1
        let cmd = cmd . 'rı'
    elseif ch1 == 'o'
        let found = 1
        let cmd = cmd . 'rö'
    elseif ch1 == 'c'
        let found = 1
        let cmd = cmd . 'rç'

    elseif ch1 == 'G'
        let found = 1
        let cmd = cmd . 'rĞ'
    elseif ch1 == 'U'
        let found = 1
        let cmd = cmd . 'rÜ'
    elseif ch1 == 'S'
        let found = 1
        let cmd = cmd . 'rŞ'
    elseif ch1 == 'I'
        let found = 1
        let cmd = cmd . 'rI'
    elseif ch1 == 'O'
        let found = 1
        let cmd = cmd . 'rÖ'
    elseif ch1 == 'C'
        let found = 1
        let cmd = cmd . 'rÇ'
    endif

    if found == 1
        execute cmd
    endif

    if g:text_turkce_advance_to_next_character == 1
        execute 'normal! l'
    endif
endfunction

command! -nargs=0 TexTurkceReplaceOneChar : call tex_turkce#ReplaceOneTurkishCharacter()

