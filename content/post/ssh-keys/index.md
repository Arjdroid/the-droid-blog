+++
draft = "true"
author = "Arjdroid"
title = "Why You Should Use SSH Keys"
date = "2022-12-29"
description = "This blog post explains why I think everyone should use SSH keys for authentication."
tags = [
    "security",
    "networking",
    "homelab",
]
categories = [
    "security",
    "homelab",
    "networking",
]
series = ["Networking"]
aliases = ["SSH-Keys"]
image = "ssh-key.jpg"
+++

## Introduction

Remote linux server administration is a task that, in my experience, relies heavily on the use of `ssh` or [Secure Shell Protocol](https://en.wikipedia.org/wiki/Secure_Shell).

I think most people who have used a linux server like the [Raspberry Pi ](https://www.raspberrypi.com/) has used `ssh` in its most basic form:
```
ssh pi@ip.ad.dre.ss
```
Such use of the `ssh` command usually prompts the server to request a password from the user in order to authenticate them and allow them to access the server.
