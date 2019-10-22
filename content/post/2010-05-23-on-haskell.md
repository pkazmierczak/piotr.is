+++
title = "On Haskell"
location = "Bergen, Norway"
aliases = ["/2010/05/23/on-haskell/"]
readlater = true
date = "2010-05-23"
tags = ["programming", "logic"]
+++

Although I've always wanted to become a professional programmer, I never
became one. I studied philosophy and went into a PhD programme in computer
science because of my interest in formal logic. I like computers very much, I
have professional experience in UNIX administration, and I've done a lot of
Perl/Bash/Tcsh scripting, but I've never actually written any non-trivial
piece of programming code. Whether you want to model something, verify, or
check your proofs, being able to write a computer program that helps you with
some task really comes in handy. And then there's this question: what
programming language should a person interested in logic/mathematics (without
any CS background) learn?

The first obvious choice for people interested in logic is
[Prolog](http://en.wikipedia.org/wiki/Prolog). It's relatively easy to learn,
but after some time playing with it we discover that it's quite limited, and
not too efficient. Java is faster, easy as well and more versatile, but for
_very high-level_ programming (theorem provers, model checkers) it takes a lot
of time to implement ideas, especially when compared to Prolog. Then there are
other nice suitable languages like Python (very generic), LISP/Scheme (rather
old, yet still very powerful), and finally Haskell.[^1]

Haskell is a general purpose [statically-
typed](http://en.wikipedia.org/wiki/Static_types#Static_typing) [purely
functional](http://en.wikipedia.org/wiki/Purely_functional) programming
language. It supports [lazy
evaluation](http://en.wikipedia.org/wiki/Lazy_evaluation),
[typeclasses](http://en.wikipedia.org/wiki/Type_class) and [type
polymorphism](http://en.wikipedia.org/wiki/Type_polymorphism). It provides an
enormous set of tools for the programmer, while being far more efficient and
flexible than, say, Prolog. Due to its nature it also imposes some discipline
on the programmer (for example, static typing prevents a number of errors on
the level of compilation), making programming more rigorous and efficient. ESR
[recently wrote](http://esr.ibiblio.org/?p=1796) about Haskell:

> Haskell is built around a handful of powerful primitive concepts and a _pons
> asinorum_. The most pervasive of these, purely functional programming without
> side effects or variables, is generally described in introductions to Haskell
> as the most difficult barrier for most programmers arriving from conventional
> imperative or OO languages like C, C++, and Python. And yes, if your mental
> model of programming is all about for-loops and static variables — or, for
> that matter, objects! — learning to think in Haskell is going to be quite a
> wrench. There are reasons to make the effort. Haskellers (Haskellites?
> Haskellians? Haskellators? Haskelletons?) maintain that imperative programming
> relies heavily on side effects that push proving the correctness of programs
> to somewhere between impractically difficult and impossible. They also like to
> point out that side effects make programs difficult to automatically
> parallelize across multiple processors, an increasingly important
> consideration as multicores become the rule rather than the exception.

That's true, Haskell is not a trivial language to learn. I've been learning it
for a while now, and I'm still far from saying that I actually _know_ Haskell.
Lazy evaluation and purely functional approach make it especially hard to
switch from imperative way of thinking in the beginning. It's difficult to
learn, but the effort is worth taking. "Discrete Mathematics Using a Computer"
justifies the effort like this:

> Pure functional languages like Haskell, as well as mathematics itself, are
> demanding in that they require you to think through a problem deeply in order
> to express its solution with equations. It's always possible to hack an
> imperative program by sticking an assignment in it somewhere in order to patch
> up a problem, but you cannot do that in a functional program. On the other
> hand, if our goal is to build correct and reliable software --- and this
> should be our goal! --- then the discipline of careful thought will be repaid
> in higher quality software.[^2]

I can also add that Haskell forces a programmer to study some aspects of
theoretical computer science in a way other languages don't. It's a bit like
with LISP -- you have to know something about lists, trees, recursion, higher-
order functions, etc., otherwise you won't be able to learn it. On the other
hand I'd risk saying that it's possible to learn for example Perl without
getting into theory of programming too much (but perhaps I'm wrong here).

So if it's all so hard, how should one learn Haskell? That very much depends
on your level of programming literacy (in general, not necessarily functional
programming literacy), amount of time you want to spend, and your motivations
behind learning Haskell. I once told my PhD supervisor that I actually know of
3,5 good books on Haskell programming:

1. "[Learn you a Haskell for great good](http://learnyouahaskell.com)"
-- not a book really, rather an online tutorial with lots of funny
pictures; among the free tutorials it's the best one I know;

2. "[Real world Haskell](http://book.realworldhaskell.org)" --
currently the most famous Haskell book I guess; it's a bit like
Seibel's "[Practical Common Lisp](http://www.gigamonkeys.com/book/)",
only on Haskell; even if you're not into web development or databases,
this book is the best introduction to Haskell and functional
programming I found; oh, and it's free for online reading, but you can
always grab a printed copy for ~$50;

3. "[Discrete Mathematics Using a Computer](http://www.dcs.gla.ac.uk/~jtod/discrete-mathematics/)"
-- this is definitely a must read for anyone interested particularly
in using Haskell for solving logical and/or mathematical problems;
it's really great and focuses on logic, recursion, set theory and so
on, and still provides a good introduction to Haskell;

4. "[The Haskell Road to Logic, Maths and Programming](http://homepages.cwi.nl/~jve/HR/)"
-- another book focusing mainly on logical and mathematical
applications; it's good, but I found it very difficult and although
authors say they don't assume any background in functional
programming, they actually do assume quite a lot (at least that was my
impression).

All the books listed above are good, but I think the order in which I put them
corresponds to their difficulty level. Not exactly, though: "Real World
Haskell" can get pretty dense, but it introduces everything quite gently. "The
Haskell Road to Logic..." on the other hand is in my opinion difficult
throughout its whole length.

I strongly recommend everyone (especially to fellow logicians) to at least
give Haskell a try, it's definitely worth it. And if you happen to live in
Bergen and would like to meet to discuss some Haskell-related stuff, there's
an informal group of people, consisting of me and three of my friends. Let us
know if you'd like to join us in _haskelling_.

[^1]: Let me make one thing clear here. This post is not _against_ other programming languages. I acknowledge Java, Python and Prolog's usefulness. The post is just about emphasizing Haskell's pros. No war intended. 
[^2]: O'Donnell/Hall/Page, _Discrete Mathematics Using a Computer_. 

