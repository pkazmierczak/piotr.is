+++
title = "Continuous list enumeration throughout the document with LaTeX"
locations_full = ["Leuven, Vlaams-Brabant"]
locations = ["Leuven"]
aliases = ["/2010/06/28/continuous-list-enumeration-throughout-the-document-with-latex/"]
date = "2010-06-28"
tags = ["latex"]
+++

Karolina asked me today to create a macro for having a continuous list enumeration throughout the whole document, i.e.

> This is the first list:
>
> 1. Item; 
> 2. Another item;
> 
> And here goes the second list:
>
> 3. Third item; 
> 4. And yet another item.

You can obtain an effect like that by using LaTeX counters and a custom definition of your own enumerate environment. First, we need to `\usepackage{enumerate}`, and then define the following counter and an environment in the preamble:

{{< highlight latex >}}
\newcounter{enumi_saved}

\newenvironment{myenumerate} {
    \begin{enumerate}\setcounter{enumi}{\value{enumi_saved}}}
    {\setcounter{enumi_saved}{\value{enumi}}\end{enumerate}}
{{< /highlight >}}

After that, you can use `myenumerate` and you'll have a continuous enumeration in the whole document.

Oh and some credits: I wouldn't come up with a solution if I haven't read [this](http://texblog.wordpress.com/2007/07/25/counters-in-latex/) post, and [this](http://www.f.kth.se/~ante/latex.php) website. Huge thanks to the authors for their tips!
