+++
title = "Emacs as the Ultimate LaTeX Editor"
location = "Bergen, Norway"
aliases = ["/2010/05/13/emacs-as-the-ultimate-latex-editor/", "/post/21038270357/emacs-as-the-ultimate-latex-editor", "/blog/emacs-as-the-ultimate-latex-editor"]
date = "2010-05-13"
tags = ["latex", "emacs"]
twitter = true
+++

Everyone knows, that [GNU Emacs](http://www.gnu.org/software/emacs/) is [THE Best Programmer's Editor](http://www.dina.dk/~abraham/religion/). Not everyone knows, though, that when you combine it with [AUCTeX](http://www.gnu.org/software/auctex/) macros, it also becomes **THE** Best Editor for LaTeX.

The biggest problem with Emacs is that it's not a particularly intuitive piece of software, to say the least, hence many users flee after their first encounter with it. Emacs has its complicated keyboard shortcuts, enormous documentation and config files written in a Lisp dialect (called [Emacs lisp](http://en.wikipedia.org/wiki/Emacs_lisp)), so at first it might seem very unpleasant using it. However, once *tamed*, it becomes your best friend.

I'd like to present some tips that customize Emacs making it a perfect and very sophisticated editor for LaTeX. Most of these ideas are taken from various config files, howtos and other resources found on the web. Some of them are mine, but I can no longer tell which.

First things first: you need to get Emacs and AUCTeX, and get it running.

Every major linux distro comes with both Emacs and AUCTeX available via package systems. In Ubuntu, you just type `sudo apt-get install emacs23 auctex` and you're laughing. Emacs is also [available](http://ftp.gnu.org/gnu/emacs/windows/) for Windows, and AUCTeX website has [instructions](http://www.gnu.org/software/auctex/download-for-windows.html) on how to set it up with Windows systems. Mac users have a choice of setting up either [Carbon Emacs](http://homepage.mac.com/zenitani/emacs-e.html) (a version closer to original GNU Emacs) or [Aquamacs](http://aquamacs.org/) (an Emacs variant supporting tabs and other nice tweaks; preferred Emacs package by all Mac users I know, Karolina included). Full comparison of Mac Emacs variants is available [here](http://aquamacs.org/feature-matrix.shtml), so you can make your own choice. Both Carbon Emacs and Aquamacs come with AUCTeX bundled, so there's no need to download additional packages.

After running Emacs and loading a TeX file (`C-x C-f file_name.tex`), AUCTeX should load itself automatically. If it doesn't happen, you can invoke it with `M-x tex-mode`, or you can put the following into your `$HOME/.emacs` file:

{{< highlight cl >}}
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)
{{< /highlight >}}

*(all the code snippets from this post are available as a [Github Gist](https://gist.github.com/pkazmierczak/4331666))*

The options above will make sure, that AUCTeX macros are loaded every time a TeX file is opened. The last option, `;(setq TeX-PDF-mode t)`, is commented (all lines beginning with `;` are a comment in Emacs Lisp), but you can uncomment it if you want to have PDFLaTeX mode enabled by default for all documents.

AUCTeX has a number of nice features, the two I use most often are:

- automatic formatting of a section: `C-c C-q C-s`;
- section preview: `C-c C-p C-s`; (see the screenshot on the right)

<img src="/images/emacs-latex-preview.png" />

Preview function is very nice, because you can *see* the commands that are *behind* preview images, edit the code, apply preview again and see the results --- no need to parse the whole file too often, and most importantly no need to switch to a PDF/PS viewer to see if your math formula/xypic tree is formatted correctly. Trust me, this saves a lot of time.

*(update 27.12.2012: there’s another way of previewing LaTeX symbols inside an Emacs buffer, take a look [here](/2012/12/27/previewing-latex-symbols-without-preview-latex/))*

AUCTeX has many many more features, and you can always consult its [documentation](http://www.gnu.org/software/auctex/documentation.html) if you want to learn more. It's a little bit overwhelming, but learning it is a very good investment, especially if you work with TeX a lot. But there are more packages that provide features which make your life easier.

[Flymake](http://flymake.sourceforge.net/) is one of those packages. It enables Emacs to check the syntax of your TeX file on-the-fly. To turn it on, put the following code in your `$HOME/.emacs`:

{{< highlight cl >}}
(require 'flymake)

(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)
{{< /highlight >}}

Beware, though --- flymake consumes quite a lot of CPU power, especially when used with large files (and paradoxically large files make it most useful).

On the other hand, spell-checking while you type isn't so cpu consuming, and you can turn it on with:

{{< highlight cl >}}
; could be ispell as well, depending on your preferences
(setq ispell-program-name "aspell") 
; this can obviously be set to any language your spell-checking program supports
(setq ispell-dictionary "english") 

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
{{< /highlight >}}

Another nice package is the [Outline Mode](http://www.gnu.org/software/emacs/manual/html_node/emacs/Outline-Mode.html). It allows the user to *hide* some parts of the text file, which makes working with large files much easier. To enable it, put the following in `$HOME/.emacs`:

{{< highlight cl >}}
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") ; Or something else
{{< /highlight >}}

Now you can *fold* sections, subsections, chapters, or the whole document. To hide all the contents of your current section, use `C-c C-o C-l`. You can apply it to a chapter, subsection, etc. You can also move to a next *unit* of your document with `C-c C-o C-n`, or to a previous one with `C-c C-o C-p`. If you're lost and want to see the whole document again, use `C-c C-o C-a`.

Folding and unfolding parts of the text might be confusing, though, but there's another way to navigate through a big TeX file, and you can use [Reftex](http://www.gnu.org/software/auctex/reftex.html) mode for it. Reftex is a mode that helps with managing references ([full documentation](http://www.gnu.org/software/auctex/manual/reftex.index.html)), but it can also be used to create a table of contents for a TeX file and to navigate using it. Here is my configuration for Reftex from my `.emacs` file:

{{< highlight cl >}}
(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
LaTeX-equation-label "eq"
LaTeX-figure-label "fig"
LaTeX-table-label "tab"
LaTeX-myChapter-label "chap"
TeX-auto-save t
TeX-newline-function 'reindent-then-newline-and-indent
TeX-parse-self t
TeX-style-path
'("style/" "auto/"
"/usr/share/emacs21/site-lisp/auctex/style/"
"/var/lib/auctex/emacs21/"
"/usr/local/share/emacs/site-lisp/auctex/style/")
LaTeX-section-hook
'(LaTeX-section-heading
LaTeX-section-title
LaTeX-section-toc
LaTeX-section-section
LaTeX-section-label))
{{< /highlight >}}

Once Reftex is loaded, you can invoke the table of contents buffer with
`C-c =`

<img src="/images/emacs-reftex-toc.png" class="small" />

All right, enough. If I mention any more packages, I guess it will scare off those who aren't already scared. I know that Emacs is a bit *peculiar* with its complicated keyboard shortcuts, enormous documentation and thousands of modes. It's not easy to learn, but definitely worth it. I remember that switching from Vim to Emacs for LaTeX editing wasn't easy, but I never regretted that, and I hope whoever's going to switch under the influence of this post will not regret it either.
