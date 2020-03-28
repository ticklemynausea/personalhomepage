---
layout: post
title: Adventures with Software Defined Radio
date: '2013-11-14 16:17:33 +0000'
gallery:
  packaged-antenna:
    title: Packaged antenna
    items:
    - file: 2013-10-28-13.05.10.jpg
    - file: 2013-10-28-13.09.10.jpg
    - file: 2013-10-28-18.38.12.jpg
    classnames:
    - grid-3
  mounting-antenna:
    title: Mounting the antenna
    items:
      - file: 2013-11-14-09.05.39.jpg
      - file: 2013-11-14-09.05.48.jpg
      - file: 2013-11-14-13.49.46.jpg
      - file: 2013-11-14-13.50.58.jpg
      - file: 2013-11-14-13.51.03.jpg
    classnames:
      - grid-3
  rojoes:
    items:
      - file: rojões-à-moda-do-Minho.jpg
      - file: rojões-à-moda-do-Minho.ogg
        type: audio
    classnames:
      - grid-2
      - grid-align-left



---

A well known hack with DVB-T dongles based on the Realtek RTL2832U chip is that they may be used for more interesting purpose than watching the four free television channels we have here in Portugal: a really, really cheap software defined radio. This is known as *RTLSDR*.

I really liked the idea of tinkering around with this, so I purchased an <a href="http://www.ebay.com/sch/i.html?_nkw=ezcap+dvb-t&amp;_sacat=0">ezcap USB 2.0 DVB-T/DAB/FM </a>dongle from ebay for under 10&euro;. It's always a gamble since you don't know which tuner your dvb dongle will use, but luckily mine is a Rafael Micro R820T, which <a style="font-size: 16px; line-height: 1.5;" href="http://sdr.osmocom.org/trac/wiki/rtl-sdr">supports a whopping 24 - 1766 MHz</a>.

The antenna that is bundled with the dongle sucks. It didn't do much for me besides picking up standard FM radio. In some conditions it even failed to do what it was built for: picking up DVB-T. Soon it became clear that I needed a better antenna if I was thinking of going anywhere. Some research taught me that there are dozens of types of antennas, each with their intended purposes. For example, the <a href="http://www.g4ilo.com/qfh.html">*QFH antenna*</a> is ideal for picking up satellite and aircraft signals. There's also *discone antennas*, exceptionally wideband antennas that are fit for many different purposes. I did consider building one, but since I'm not very crafty I ended up <a href="http://www.rms.pt/p/69/discone-d1000ph">ordering it</a>.

This antenna supports a whopping 25 to 1300 MHz range. In theory, this lets me play with a lot of stuff there is out there in the airspace, digital and analog communications like trunked radio, packet radio and aircraft communications. It will be useless for shortwave radio though, which is pretty interesting. But this is sort of a moot point since the range of the RTLSDR dongle is a almost out of the shortwave range (about 3 to 30 MHz). It's nice that the range of frequencies the dongle covers isn't limited by the range of frequencies the antenna picks up, but this doesn't mean it will pick up everything with quality because Discone antennas are good at picking up vertically polarized radio signals.

{% gallery packaged-antenna %}

{% gallery mounting-antenna %}


The antenna works best when outside, so I had to improvise a little. Pulling cable from the antenna to my computer was not a possibility, so I just the plugged the dongle into a Raspberry Pi, and plugged the Pi into my network. Although it is a bit slower than a direct USB connection, it performs quite well in its SDR duties (using <a href="http://sdr.osmocom.org/trac/wiki/rtl-sdr">rtl_tcp</a> as a server and <a href="http://sdrsharp.com/">sdr#</a> as a client).

I'll leave the results of my tinkering to future posts, but here's a little something I picked up, probably an ham radio or truck driver expressing his love for Portuguese cuisine. I can't blame him, it's a really good dish.

{% gallery rojoes %}

Also, I used the word dongle a lot in this article.

`lol dongles ;-)`

