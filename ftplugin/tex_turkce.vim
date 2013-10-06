" -*- vim -*-
" FILE: tex_turkce.vim
"
" PLUGIN TYPE: ftplugin
"
" DESCRIPTION: (Tanim)
" Turkce : TeX dokumanlarindaki Turkce karakterleri TeX formundan Unicode
" formuna cevirir ve bu islemin tersini yapar.
" English : Converts Turkish characters from/to TeX format to/from Unicode.
"
" COMMANDS: (KOMUTLAR)
" :KarakterleriNormalKodla
"   ç       =>    \c{c}
"   Ç       =>    \c{C}
"   ı       =>    {\\i}
"   İ       =>    \.I
"   ğ       =>    \u{g}
"   Ğ       =>    \u{G}
"   ö       =>    \"o
"   Ö       =>    \"O
"   ş       =>    \c{s}
"   Ş       =>    \c{S}
"   ü       =>    \"u
"   Ü       =>    \"U
"
" :KarakterleriUnicodeKodla
"   \c{c}   =>    ç
"   \c{C}   =>    Ç
"   {\\i}   =>    ı
"   \.I     =>    İ
"   \u{g}   =>    ğ
"   \u{G}   =>    Ğ
"   \"o     =>    ö
"   \"O     =>    Ö
"   \c{s}   =>    ş
"   \c{S}   =>    Ş
"   \"u     =>    ü
"   \"U     =>    Ü
"
" LAST MODIFICATION: 2010-03-27
" (C) Copyright 2010 Caglar Toklu <caglartoklu[aat]gmail.com>
" Maintained by Caglar Toklu <caglartoklu[aat]gmail.com>
"
" VERSION: 0.0.1
"
" CHANGELOG:
" - 0.0.1, 2010-03-27
"   - First version.
"
" LICENSE: (LISANS)
"   Copyright (C) 2010  Caglar Toklu
"
"   This program is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.
"
"   This program is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" USAGE: (KULLANIM)
" English :
"     Copy to the Vim ftplugin directory.
"     If you want to use for any file type than .tex, copy it
"     to plugin directory instead of ftplugin.
" Turkce :
"     Dosyayi ftplugin dizinine kopyalayin.
"     Eger bu eklentiyi .tex den baska dosya tipleri icin de
"     kullanmak istiyorsaniz, ftplugin yerine plugin dizinine kopyalayin.
"
" REFERENCES: (REFERANSLAR)
" http://vim.wikia.com/wiki/Working_with_Unicode
" http://library.nku.edu/style/unicode.html
"


" Do not load the plugin if it has been already loaded.
" Eger eklenti yuklenmisse tekrar yukleme.
if exists("b:loaded_tex_turkce_plugin")
    finish
endif
let b:loaded_tex_turkce_plugin = 1


" Define the commands:
" Komutlari tanimla:
command! -nargs=0 KarakterleriNormalKodla :call ConvertCharactersToNormalEncoding()
command! -nargs=0 KarakterleriUnicodeKodla :call ConvertCharactersToUnocide()


function! s:SetEncoding()
    " English :
    "     Set the encoding locally, for this buffer.
    "     This function is called before the operation.
    " Turkce :
    "     Kodlamayi sadece bu dosya icin uygula.
    "     Islemden once bu fonksiyon cagirilir.
    setlocal encoding=utf-8
endfunction


function! ConvertCharactersToNormalEncoding()
    " English :
    "     Converts characters to normal encoding.
    "     From Vim documentation (:help s_flags)
    "     g :all occurences in the line.
    "     I :do not ignore case for the pattern.
    "     e :When the search pattern fails, do not issue an error message
    " Turkce :
    "    Karakterleri normal kodlanmis haline cevirir.
    "    Vim dokumantasyonundan (:help s_flags)
    "    g :satirdaki tum karsilasmalar (sadece 1. si icin degil).
    "    I :kucuk buyuk harf duyarli.
    "    e :eger bir hata ile karsilasilirsa, hata verme
    call s:SetEncoding()

    exec '%s/ç/\\c{c}/gIe'
    exec '%s/Ç/\\c{C}/gIe'

    exec '%s/ı/{\\i}/gIe'
    exec '%s/İ/\\.I/gIe'

    exec '%s/ğ/\\u{g}/gIe'
    exec '%s/Ğ/\\u{G}/gIe'

    exec '%s/ö/\\"o/gIe'
    exec '%s/Ö/\\"O/gIe'

    exec '%s/ş/\\c{s}/gIe'
    exec '%s/Ş/\\c{S}/gIe'

    exec '%s/ü/\\"u/gIe'
    exec '%s/Ü/\\"U/gIe'
endfunction



function! ConvertCharactersToUnocide()
    " English :
    "     Converts characters to Unicode.
    "     From Vim documentation (:help s_flags)
    "     g :all occurences in the line.
    "     I :do not ignore case for the pattern.
    "     e :When the search pattern fails, do not issue an error message
    " Turkce :
    "    Karakterleri Unicode haline cevirir.
    "    Vim dokumantasyonundan (:help s_flags)
    "    g :satirdaki tum karsilasmalar (sadece birincisi icin degil).
    "    I :kucuk buyuk harf duyarli.
    "    e :eger bir hata ile karsilasilirsa, hata verme
    call s:SetEncoding()

    exec '%s/\\c{c}/ç/gIe'
    exec '%s/\\c{C}/Ç/gIe'

    exec '%s/{\\i}/ı/gIe'
    exec '%s/\\.I/İ/gIe'

    exec '%s/\\u{g}/ğ/gIe'
    exec '%s/\\u{G}/Ğ/gIe'

    exec '%s/\\"o/ö/gIe'
    exec '%s/\\"O/Ö/gIe'

    exec '%s/\\c{s}/ş/gIe'
    exec '%s/\\c{S}/Ş/gIe'

    exec '%s/\\"u/ü/gIe'
    exec '%s/\\"U/Ü/gIe'
endfunction
