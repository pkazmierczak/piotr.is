---
date: 2021-08-12T00:00:00+01:00
title: The Deceptive PR Behind Apple’s “Expanded Protections for Children”
location: Amsterdam, NH
locations: ["Amsterdam"]
tags:
- apple
- iphone
- privacy
slug: /apple-csam
aliases:
- /2021/08/12/apple-csam/
nocomment: true
---

My wife is pretty tech-savvy. While not a software engineer and not a computer scientist, she has a good understanding of computing technologies, statistics, formal methods, and an intuitive (but quickly growing) grasp of machine learning. She's also able to code in R for [her research](http://karolinakrzyzanowska.com/), and she's highly addicted to her iPhone 12 Mini, her iPad Pro, and her 12" MacBook, despite its slowly but steadily failing keyboard. With all this being said, I spent about 30 minutes yesterday evening trying to explain to her, what's all the fuss about Apple's new CSAM (child sexual abuse material) prevention [features](https://www.apple.com/child-safety/) that are being introduced in iOS 15.

The point of the anecdote is of course not to show that my wife is dim, but rather to illustrate the issue with said CSAM features. In contrast to how easy it is to explain to "an average Joe" why Google's or Facebook's business models pose a threat to people's privacy, it's very hard to explain why Apple's new mechanism is even worse.[^1]

{{< aside >}}
{{< /aside >}}

I don't want this blog post to be an exhaustive explanation of what exactly Apple is planning to do, because many [other](https://stratechery.com/2021/apples-mistake/) [excellent](https://www.hackerfactor.com/blog/index.php?/archives/929-One-Bad-Apple.html) [articles](https://daringfireball.net/2021/08/apple_child_safety_initiatives_slippery_slope) have already been written about it over the last week. In essence, iOS 15 will introduce a mechanism that allows for checking user's photographs against a CSAM content database, and this will happen *on the device*. That's the big difference between Apple's approach and what every other company that hosts big libraries of photographs online has been doing for a while now. A paragraph from [Ben Thompson's article](https://stratechery.com/2021/apples-mistake/) that was published yesterday sums it up pretty well:

> (…) instead of adding CSAM-scanning to iCloud Photos in the cloud that
> they own and operate, Apple is compromising the phone that you and I
> own and operate, without any of us having a say in the matter. Yes,
> you can turn off iCloud Photos to disable Apple's scanning, but that
> is a *policy* decision; the *capability* to reach into a user's phone
> now exists, and there is nothing an iPhone user can do to get rid of
> it.

You could of course say that it's "a slippery slope" sort of argument, and that we should trust Apple that it won't use the functionality for anything else.  Setting aside the absurdity of trusting a giant, for-profit corporation over a democratically-elected government, we should bear in mind that Apple's record here is much less stellar than they'd like us to think. The company is already cooperating with the Chinese government, e.g., by storing [personal data of Chinese citizens](https://www.nytimes.com/2021/05/17/technology/apple-china-censorship-data.html) only on servers run by a Chinese company, and has previously cancelled their plans for iCloud backups encryption under [the pressure of FBI](https://www.reuters.com/article/us-apple-fbi-icloud-exclusive-idUSKBN1ZK1CT).  Apple released an [FAQ document](https://www.apple.com/child-safety/pdf/Expanded_Protections_for_Children_Frequently_Asked_Questions.pdf) yesterday in which it tried to clarify and address the issues, but if anything, they confirmed what we all assumed to be true: that the only thing stopping any government agency or other malicious actor from substituting some other image hashes (e.g., photographs of homosexual couples in countries where homosexuality is illegal) for CSAM, is Apple's internal policy. The technology that would allow that to happen is already there.

![](https://pbs.twimg.com/media/DwGoq2uV4AA_Aov?format=jpg&name=large "Those [posters](https://twitter.com/chrisvelazco/status/1081330848262062080) won't age well, will they.")

In the world of computer security this technology has a name, it's called "a backdoor." A well-documented and well-intended backdoor, but still a backdoor.  Installed and enabled by default on millions of devices around the world.

So why on Earth would Apple, a company that's been building a brand as privacy-protecting over the last few years, go for such a solution? And why now?

The hypothesis that I have is that Apple wishes to distance itself from checking users' data. They've been fighting with the FBI and the federal government for years, they've been struggling with not reporting CSAM content to the [NCMEC](https://www.missingkids.org), they don't want to be involved in any of this anymore. They want to create a situation in which they could offer end-to-end encryption for iMessage, iCloud Drive, iCloud Photo Library and iCloud Backups, and at the same time remain compliant. This might be the only way to have your cake and eat it, too, in fact. And it gets better: due to how the mechanism is implemented, Apple will never see the actual user data. It will only know whether there's a match against the data on the phone and the data on the server, so in its own marketing campaigns they can still claim to respect the user's privacy. And if this mechanism ever gets used for anything else, they can always claim that they are simply complying with local regulations, and that they themselves neither censor nor even look at the data on their users' phones.

Sadly, due to the intrinsically technical nature of the problem, which I mentioned in the first paragraphs of this article, I believe the public will buy it, and during the next public Apple event Tim Cook will triumphantly announce some privacy-enhancing features, like protecting your personal data against cross-app tracking or offering VPN-like, anonymized connection for Safari or Apple Mail. All this, while there's a backdoor installed on your phone, and you can do nothing about it.

* * * * *

It pains me as a self-proclaimed Apple fanboy, a loyal customer of many years and even an evangelist of the brand to see the company making a step in such a dangerous direction.[^2]

I can only hope that the backlash caused by [the screeching voice of the minority](https://twitter.com/Snowden/status/1423751484081070081), will make Apple nonetheless reconsider, and perhaps change the implementation in future versions of iOS. 

<small>
<a href="https://news.ycombinator.com/item?id=28160673">Discussion on HackerNews.</a>
</small>

[^1]: Actually, as I was working on a draft of this post, Matthew Green and Alex Stamos wrote [an op-ed in the New York Times](https://www.nytimes.com/2021/08/11/opinion/apple-iphones-privacy.html) that makes a good attempt at trying to concisely explain the issue to a non-technical audience. There's hope.
[^2]: The worst part is: how do I put my money where my mouth is? Am I going back to using Linux on the desktop (2022 will be the year of Linux on the desktop, remember), debugging wifi drivers and tirelessly trying to make resume-from-suspend work? Am I getting a Pixel and putting GrapheneOS on it like a total nerd? FUCK.