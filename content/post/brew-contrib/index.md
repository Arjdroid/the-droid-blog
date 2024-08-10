+++
draft = "true"
author = "Arjdroid"
title = "My first pull request"
date = "2024-08-10"
description = "My journey attempting to contribute to the homebrew repository"
tags = [
    "oss",
    "homebrew",
    "scheme",
]
categories = [
    "oss",
    "technical",]
series = ["Homebrew"]
aliases = ["Homebrew-Contrib"]
image = "commit.png"
+++

It all started a few months ago when I ventured into the famous [Wizard Book](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html). The dialect of lisp used to teach within it is the venerable `mit-scheme`. There was just one problem: where's the interperter?

My first instinct, as a resident of macOS, was to search within homebrew. This did yield the package I was looking for, albeit deprecated. It seemed that for the past x days, it could only build on error. When attempting to install, it complained about compiler and left without much fanfare. Attempting to install the same homebrew package on my Linux machine proved no problem, though it used the same version of gcc as my mac, or so I thought.

Hopping on the GNU website for the package, it was a pleasant surprise to find the old interpreter had received updates as late as 2022, well into the existence of Apple Silicon. In fact, Apple Silicon was mentioned by name on the website. They had a special tarball, a universal `svm1` architecture that should compile on any posix-compliant system.
