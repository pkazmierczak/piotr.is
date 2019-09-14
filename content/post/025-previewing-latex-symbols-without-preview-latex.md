+++
title = "Previewing LaTeX symbols without preview-latex"
location = "Bergen, Norway"
aliases = ["/2012/12/27/previewing-latex-symbols-without-preview-latex/"]
date = "2012-12-27"
tags = ["latex", "emacs"]
+++

This blog's most popular post is the [Emacs howto
entry](/2010/05/13/emacs-as-the-ultimate-latex-editor/
"Emacs as the Ultimate LaTeX Editor"), so I thought I'd share one more
LaTeX-related tip for all your Emacs needs. Besides the traditional
`preview-latex` way of generating TeX formulas inside Emacs buffer,
there's a faster and neater way to do this using Emacs' unicode support.
My friends Erik Parmann and Pål Drange made a simple
[package](https://bitbucket.org/mortiferus/latex-pretty-symbols.el) that
turns many math symbols and Greek letters commands into corresponding
unicode characters. Here's a sample of how this looks:

<a href="https://dcc6e3lk9c0l3.cloudfront.net/emacs-pretty-latex.png"><img class="small" src="https://dcc6e3lk9c0l3.cloudfront.net/emacs-pretty-latex.png" /></a>

If you're running Emacs 24, you can get the package from
[MELPA](http://melpa.milkbox.net) repository. Otherwise you can get it
from [Erik's
bitbucket](https://bitbucket.org/mortiferus/latex-pretty-symbols.el),
put it somewhere in your load path and load it with `(require
'latex-pretty-symbols)`. There, happy TeXing!

(also, you can make similar tricks with [Haskell
mode](https://github.com/haskell/haskell-mode) and have all your lambdas
displayed properly).
