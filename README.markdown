# tex_turkce.vim

Converts Turkish characters between
[TeX](https://en.wikipedia.org/wiki/TeX),
[HTML](https://en.wikipedia.org/wiki/Html),
ANSI and Turkish accent representations and back.

I wrote this plugin when I was working on my B.S. Thesis.
It helped me much then, I hope it helps others too.

Home page:
https://github.com/caglartoklu/tex_turkce.vim

Vim.org page:
http://www.vim.org/scripts/script.php?script_id=3029


## Changelog

- 2019-03-14
  - Added `TexTurkceReplaceOneChar` command.
- 2013-10-31
  - Added `TrToAnsi` command.
    This command will convert Turkish
    characters with accents to similar ones in ANSI.
    This has no *from* function since the change is irreversible
    unless undoed.
  - Added warnings if `TrTo` or `TrFrom` does not find a suitable
    converter function.
- 2013-10-30
  - Added generic `TrTo` and `TrFrom` commands which calls the appropriate
    conversion function according to the file type.
- 2013-10-06
  - Conversion in selection instead of whole file.
  - If no selection is provided, whole file is used.
  - Commands renamed as `TrToTex` and `TrFromTex`
  - The script is now a `plugin` instead of `ftplugin`, since it will
    not be limited with `.tex` files in the future.
  - Hosted the code on [Github](https://github.com/),
    all the development will be on Github from now on.
  - [vim.org](http://www.vim.org/scripts/script.php?script_id=3029)
    will be updated if a major change happens.
  - The license has been changed from GPL to 2-clause FreeBSD.
  - The file is saved in UNIX file format instead of Windows.
- 0.0.1, 2010-03-27
  - First version.


## Installation

For [Vundle](https://github.com/gmarik/vundle) users:

    Bundle 'caglartoklu/tex_turkce.vim'

For [Pathogen](https://github.com/tpope/vim-pathogen) users:

    cd ~/.vim/bundle
    git clone git://github.com/caglartoklu/tex_turkce.vim

For all other users, simply drop the `tex_turkce.vim` file to your
`plugin` directory.


## Supported Environments
- Vim (no `+Python` required)


## Usage

Select a text, and execute the commands.
Please note that if no text is choosen,
whole file content is processed.
When a command is executed, the characters will be replaced.
If things get messed up somehow, simply press `u` for undo in
[insert node](http://vimdoc.sourceforge.net/htmldoc/insert.html).


### TeX Character Conversion

In the following screenshot, lines 6,7,8 is replaced using the
command `:TrToTex` and the result can be seen in lines 15,16,17.

`:TrFromTex` would do the reverse.

![tex_turkce1.png](https://raw.github.com/caglartoklu/tex_turkce/media/tex_turkce1.png)


### HTML Character Conversion

Whe natively typed Turkish characters are encoded using `:TrToHtml` command,

![html_code1.png](https://raw.github.com/caglartoklu/tex_turkce/media/html_code1.png)

this is what is seen on the web page when no any encoding applied:

![html_webpage1.png](https://raw.github.com/caglartoklu/tex_turkce/media/html_webpage1.png)


### Commands

**`:TrToTex`**

Converts Turkish characters to their `.tex` representation.

    ç         =>    \c{c}
    Ç         =>    \c{C}
    ı         =>    {\\i}
    İ         =>    \.I
    ğ         =>    \u{g}
    Ğ         =>    \u{G}
    ö         =>    \"o
    Ö         =>    \"O
    ş         =>    \c{s}
    Ş         =>    \c{S}
    ü         =>    \"u
    Ü         =>    \"U

**`:TrFromTex`**

Converts `.tex` character representation of characters to Turkish.

    \c{c}     =>    ç
    \c{C}     =>    Ç
    {\\i}     =>    ı
    \.I       =>    İ
    \u{g}     =>    ğ
    \u{G}     =>    Ğ
    \"o       =>    ö
    \"O       =>    Ö
    \c{s}     =>    ş
    \c{S}     =>    Ş
    \"u       =>    ü
    \"U       =>    Ü

**`:TrToHTML`**

Converts Turkish characters to their `.html` representation.

    ç         =>    &ccedil;
    Ç         =>    &Ccedil;
    ı         =>    &#305;
    İ         =>    &#304;
    ğ         =>    &#287;
    Ğ         =>    &#286;
    ö         =>    &ouml;
    Ö         =>    &Ouml;
    ş         =>    &#351;
    Ş         =>    &#350;
    ü         =>    &uuml;
    Ü         =>    &Uuml;

**`:TrFromHtml`**

Converts `.html` character representation of characters to Turkish.

    &ccedil;  =>    ç
    &#231;    =>    ç
    &Ccedil;  =>    Ç
    &#199;    =>    Ç
    &#305;    =>    ı
    &#304;    =>    İ
    &#287;    =>    ğ
    &#286;    =>    Ğ
    &ouml;    =>    ö
    &#246;    =>    ö
    &Ouml;    =>    Ö
    &#214;    =>    Ö
    &#351;    =>    ş
    &#350;    =>    Ş
    &uuml;    =>    ü
    &#252;    =>    ü
    &Uuml;    =>    Ü
    &#220;    =>    Ü


**`:TrToAnsi`**

This command will convert Turkish
characters with accents to similar ones in ANSI.

    ç         =>    c
    Ç         =>    C
    ı         =>    i
    ý         =>    i
    İ         =>    I
    Ý         =>    I
    ğ         =>    g
    ð         =>    g
    Ğ         =>    G
    Ð         =>    G
    ö         =>    o
    Ö         =>    O
    ş         =>    s
    þ         =>    s
    Ş         =>    S
    Þ         =>    S
    ü         =>    u
    Ü         =>    U

**`:TexTurkceReplaceOneChar`**

In normal mode, if the character is one of the ANSI characters below,
it converts a single character to its Turkish accent counterpart.
For all the other characters, it has no effect.
This command allows Turkish accent output when your keyboard does not support Turkish character set.

    g         =>    ğ
    u         =>    ü
    s         =>    ş
    i         =>    ı
    o         =>    ö
    c         =>    ç


## Configuration

You can use the following block for configuration:

    " { Plugin 'caglartoklu/tex_turkce.vim'
        let g:text_turkce_advance_to_next_character = 1
        " nmap <leader>tr : TexTurkceReplaceOneChar<CR>
        nmap tr : TexTurkceReplaceOneChar<CR>
    " }


## References

### Turkish
- https://en.wikipedia.org/wiki/Turkish_alphabet

### TeX
- https://en.wikipedia.org/wiki/TeX
- https://en.wikipedia.org/wiki/LaTeX

### HTML
- https://en.wikipedia.org/wiki/Html
- http://webdesign.about.com/od/localization/l/blhtmlcodes-tr.htm
- http://character-code.com/turkish-html-codes.php

### Vim
This plugin uses
[:help substitute](http://vimdoc.sourceforge.net/htmldoc/change.html#:substitute)
command of Vim.

Used flags are:

    `g` : all occurences in the line.
    `I` : do not ignore case for the pattern.
    `e` : When the search pattern fails, do not issue an error message

For reference, see
[:help s_flags](vimdoc.sourceforge.net/htmldoc/change.html#:s_flags)


## License

Licensed with 2-clause license ("Simplified BSD License" or "FreeBSD License").
See the [LICENSE](https://github.com/caglartoklu/tex_turkce/blob/master/LICENSE) file.

