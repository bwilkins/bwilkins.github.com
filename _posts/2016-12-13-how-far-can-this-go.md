---
layout: post
title: "How Far Can This Go?"
date: 2016-12-13T20:54:54+11:00
tags: [electronics]
---

#### actually, pretty far.

This is part 3 in a series of posts about a little electronics project I started at work. [You can find the first post here.]({% post_url 2016-07-11-i-couldnt-do-that-could-i %})

Some time has passed between the writing of the last post and this one. I will endeavour to keep things in an approximately correct chronological order.

---------------------------------------

At the end of the last post, I had a project that had legs, but how far can it go?

I'm not sure when I got the idea, or what I had originally thought of, but I knew I wanted an installation that would be relatively permanent. The previous electronics project I'd worked on ([the build light](http://hooroo.github.io/blog/2015/03/31/arduino-build-light/)) was pretty sketchy, pretty much just a small Arduino-compatible, a NeoPixel ring and a proto-board. And to be fair, that was holding up pretty well, in it's little plastic box on the wall. But this new project was going to something else. I was going to have to step up my game.

<img src="/images/rough_measurements.jpg" alt="Rough Measurements">

I downloaded EAGLE, a free-to-use, but otherwise proprietary CAD tool for designing Printed Circuit Boards. (This kind of tool might also be called an "EDA", for "Electronic Design Automation"). I decided I would design a board to house one of the 7-segment displays, the decoder and other supporting circuitry.

But how was I going to get the data out to multiple displays? Directly driving all those decoder inputs, while being fewer than the segments themselves, was going to get very unwieldly, very quickly. I'd already had this idea in my head that I wanted to be able to chain these things on to each other, and there existed just the thing to do that - the humble Shift Register.

Luckily I had a shift register lying around from an Arduino Getting Started kit from Sparkfun, so I took advantage of using that to test that this would work... and of course, it did! So now I had these decoders that took 4 bits of data each, and shift registers that could handle 8 bits... What else could I do? Given a 5V signal source, which the shift register effectively was, I could directly drive the decimal point on the individual displays... I could even drive the individual Output Enable pins on the decoders themselves, wouldn't that be great?

But then I got stuck on something - the dimensions of the individual display units themselves were pushing the design size out past the lowest price point available from the company I had chosen for printing the boards - and I'd chosen them because they were both affordable and reliable. I'd had suggestions from a friend to build the circuit on a smaller board and connect to the end of the display with a wire harness, but I decided that it would be better to ensure that the displays had the support of a rigid board from end to end. In for a penny in for a pound, why not put two displays on one board? It wasn't going to change the cost after this latest decision, and so it was!

Since I was now going with two displays, I threw out the ideas around driving the decimal points at all, and also individually controlling the Output Enable pins. Two sets of four binary-coded-decimal bits fit perfectly into the  eight bits of a single shift register, so that was just going to have to do. After iterating on the design for a while, I sent the board off for printing (exciting!) and a few weeks later, having selected the cheap option to shipping, I received my first ever Printed Circuit Boards that I had designed myself!

<img src="/images/many_like_them_but_these_are_mine.jpg" alt="My First PCBs!">

There's a certain feeling having something like these in front of you for the first time. I remember a giddy feeling, being almost unable to wait to get home and add the components to the board! That time was going to have to wait, because the boards beat the parts to delivery.

<img src="/images/the_parts_arrived.jpg" alt="The parts have arrived">

After about a week, the parts arrived from element14 and I was able to get going! I was so excited to finally have everything, I had to build one! Finally, around midnight, I had my first display board completely built.

<img src="/images/display_board_back.jpg" alt="Display board Back">

<img src="/images/display_board_front.jpg" alt="Display board Front">

That wasn't the end of it, though. For some reason, a couple of elements weren't behaving as expected. It turned out that two elements were switched - lighting up when the other should have been - and I couldn't just change it in code because I had a hardware decoder sitting in there decoding my (correct!) decimal values. Sadly, I'd gotten something wrong in the schematic diagram - actually, I'd like to blame whoever designed the schematic part in Eagle for the BCD decoder, witness:

<img src="/images/fault_of_the_other.png" alt="Confusing Eagle part">

As you can see, the F and G pins on U2/CD4511BE (the BCD decoder) are flipped! I wasn't about to go and get this reprinted - thankfully the fix for this was pretty simple.

<img src="/images/easy_fix.jpg" alt="Crossed Resistors">

With that, I set out to complete the rest of the boards.

<img src="/images/building_the_rest.jpg" width="600" height="450" alt="Building the remaining boards">

<img src="/images/all_displays_finished.jpg" width="600" height="450" alt="The finished displays">

I'd like to mention another problem I had to overcome - I wasn't going to be able to just throw 9V at whatever logic was powering this thing and expect it to come out the other end unscathed. Previously I had been using an Arduino, sending 5V signals to the BCD decoders. In order to get anything to display I had to power the decoders separately with 9V batteries, but doesn't that sound a bit dangerous for the Arduino, or whatever else might take it's place in the future?

Since the signals on this board only travel in one direction, I was pretty comfortable with the idea of using plain ol' transistors as level shifters. From studying how transistors work, I prototyped on a breadboard and assured myself that this would work. Effectively, transistors can be used to take a low voltage input and produce a higher-voltage output. The only problem is that the transistor inverts the signal being input - so a LOW input signal will come out as HIGH, and vice versa. Luckily, this is easily fixed in the Arduino code!

Stay tuned for my next update, where I talk about maybe controlling this chain of displays with something other than an Arduino!

