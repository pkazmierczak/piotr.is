---
date: 2020-05-11T00:00:00+01:00
aliases:
- /2020/05/11/over-tinkering/
location: Amsterdam, Noord-Holland
title: "Over-tinkering"
---

The other day I've been looking at a Raspberry Pi 4 that's been laying around,
thinking of what to do with it. I quickly googled around [how
to](https://pimylifeup.com/raspberry-pi-afp/) setup
[AFP](https://en.wikipedia.org/wiki/Apple_Filing_Protocol) on it, so that I
could put it by the router, connect all the portable hard drives and just use
it as my “stash drive” from any device in the house. A tiny NAS-like thing.

I quickly realized there were some problems with my hard drives, namely that
they all used different filesystems, so I spent a couple of hours (oh yeah)
juggling data between them, formatting them onto reasonable file systems that
both Linux and macOS can easily read, and setting them up as mount points for
[Netatalk](http://netatalk.sourceforge.net/) to serve. I then started exploring
other options for my photo library, which I was managing with iCloud at the
time. I remembered that I strongly preferred Google Photos for cataloguing and
managing albums and shares, so I figured perhaps it'd be a good opportunity to
move all my photos there, and perhaps explore a backup system? You know, _a
backup for my backup_, some software that fetches photos from Google Photos
periodically (say, daily), puts them on one of the Pi's external volumes for
[rclone](https://rclone.org/) to later pick up and store safely on
[b2](https://www.backblaze.com/b2/cloud-storage.html). That's when the clock
showed midnight and my wife asked why wasn't I going to bed yet.

This kind of mental process, the _down-the-automation-rabbit-hole_ thing, I do
it a lot. And I bet the routine might be familiar to many software engineers.
We're
[tinkerers](https://web.archive.org/web/20100304155732/http://diveintomark.org/archives/2010/01/29/tinkerers-sunset),
we like to hack on things. It's why Emacs exists, and why people still
sometimes (try to) use Linux on the desktop.

There's of course nothing wrong with hacking or tinkering, but particularly in
the case of personal projects, _over-tinkering_ leads to losing time, and
ultimately losing focus. I abandoned a lot of projects because I ended up
working on the perfect setup of my tools, or on automating tasks that are yet
to come. For a while now I tried to detect and stay away from situations in
which my natural instinct for coming up with convoluted solutions could thrive.
I switched from vim to VS Code, because it requires less customization and
still works very well for me (also
[this](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)). I
gave up my iPad-plus-fifty-hacks for a simple Macbook that just does the job. I
didn't follow through with moving my photos library over to Google, it stays
where it is, because ultimately I just want my photos in one place and I don't
need the hassle.

I ended up having more time to read books and articles that make me think, and
when I don't feel like it, more time to spend with friends or riding my bike.
Think about it whenever the urge to move your personal website over from
WordPress to a tailored solution you're gonna write in Clojure strikes you.

