---
layout: post
title: Raspberry PI - FUN with leds and switches
date: '2014-07-16 16:39:48 +0100'
---

In the spirit of learning more about circuits and electronics I made a few experiments with my PI, a breadboard and a bunch of leds. Each led is directly controlled by a single GPIO pin.

This one is quite simple, as it cycles 5 leds on/off periodically.

[su_accordion]

[su_spoiler title="video" style="fancy"]
[su_youtube_advanced url="//www.youtube.com/watch?v=2wyFodNcwwM" https="yes"]
[/su_spoiler]
[su_spoiler title="code" style="fancy"]
[gist id="ticklemynausea/d980b6c9f10d01f062ed"]
[/su_spoiler]

[/su_accordion]

This one cycles 7 leds on/off at the push of a tactile switch. I actually had to learn a bit more for this one, since switches must operate on a logic principle implemented by something called <a href="http://en.wikipedia.org/wiki/Pull-up_resistor">pull-up resistors</a>. These can be implemented with componentes on a physical circuit, but the PI's <a href="https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/robot/cheat_sheet/">GPIO has a logical implementation</a>.

[su_accordion]

[su_spoiler title="video" style="fancy"]
[su_youtube_advanced url="//www.youtube.com/watch?v=eHU8O13QDcE" https="yes"]
[/su_spoiler]
[su_spoiler title="code" style="fancy"]
[gist id="ticklemynausea/95f97485ada5b47693ca"]
[/su_spoiler]

[/su_accordion]

The next step would be to learn about multiplexing techniques as to lower the high requirement of GPIO pins (one per led). I'm yet to venture into that, though...
