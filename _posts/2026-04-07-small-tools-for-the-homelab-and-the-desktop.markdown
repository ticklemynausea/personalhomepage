---
layout: post
title: 'Small tools for the homelab and the desktop'
date: '2026-04-07 20:00:00 +0100'
---

Not every project needs a post of its own. Here are some smaller ones from the past few months.

### netkill

Something is holding port 3000 and you want it gone. <a href="https://github.com/ticklemynausea/netkill">netkill</a> signals every process with a socket bound to a given TCP or UDP port or host:

```
netkill 3000 8080
netkill UDP:50000
netkill my.frontend.local my.backend.local localhost:9999
netkill -s 15 UDP@my.service.local:15000
```

It sends `SIGKILL` unless told otherwise.

### docker-logtailer

fail2ban wants log files. Docker containers write to stdout. <a href="https://github.com/ticklemynausea/docker-logtailer">docker-logtailer</a> bridges the two. It watches Docker events, runs `docker logs -f` for every running container, writes each one to its own file on the host and cleans up when containers stop. The repository includes a logrotate config and an example fail2ban filter and jail that catch scanners, floods of 404s and failed logins against nginx.

### nginx-ssh-tunnel-proxy-docker

Some services should only listen on loopback, like a Netdata dashboard on a remote box. Sometimes I still want to reach one through my usual <a href="https://github.com/nginx-proxy/nginx-proxy">nginx-proxy</a> stack, with a proper hostname, Let's Encrypt and basic auth. <a href="https://github.com/ticklemynausea/nginx-ssh-tunnel-proxy-docker">nginx-ssh-tunnel-proxy-docker</a> is a container that opens `ssh -N -L` to the remote host and puts nginx in front of the tunnel. supervisord runs both and restarts the tunnel when the connection drops. Host key checking stays strict.

### WindowPilot

<a href="https://github.com/ticklemynausea/WindowPilot.spoon">WindowPilot</a> is a <a href="https://www.hammerspoon.org/">Hammerspoon</a> Spoon that covers the window management I want on macOS:

- keyboard window switching,
- tiling layouts (BSP, main and stack, halves, threes, cascading, fullscreen),
- moving windows to screen edges and between screens and spaces,
- moving the mouse cursor between screens,
- a hotkey for each app I use every day.

All of the key bindings can be changed in `init.lua`, and a help overlay lists the current ones.
