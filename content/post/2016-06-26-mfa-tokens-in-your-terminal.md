---
title: MFA tokens in your terminal
date: 2016-06-26
tags: [aws, security, mfa]
location: "Munich, Germany"
twitter: true
---

<small><em>All the stuff described here I learned from my dear colleague [Giulio](https://github.com/giuliocalzolari). I'm sharing it here because it's cool, and because I don't think he'd share it anywhere other than our internal mailing list.</em></small>

Do you use MFA a lot? Are you tired of reaching for your phone to check those codes on Google Authenticator app? Perhaps you've been logging to too many different AWS accounts because your work requires that? 😔 Here's a couple paragraphs of advice that will ease your pain.

First, install `oath-toolkit`. On OS X you can get it with [homebrew](http://brew.sh). Once it's installed, you'd want to define a function for your shell, like this perhaps:

{{< highlight sh >}}
function mfa () {
   oathtool --base32 --totp "$(cat ~/.aws/$1.mfa)" ;
 }
{{< /highlight >}}

This specifies an `mfa` alias which calls `oathtool` and expects one argument: name of a file (sans extension) inside your `~/.aws/` directory which contains a string that is the base for computing your [time-based one-time passwords](https://en.wikipedia.org/wiki/Time-based_One-time_Password_Algorithm). To continue the AWS-based example, you can find the code in the AWS console while setting up a new virtual MFA device.

<img class="wide" src="/images/aws-mfa.png" />

Once you click on "Show secret key for manual configuration," you'll be presented with a 64-character string, which you'll need to put in a `~/.aws/account-name.mfa` file. After that, whenever prompted for the MFA token, type `mfa account-name` in your terminal.
