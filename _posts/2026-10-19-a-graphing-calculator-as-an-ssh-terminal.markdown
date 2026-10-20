---
layout: post
title: 'A graphing calculator as an SSH terminal'
date: '2026-10-19 20:00:00 +0100'
gallery:
  breadboard:
    items:
      - file: stamp-s3-claude-code.jpg
    classnames:
      - grid-1
  calculator:
    items:
      - file: voyage200-menu.jpg
      - file: screenshot-claude-code.png
    classnames:
      - grid-2
  cardputer:
    items:
      - file: cardputer-wireless.jpg
    classnames:
      - grid-1
---

The TI Voyage 200 is a graphing calculator from 2002 with a QWERTY keyboard, a 240x128 screen and a 2.5 mm link port meant for talking to other calculators and data loggers. A keyboard and a screen are most of what a terminal is, so I wanted to know if the link port could carry the rest. It can. The calculator now runs `ssh` sessions, `vim`, `tmux`, `irssi`, `htop` and even Claude Code, with no physical modifications to it.

{% gallery breadboard %}

### How it works

An ESP32 sits on the link port and does the networking. The calculator only draws text and reads keys. A 13 KB C program, compiled with <a href="https://github.com/debrouxl/gcc4ti">GCC4TI</a>, turns the calculator into a 60x21 VT220 terminal. From its menu you can open:

- **Serial**: a shell on the computer the ESP32 is plugged into, over USB.
- **SSH**: a session to any host over Wi-Fi. The ESP32 stores up to eight hosts and four Wi-Fi networks. It can also generate its own key and copy it to a host, so no password ever has to be typed on the calculator keyboard.

The ESP32 speaks the link port's two-wire handshake itself, bit by bit, and frames the bytes its own way instead of using TI's packet protocol. Every frame is checked, acknowledged and resent if lost, so nothing arrives garbled, not even after replugging the cable. As a bonus, the ESP32 sets the calculator's clock from NTP, and pressing ◆ + APPS sends a screenshot of the calculator to the computer.

{% gallery calculator %}

### Taking it on the road

The ESP32 can be an M5Stack Stamp S3 on a breadboard or an <a href="https://docs.m5stack.com/en/core/Cardputer">M5Stack Cardputer</a>. The Cardputer has its own battery and screen. The calculator runs on its own batteries, so the only cable left is the short one between the two.

{% gallery cardputer %}

### Demos

{% include youtube.html id="XhidNs_AlWg" %}

{% include youtube.html id="JBhirpvVk9g" %}

### Getting there: listening to the link port

Before any of this worked I had to learn what the calculator says on the wire. Those experiments live in a separate repository, <a href="https://github.com/ticklemynausea/ti-voyage-explorations">ti-voyage-explorations</a>, which has two ESP32 sketches:

- **A link partner**: the ESP32 speaks TI's packet protocol and poses as a CBL data logger or another calculator, so TI-BASIC's `Send`, `Get` and `SendCalc` talk to it.
- **A passive sniffer**: the ESP32 sits between two Voyage 200s and records what they say to each other. Twenty captured test sessions make up a write-up of the calculator-to-calculator protocol, down to the timing of each bit. A bit takes about 12.5 µs, and most of that is the sender's code fetching the next bit.

None of this would have been possible without <a href="https://github.com/KermMartian/ArTICL">ArTICL</a>, the <a href="http://tigcc.ticalc.org/doc/link.html">TIGCC documentation</a> and <a href="https://github.com/ewpa/LibSSH-ESP32">LibSSH-ESP32</a>.

The code, wiring and a getting-started guide are at <a href="https://github.com/ticklemynausea/ti-voyage200-term-link">https://github.com/ticklemynausea/ti-voyage200-term-link</a>.
