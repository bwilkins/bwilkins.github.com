---
layout: post
title: "Wouldn't It Be Awesome If..."
date: 2016-07-16T12:34:20+10:00
tags: [electronics]
---

#### a.k.a Research, Development and Scope-Creep

This is part 2 in a series of posts about a little electronics project I started at work. [You can find the first post here.]({% post_url 2016-07-11-i-couldnt-do-that-could-i %})

---------------------------------------

As said in my previous post, I wanted to build a device to show financial goals or the company's financial milestones. I wanted this to be visible from across the room, so it had to be big... what could I use that would fit the bill?

<img src="/images/split_flap_display.jpg" alt="Split Flap Display">

Have you ever seen those large old boards at some airports or other travel ports that make a whole lot of clacking noise? You know, the ones that physically turn over a set of cards until it gets to the right number? They're called Split Flaps, and are (quite obviously) a mechanical device that can be electrically driven/controlled. Each character you want to display is split in half across two flaps, and a ring of flaps is flipped around until the desired character is displaying at the front. This can be driven by a stepper motor. Those would be sweet as to get running and have some numbers displayed on... If only they weren't about $100 apiece for a single module! There are some resources online about how to build them, but I'm not about to endeavour on a journey to learn the intricacies and mechanics of a split-flap display when mechanics is probably my weakest area of expertise. Also, thinking about it now, that noise would have been SOOO obnoxious. Split-Flaps: Scratched.

<img src="/images/alarm_clock.jpg" alt="Digital Alarm Clock">

So my mind went to alarm clocks - digital alarm clocks specifically. I personally think that the seven-segment displays on alarm clocks give numbers a much more tactility than just being put up on a monitor, and they're relatively easy to find, so let's follow this path some more!

Jaycar, a massive hobbyist/electronics chain here in Australia and NZ, stocks these displays in a few different sizes. I wanted this display to be seen from across the office, so naturally this meant big - how big can you get? Having a nosey around the Melbourne CBD Jaycar store, I grabbed a couple of 2.3" large displays, and a couple of driver ICs for them, all for the purposes of testing and determining if they were going to be the right tool for the job.

I spent almost a full day trying to figure out the pin-out of the displays I bought! It didn't help that I was trying to use a 5V source, and after a bit of... "study" (RTFM/RTF Datasheet) I discovered that each of the main elements had 4 LEDs in series to light it up. In a bit of a hail-mary effort to try and get this thing to light up I pulled out a 9V battery and started feeding that in and once I found ground, hey presto, it works!

<img src="/images/it_works.jpg" alt="It's working!">

As it turns out, each of the main elements (segments) of the display used 4 LEDs in series (2 for the decimal point). Each of these LEDs was contributing a 1.8V voltage drop, summing up in series to 7.2V, which explains the failure of the 5V source to light anything up! During this period of discovery I think I also burnt out the dot on one of the displays, but that's ok, it was all in the name of research!

I'd like to mention at this point that the "driver" IC is actually what's called a "BCD decoder," or "Binary-Coded Decimal decoder." It takes 4 inputs A, B, C and D, each coresponding to the numbers 1, 2, 4 and 8. With any combination of these numbers you can make any decimal number, which the decoder decodes and sends out through it's 7 outputs, which earch correspond to a segment on the seven-segment display. Some BCD decoders have slightly different input schemes, such as A=1, B=2, C=2 and D=4, which prevents you from giving it input that it can't display. The decoders I have just blank out the display when the number if is given doesn't fit within the range of 0-9.

This idea seemed to have some legs, so I thought I'd move ahead with this and see how it plays out. I ignored all the problems that were surfacing in my head, such as power consumption, how I'd power it, how I'd control it, etc. Those were problems for another day!
