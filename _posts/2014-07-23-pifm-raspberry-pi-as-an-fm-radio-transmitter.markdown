---
layout: post
title: 'PiFM: Raspberry PI as an FM radio transmitter'
date: '2014-07-23 13:10:17 +0100'
---

I tried out the awesome raspberry pi fm transmitter hack and made a video of it.

It's quite simple. The only requirement is a random piece of wire connected to GPIO pin no&ordm; 7 to serve as an antenna. I used regular wire connected to a jumper that fits on the GPIO pin. The software used is of course open source <i class="fa fa-heart"></i>. I used a lenght of about 70cm but&nbsp;you can optimize the length based on the frequency you're transmitting to achieve maximum reach. Beware though, as unlicensed transmissions are illegal.

{% include youtube.html id="HWuNODzZBx0" %}

I tested the transmission using the FM radio receiver on an old mp3 player and my RTLSDR setup, with the receiving&nbsp;antenna a good 15m away from the&nbsp;transmitting antenna. Quite a good reach for a random piece of wire.

[su_list icon="icon: sign-in"]

- <a href="http://www.icrobotics.co.uk/wiki/index.php/Turning_the_Raspberry_Pi_Into_an_FM_Transmitter">Turning the Raspberry Pi Into an FM Transmitter</a>
- <a href="http://makezine.com/projects/make-38-cameras-and-av/raspberry-pirate-radio/">Raspberry Pirate Radio</a>
- <a href="http://www.instructables.com/id/Raspberry-Pi-Radio-Transmitter/">Raspberry Pi Radio Transmitter by Cody Heiser</a>


[/su_list]

One thing I did notice and that you should be careful of is that after the pifm program terminates, it will continue transmitting noise on the selected frequency. I'm sure this can be patched but the only method I tested that stops this from happening is turning off the raspberry PI or start transmitting in another frequency.
