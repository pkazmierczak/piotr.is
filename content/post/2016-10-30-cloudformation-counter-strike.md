---
slug: cloudformation-counter-strike
date: 2016-10-30T23:31:23+01:00
location: "Munich, Germany"
tags: ["aws", "cloudformation", "automation", "gaming"]
---

I spent an evening writing [a cloudformation template for Counter Strike Global Offensive linux server](https://gist.github.com/pkazmierczak/07bcc42d829411dcb4f8525562567228). No, I don't have a life. Yes, you will thank me next time you play with your friends and the laptop cannot handle more than 5 players. (AWS `t2.micro` handles 6 players easily, and you can always throw a `c4.large` at the problem which is still about $0.13/hr and handles, well, just about anything).

The template sets up a single EC2 instance of type `t2.micro` by default, uses the default VPC, and runs the server with "Arms Race" game in a free-for-all mode. Consult Valve's [documentataion page](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers) if you want to run other games or reconfigure the server in any way. The template also sets up a CNAME record pointing to the instance's public DNS name, so comment the last section out if you don't have a public hosted zone in your Route53.

Happy shooting!
