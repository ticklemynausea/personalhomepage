---
layout: post
title: 'Almondbread: a Mandelbrot set explorer'
date: '2021-09-25 20:00:00 +0100'
gallery:
  overview:
    items:
      - file: 1.jpeg
    classnames:
      - grid-1
  details:
    items:
      - file: 2.jpeg
      - file: 3.jpeg
      - file: 4.jpeg
      - file: 5.jpeg
      - file: 6.jpeg
    classnames:
      - grid-2
---

*Mandelbrot* is German for almond bread, hence the name. <a href="https://almondbread.ticklemynausea.net/">Almondbread</a> is a Mandelbrot set renderer that runs in the browser, on an HTML5 canvas. You can explore the set's endless detail until you hit the limits of JavaScript floating point numbers.

{% gallery overview %}

### Features

- **Mouse and keyboard controls**: drag a rectangle to zoom into it, and stretch the view horizontally or vertically.
- **Colour palettes**, picked at random from <a href="https://coolors.co/">coolors.co</a> and linearly interpolated across iteration counts.
- **Shareable views**: the render configuration lives in the query string, so the URL in the address bar takes anyone to the same view.
- **Parallel rendering**: the image is split across web workers to squeeze out some extra performance.
- **Download** the current view as an image.

{% gallery details %}

### What's missing

It's a work in progress. On purpose, it refuses to run on mobile and shows a blocking screen there instead of an unusable experience, so touch support is the next priority. Very heavy renders can still crash the browser tab, although reloading the page produces the right result. I'd also like to try an arbitrary-precision math library to zoom past the point where 64-bit floats give up. And the palettes could use some more thought, since some of them produce much nicer images than others.

Try it at <a href="https://almondbread.ticklemynausea.net/">https://almondbread.ticklemynausea.net/</a>. The code is at <a href="https://github.com/ticklemynausea/almondbread">https://github.com/ticklemynausea/almondbread</a>.
