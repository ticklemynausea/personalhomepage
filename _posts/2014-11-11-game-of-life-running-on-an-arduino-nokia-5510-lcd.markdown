---
layout: post
title: Game of Life running on an Arduino + Nokia 5510 LCD
date: '2014-11-11 23:59:01 +0000'
---

Conway's <a href="http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life">Game of Life</a> is a zero-player game created by british mathematician <a href="https://en.wikipedia.org/wiki/John_Horton_Conway">John Conway</a>. It looks pretty good on Nokia LCD displays, so I ended up implementing it on the Arduino/Nokia LCD&nbsp;as an exercise to consolidate what I've learned and to learn a few things more also. The circuit doesn't really need to be so messy with so&nbsp;many resistors&nbsp;(It needs to have voltage dividers so that the 5v arduino output can feed the 3.3v LCD input) as they can be replaced by a single IC converter&nbsp;chip, but I never got around to change this.

<a title="Github Repo" href="https://github.com/ticklemynausea/lcd5510-game-of-life">Source code @ GitHub</a>

[su_accordion]
[su_spoiler title="Pics" style="fancy"]

[gallery link="file" ids="254,255,256"]
[/su_spoiler]
[/su_accordion]
[su_accordion]
[su_spoiler title="Video" style="fancy"]
[su_youtube_advanced url="//www.youtube.com/watch?v=Wo4l_F5Bznw" https="yes"]
[/su_spoiler]
[/su_accordion]
