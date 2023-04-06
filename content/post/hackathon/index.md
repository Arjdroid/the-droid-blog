+++
draft = "false"
author = "Arjdroid"
title = "Participating in a 24 hour hackathon"
date = "2023-01-23"
description = "My experiences of participating in a 24 hour hackathon."
tags = [
    "programming",
    "hackathon",
]
categories = [
    "social",
    "programming",
]
series = ["Hackathon"]
aliases = ["participating-in-24hr-hackathon"]
image = "coverphoto.jpg"
+++
## Introduction

A little over a month ago, I decided to participate in an upcoming hackathon. For those not in the know, a [hackathon](https://en.wikipedia.org/wiki/Hackathon), sometimes also called a codefest, is an event where people work in teams to rapidly develop a product within a set time limit. They can come in the form of a competition where the goal is for one team to win, or, when hosted by a company, to complete the implementation of a feature in their product.

They are usually 24 hours continuous, but some can span to two or three days.

I have never really had much formal coding experience, mostly just moving around and playing with with things like linux and docker instead, with the ocassional python or shell scripting, as this blog has shown.

This was going to be the first time I did some 'real' programming; I was very excited.

## Advice

I don't want to bore you with the minute-by-minute details so let me just list some advice I wish I knew beforehand as well as advice I thought would be obvious to others but I guess it was not

> * Preparation
> * Equipment
> * Caffeine
> * Focus on the Timeline

### Preparation

This was obviously the most timetaking aspect of the hackathon but also one of the most important. I took the approach that made the most sense to me. I first formulated what I wanted to create for the competition, in my case an Environmentally Friendly Route Planning App. It fit into two of the competition's available themes: Environmental Sustainibility and Transportation.

You should tailor your project towards the requirements of the hackathon, following whatever themes and other specifications they lay out.

#### Tech Stack

I also carefully thought about the tech stack I was going to use. My first choice was to go for a traditional web-app built with HTML + CSS + JS, and I did extensive research over the course of two weeks to ascertain the viability of this. Ultimately, I didn't like the structure as it would branch out to be more complex than I wanted, requiring backend servers and things of that sort, so I instead opted to shift to a mobile app.

This is where I stumbled across [Flutter](flutter.dev). It's a cross-platform open-source framework by Google to develop apps for Android, Linux, macOS, iOS, Windows and the Web all from one codebase. I also compared it to Facebook's [React Native](reactnative.dev) but I preferred flutter so I started work on learning the in's and out's of it.

During this time I also found all the relevant API's I wanted to use (such as OpenWeather and GoogleMapsPlatform) and figured out how they'd fit into my app.

> Settle on a proper tech stack that suits your needs

#### Team Members

My next step was to recruit team members. This was quite difficult as my strategy was quite different from most other teams I saw, which already had a group of friends that formed a team and then came up with an idea.

After screening a lot of potential team members from my school, I narrowed down my list and interviewed until I found a good fit. The max team size allowed was 5 but I kept only 3 members. I initially planned to go solo (most of the winning teams I saw were solo too) but decided that the workload would be more bearable with teammates and it would also be more fun.

> Find people you can work well with, and maintain an agreed upon team structure to avoid unnecessary conflicts

I also had daily meetings with my team members over the 2 weeks before the competition to ensure we were always on the same page regarding things, as well as sharing ideas for our project vision and discussing technological complications

#### Practice

This was especially important for me as I had little previous experience whatsoever with using the Dart programming language (part of Flutter) or even making full-fledged applications in general. Up until then, I had focused primarily on bash and python scripts along with the occasional static website here and there as well as this blog itself. My interests always laid more towards the Linux Administration / Networking side of things.

Over the few weeks before the competition, I focused intensely on mini-projects to learn the in's and out's of the languages and API's I'd be using so I was well versed. I also allotted projects to my teammates to ensure they'd be capable of handling the UI components which is what I'd brought them on for since I didn't want to get bogged down doing UI rather than what I really wanted.

I must've made half a dozen private GitHub repos in that short period of time.

> Practice well and ensure you're thorough with any and all technologies you might use in the hackathon. Mini-projects are great for this as you pick up the exact skills you need / want.


### Equipment

You can't perform your best if your equipment is holding you back. Although most of this might be completely unecessary, and definitely can't compensate for a gap in proficiency, they definitely do make life easier.

One of the simplest pieces of equipment I chose to carry, a **_power-strip_**, turned out to be crucial since we were offered just a single plug point so that 4-plug power-strip was a life-saver and sustained my team throughout the entire competition.

I also brought with me a dedicated **_data dongle_** (a small, portable access point that uses LTE for its uplink) as I was unsure whether the event-provided internet would hold up to my needs (and those of the literally hundreds of other participants). And thank goodness I did because I ended up using it the entire competition.

My **_noise-cancelling headphones_** were also
