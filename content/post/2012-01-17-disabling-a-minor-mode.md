+++
slug = "disabling-minor-mode"
location = "Bergen, Vestland"
locations = ["Bergen"]
aliases = ["/2012/01/17/disabling-a-minor-mode-on-a-per-file-basis/"]
date = "2012-01-17"
tags = ["emacs", "stack overflow"]
+++

I like `auto-fill-mode` and even have it customized for `LaTeX-mode` in my Emacs configuration. However, while working with other people via a distributed version control system, like I do with my friends, `auto-fill-mode` can be a real pain if not everyone uses it. Whenever the ones that do commit any code, others are annoyed because it’s difficult to see the changes in the diff file, since `auto-fill-mode` reformats paragraphs (hence producing ‘more’ changes).

The most straightforward solution is to put some local variables into the file, like `(auto-fill-mode -1)`, but today at StackOverflow I saw [a much neater solution](http://stackoverflow.com/questions/6669373/disabling-auto-fill-mode-on-a-per-file-not-filetype-basis): one can put a function that searches for a specific string inside a file and sets minor-modes accordingly. So now there’s a *coauthors search* function in my `.emacs`:

```
; auto-fill is enabled for TeX...
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
; ...unless I work with the gang
(defun my-auto-fill-disabling-hook ()
  "Check to see if we should disable autofill."
  (save-excursion
    (when (or (re-search-forward "truls" 1000 t)
              (re-search-forward "sjur" 1000 t)
              (re-search-forward "erik" 1000 t))
      (auto-fill-mode -1))))
(add-hook 'find-file-hooks 'my-auto-fill-disabling-hook)
```
