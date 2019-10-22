---
date: 2016-01-10
title: No more LaTeX
location: Munich, Germany
tags: [LaTeX, vim]
twitter: false
---

I made [jokes](/2015/done/) about this before, but it actually happened: since I no longer use LaTeX, I removed it from my laptop and got rid of the config from my `.vimrc`. It's nothing unusual, but I somewhat feel that the departure from LaTeX marks an important *(sic!)* moment in my life.

LaTeX was my "gateway drug" to programming. I kid you not. Since I was interested in publishing as a teenager (even ran a small but successful magazine for a while), got very disappointed in MS Word's DTP capabilities, had no money or supported OS to run Adobe or Quark, LaTeX was for me, sadly, the only option to put my magazine together. A Polish magazine called Linux+ published an article about LaTeX, I went through the tutorial, then through [lshort2e.pdf](https://www.google.com/search?q=lshort2e.pdf), and got hooked. I was of course impressed by the quality of the output, but most importantly I understood the powerful concept of source code and compilation. LaTeX is of course technically *markup* and not *code*,[^1] and it's not exactly *compiled* but *parsed*, but still the process and concepts are easily translatable to programming. So then came going through [AWK](https://en.wikipedia.org/wiki/AWK) tutorials, and later came C and Perl. And much later came a lot of other stuff, but it all started with LaTeX.

I owe LaTeX a lot. It made my silly little magazine look *good*, impressing people at the printshop and everyone else who had the slightest idea about publishing. It made writing technical notes on formal logic for my classes in philosophy so much easier. I wrote my master's and my doctoral theses using it. And yeah, it also made my blog's most popular blog post.[^2] It is then with a heavy heart that I am writing that I really, really hate LaTeX and am very happy that I don't have to use it anymore.

I'm not saying ["switch to MS Word"](/2014/stop-using-latex-switch-to-ms-word/) or something silly like that, no. But it saddens me that after so many years the open source/free software community did not produce anything more modern, easier to use[^3] and simply more elegant. LaTeX is a mess, and the underlying TeX typesetting systems dates back to the 70s. It comes in *huge* tarballs or installers. It has an annoying syntax. Its fonts are as beautiful as they are painful to install. Its error messages are cryptic. The list of problems goes on.

I was actually hoping that the academic community would adopt [Pandoc](http://pandoc.org/) and restrict LaTeX usage to its math formulas syntax, but that didn't happen. And I suppose Matthias Ettrich hoped the academic community would adopt [LyX](http://www.lyx.org/) (which is actually surprisingly good), but that didn't happen either.

I guess the beauty of leaving the world of academia is that I no longer have to care.

[^1]: Or rather: it's most commonly used as a markup language, but is in fact a [Turing complete](http://en.literateprograms.org/Turing_machine_simulator_(LaTeX)) programming language.

[^2]: It is actually *astonishing* how many people read and share this howto. I never expected to end up in lecture notes for CS and physics classes in places like Colorado State, not to mention reddits and HN of course.

[^3]: By "easier to use" I don't necessarily mean a GUI. Having a markup language is good.