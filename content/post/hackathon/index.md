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

> ### Outline
> * Introduction
> * Preparation
> * Actual Process & Struggles
> * Wisdom Gained
> * Outlook

## Introduction

A little over a month ago, I decided to participate in an upcoming hackathon. For those not in the know, a [hackathon](https://en.wikipedia.org/wiki/Hackathon), sometimes also called a codefest, is an event where people work in teams to rapidly develop a product within a set time limit. They can come in the form of a competition where the goal is for one team to win, or, when hosted by a company, to complete the implementation of a feature in their product.

They are usually 24 hours continuous, but some can span to two or three days.

I have never really had much formal coding experience, mostly just moving around and playing with with things like linux and docker instead, with the ocassional python or shell scripting, as this blog has shown. 

This was going to be the first time I did some 'real' programming; I was very excited.

## Preparation

Before even looking for a team, I started to prepare my ideas. There was a wide variety of available themes, but I settled on Transporation as my main theme with the sub theme of Environmental Sustainibility.

### Ideas

My app idea had been lurking in the back of my head for a while, having watched many Youtube videos relevant to the topics of transportation and environmental sustainibility, but after some brainstorming and discussing with my friends (its very important to discuss with someone else to get an outside perspective) I settled on an app that would help users be more environmentally friendly by suggesting the most environmentally friendly mode of transport to them.

Additional features of the app, like tracking monthly greenhouse gas emissions and allowing users to purchase carbon offsets were thought of later in the preparation process, but only after actually settling on the base idea.

After that, I also settled on a technology stack upon which I would develop the application.

### Tech Stack

Since I wanted a cross-platform, primarily mobile application, [Flutter](https://flutter.dev) was the obvious choice, especially as I was very new to mobile app development and development in general. The documentation and tooling available for Flutter and Dart is first-class, and I was able to pick up on it very quickly, especially thanks to tons of random Youtube tutorials on how to implement the features I desired.

When I say tons, I truly mean it: hours and hours of videos to absorb as much knowledge as quickly as possible. I think this was really key in the preparation process, after having watched and practiced so many tutorials, I had a much firmer grasp of how I wanted to go about making my app; what API's I might want to implement, what U.I structure I want to follow, how I might store and update different parts of the app.

### Teammates

In contrast with learning the tech stack, finding teammates was more difficult than I thought. Most of my friends that I would have normally turned to were already part of the hackathon's organising committee. Thankfully, after a lot of searching, rejecting, rejections and a little perseverance, I was able to find the right fit.

It's very important to be sure you get along well with your teammates so that you can work more effectively, without heavy conflict. Your team's structure should also be well defined, especially in larger teams, with an explicitly defined leader or explicitly defined equality, to avoid confusion and conflict later on.

In my case, the maximum number of team members allowed in the hackathon was five, but I stuck with a tighter bunch of only 3 (including myself). 

Having a smaller team can be both, a blessing and a curse. Namely, a smaller team is more agile, and can usually work quicker as collaboration and division of work is simpler. The main disadvantage in comparison to a larger team is that there are less people to actually do the work, so each team member has a larger workload and less can be done. A well-managed large team can significantly outperform a smaller team but managing well is something a lot of teams struggle with.

One thing I noticed in my particular (high-school level) hackathon was that the teams shortlisted for the final round and especially the teams that actually won awards were almost always small. There were many more teams with 1 or 2 members among the finalists than teams with 4 or 5 members. This was in contrast with the average team size which leaned more towards 3 or 4.

The moral of the story is to make sure you have teammates you can rely upon, and that you can divide work across your team properly, ensuring no one gets in each other's way and that everyone can handle their workload.

### Quirks

One quirk of my team in particular was that my teammates, although slightly familiar with programming languages like Python and JavaScript, were similarly unfamiliar with Flutter and Dart. As such, I had to teach them the basics (while also learning them myself). 

Having walked them through the lengthy installation process and troubleshooting any issues, I assigned each of us a miniature project to complete over the course of 1 week before the hackathon. We also held meetings daily, to catch each other up with our progress.

I believe this kind of project-based learning was also very important for us, as it gave us a goal that we had to work towards, and kinda forced us to figure out a way to do it.

Our projects were focused on what compartments of the project we'd be working on, so that we'd have at least some basic experience before diving off the deep end.

Apart from just discussing the tech stack, we also discussed other parts of the project, like new ideas. Things like adding a social / friends page where users can see their friends' progress and adding the ability to specify what type of car you use were among the features that stemmed from our meetings. 

One of the first orders of business in our first meeting was just coming up with a name. After much deliberation, we finally settled on greenifyTransit. The camelCase naming convention was something that we all really liked, and we moulded our team names to try and fit within that.

## Actual Process and Struggles

On the day of the hackathon, we started off with high spirits, and a plan to stick to. I insisted that all of us get a good amount of sleep, 8 hours at minimum, to ensure we'd be well rested off the bat.

### Git

Something I somehow forgot that we were going to use git and as such, had not fully familiarised my teammates with the [git control system](https://git-scm.com/) apart from making sure they all had GitHub accounts.

Thankfully, I myself was already somewhat familiar with most aspects of Git and I had all the software already installed on my Mac but I still had to guide my teammates through the basics and through installing all the required software. I set up my public repository and added my teammates as collaborators.

We had made a roadmap of all the features we wanted to implement, and who would do what, so our work process was pretty streamlined and there wasn't much confusion.

### Audits, Schedule and Scope

We were given a schedule of all the different audits with a vague description of the criterion and expectations for each audit, with a total of 4 audits in the 24 hour period.

We set our sights towards getting a skeleton application started for audit 1. Since we were still quite inexperienced with git, after figuring out how to all work on separate branches, we all worked on a very divergent branches.

This would come to bite us later.

We split up the tasks such that I would handle the backend API calls and logic of the app while my two teammates would solely work on the frontend and different pages of the app.

Progress started off slowly and we had a little bit of a reality check regarding our scope which we now felt was quite ambitious but nevertheless, we chugged along.

### The (not so) Great Merge

Our next task was to simply merge the branches, resolving conflicts and making sure secrets like API keys wouldn't magically surface.

This proved to be harder than I thought.

The main problem was the unreliability of our internet connection. The organisers offered WiFi access but it was extremely slow due to the hundreds of participants relying on a measly single uplink. My choice to stick to my phone's hotspot wasn't necessarily that much better, given that signal was spotty, resulting in a lot of frustration.

Trying to merge branches on [github.com](github.com) was an exercise in patience (or a lack thereof). It would taunt me with a perpetually rotating circle loading animation as it looked through the files for merge conflicts. After waiting aeons, I would finally get the chance to revolve the conflicts, clicking on the big green 'Merge' button, only to be told that something went wrong with my internet connection and I had to start the whole process over again.

After having this occur a painfully large number of times I gave up for now, and we kept working on our separate branches.