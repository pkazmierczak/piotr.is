---
title: AlphaGo wins with Lee Sedol
date: 2016-03-10
location: Munich, Germany
tags: [ai, google, machine learning]
---

Google [Deep Mind](https://deepmind.com/)'s AlphaGo won [two](https://twitter.com/mustafasuleymn/status/707469083458068480) [games](https://twitter.com/demishassabis/status/707845224731508736) against the world go champion, [Lee Sedol](https://en.wikipedia.org/wiki/Lee_Sedol). This is a *ginormous* triumph of statistical methods in general and machine learning in particular over "symbolic AI."

I remember writing an essay for a class in philosophy some years ago about the progress of AI game engines and the somewhat unimpressive [achievements of Deep Blue](https://en.wikipedia.org/wiki/Deep_Blue_versus_Garry_Kasparov#1997_rematch). It was of course exciting to see a computer beat a reigning chess world champion, but underneath all the heuristics IBM implemented for chess, it was all "brute force." Chess has a [game tree complexity](https://en.wikipedia.org/wiki/Game_complexity#Game-tree_complexity) of 10<sup>123</sup>, which is huge, but still "traversable" by modern computers using good heuristic functions. Go, on the other hand, was deemed unsolvable by any "brute force" methods, because its game tree complexity is 10<sup>360</sup>—far too big. I don't think anyone in 2006 expected that within ten years a computer program will beat the best Go player (I know I didn't), yet it just happened.

And most importantly, it happened in a more, hm, "intelligent" way. AlphaGo doesn't just search the state space, it analyses patterns and *learns* how to play. Again, I cannot stress this enough what an incredible achievement this is for deep learning (aka neural networks). The fact that Google Photos can quickly learn what my photos contain so that I can search for "mountains" even though I didn't tag/categorize anything in my photo library is very impressive. But the fact that AlphaGo can learn patterns of the most complex board game is just mind-blowing.

All this is not to say that logic-based AI is without merit. Yoav Shoham [is right](http://cacm.acm.org/magazines/2016/1/195730-why-knowledge-representation-matters/fulltext) that what he calls "applied philosophy" is an underrated branch of AI these days, but I think the success of machine learning is astonishing in how much it can deliver vs. traditional, logic-based methods, and I don't agree with Shoham when he says that the "the pendulum has swung too far," and that there's too much emphasis on ML in AI research. Given how much ML can deliver, I think the emphasis is well justified.

I, for one, welcome our future AI overlords.

**update, Mar 15, 2016:** AlphaGo [won](https://twitter.com/mustafasuleymn/status/709673935428780032) the match 4:1. 
