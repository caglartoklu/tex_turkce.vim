# tex_turkce.vim

Converts Turkish characters to their Tex representation and back.

I wrote this plugin when I was working on my B.S. Thesis.
It helped me much then, I hope it helps others too.

Home page:
https://github.com/caglartoklu/tex_turkce.vim

Vim.org page:
http://www.vim.org/scripts/script.php?script_id=3029


## Changelog

- 2013-10-06
  - Conversion in selection instead of whole file.
  - If no selection is provided, whole file is used.
  - Commands renamed as `TrToTex` and `TrFromTex`
  - The script is now a `plugin` instead of `ftplugin`, since it will
    not be limited with `.tex` files in the future.
  - Hosted the code on Github, all the development will be on Github from now on.
  - Vim.org will be updated if a major change happens.
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

This plugin exposes two commands.
Select a text, and execute the commands.

When the plugin is executed, the characters will be replaced.

In the following screenshot, lines 6,7,8 is replaced using the
command `:TrToTex` and the result can be seen in lines 15,16,17.

`:TrFromTex` would do the reverse.

![tex_turkce1.png](https://raw.github.com/caglartoklu/tex_turkce/media/tex_turkce1.png)


### Commands

`:TrToTex`
  Converts Turkish characters to their `.tex` representation.

    ç       =>    \c{c}
    Ç       =>    \c{C}
    ı       =>    {\\i}
    İ       =>    \.I
    ğ       =>    \u{g}
    Ğ       =>    \u{G}
    ö       =>    \"o
    Ö       =>    \"O
    ş       =>    \c{s}
    Ş       =>    \c{S}
    ü       =>    \"u
    Ü       =>    \"U

`:TrFromTex`
  Converts `.tex` character representation of characters to Turkish.

    \c{c}   =>    ç
    \c{C}   =>    Ç
    {\\i}   =>    ı
    \.I     =>    İ
    \u{g}   =>    ğ
    \u{G}   =>    Ğ
    \"o     =>    ö
    \"O     =>    Ö
    \c{s}   =>    ş
    \c{S}   =>    Ş
    \"u     =>    ü
    \"U     =>    Ü



## Configuration

This plugin currently requires no configuration.


## License

Licensed with 2-clause license ("Simplified BSD License" or "FreeBSD License").
See the LICENSE file.


## Contact Info

You can find me on
[Google+](https://plus.google.com/108566243864924912767/posts)

Feel free to send bug reports, or ask questions.
