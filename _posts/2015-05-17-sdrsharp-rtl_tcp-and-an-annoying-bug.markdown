---
layout: post
title: SDRSharp, rtl_tcp and fixing a very annoying freeze bug
date: '2015-05-17 14:29:53 +0100'
---

rtl_tcp is a very convenient way to enjoy <a href="http://www.rtl-sdr.com/about-rtl-sdr/">rtl-sdr</a>. If your workstation isn't located anywhere near where you'd like to have your antenna, then you might consider connecting your dongle to a nearer machine and let your network handle the rest. My current setup has my Discone antenna on the other side of the house, connected to a dongle with a very short cable to cut signal losses and a USB cable all the way inside, connecting to my <a href="https://www.olimex.com/wiki/A20-OLinuXino-MICRO">Olimex Olinuxino A20 Micro</a>. Previously I used a Raspberry PI Model B and it also worked fine. So, boot up your low power machine, run rtl_tcp and connect to it using your software of choice. SDRSharp supports rtl_tcp out of the box with SDRSharp.RTLTCP.dll.

[su_accordion]
[su_spoiler title="RTLSDR Setup" style="fancy"]

[gallery link="file" ids="294,296,295"]
[/su_spoiler]
[/su_accordion]

I've used the word fine in the text above... Well, all of this is fine with the exception of a very annoying freeze bug. Everyone who uses rtl_tcp has seen something like this at least once (video below). I couldn't really say what caused this but I suspected the fault was that rtl_tcp was running in a Raspberry PI, which isn't known for being very fast. I was disappointed when I saw that the bug persisted when running rtl_tcp in my Olinuxino. I noticed that lowering the sample rate at which SDRSharp ran made the freeze bug happen less often, so I could at least get by for a while in most cases.

[su_accordion]
[su_spoiler title="Video" style="fancy"]

[su_youtube_advanced url="//www.youtube.com/watch?v=zy48eE7AYtA" https="yes"]

<span style="color: #ff0000;">**warning: keep your volume low, as the crash is loud**</span>

[/su_spoiler]
[/su_accordion]

<a href="http://www.rtl-sdr.com/sdrsharper-modified-version-sdr/">Earlier this year a fork of SDRSharp saw the light of day, named SDRSharper</a>. It is a reskinned version with an improved layout and with added features. The thing is, SDRSharper heavily violated SDRSharp's license, so, just a few hours after it was released, rtl-sdr.com took down every link in the original article. I was lucky enough to download it and although I found it quite a bit unpleasant to look at, I was very surprised to see that the goddamn freezing glitch which in a good day happened once just every few minutes wasn't happening at all. The freeze bug seems to be in fact a problem in the SDRSharp RTL TCP driver (SDRSharp.RTLTCP.dll). **SDRSharper fixes this really annoying bug, something that SDRSharp has yet to do.**

[su_accordion]
[su_spoiler title="SDRSharper and SRSharp side to side" style="fancy"]
<a href="/wp-content/uploads/2015/05/Screenshot_1.png"><img class="alignnone size-medium wp-image-310" src="/wp-content/uploads/2015/05/Screenshot_1-300x169.png" alt="SDRSharper" width="300" height="169" /></a> <a href="/wp-content/uploads/2015/05/Screenshot_2.png"><img class="alignnone size-medium wp-image-311" src="/wp-content/uploads/2015/05/Screenshot_2-300x169.png" alt="SDRSharp" width="300" height="169" /></a>
[/su_spoiler]
[/su_accordion]

[su_accordion]
[su_spoiler title="SDRSharper RTL TCP" style="fancy"]

[gallery size="full" ids="298,346"]
The configuration dialog for SDRSharper's driver is different from SDRSharp's. It doesn't offer the RTL AGC option, just a choice between manual gain and auto gain which seems to be for RF Gain. This time, the gain setting accepts any value via keyboard input. I prefered the slider, which lets you choose between the supported gain values your dongle has (see **rtl_test**). I'm not sure if this really lets you chose an arbitrary gain value. Another issue that bothers me is that this dialog will lose your settings every time you close SDRSharp(er)[/su_spoiler]
[/su_accordion]

[su_accordion class="do-not-open"]
[su_spoiler title="rtl_test" style="fancy"]

<pre>
$ rtl_test
Found 1 device(s):
 0: Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM
Found Rafael Micro R820T tuner
Supported gain values (29): 0.0 0.9 1.4 2.7 3.7 7.7 8.7 12.5 14.4 15.7 16.6 19.7 20.7 22.9 25.4 28.0 29.7 32.8 33.8 36.4 37.2 38.6 40.2 42.1 43.4 43.9 44.5 48.0 49.6
Sampling at 2048000 S/s.

Info: This tool will continuously read from the device, and report if
samples get lost. If you observe no further output, everything is fine.

Reading samples in async mode...

</pre>

[/su_spoiler]
[/su_accordion]

SDRSharper looks a bit off in my opinion but overall it's not so bad. While SDRSharper's look is a bit off-throwing, the good news is that you can replace SDRSharp's version of SDRSharp.RTLTCP.dll with SDRSharper's. It works perfectly well except with the issues I detailed above. Beware, though, as licensing issues make it illegal to distribute SDRSharper.

A few questions remain in my mind. What causes, exactly, this freezing glitch? And why is a critical issue like is this (I believe rtl_tcp is very relevant to a lot of SDRSharp users) fixed in a license violating fork of SDRSharp, but not yet in the official release of SDRSharp? And finally, does the gain setting in the new SDRSharp RTL TCP driver really work outside of the supported gain values **rtl_test** shows?

I'll update this if I find anything alse after I do some more research on SDRSharper and its RTL TCP driver.
