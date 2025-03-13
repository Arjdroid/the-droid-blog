+++
draft = "true"
author = "Arjdroid"
title = "Hosting Outline VPN on Oracle Cloud (Free)"
date = "2024-12-15"
description = "This post outlines how I went about hosting an outline vpn instance on Oracle Cloud's free tier"
tags = [
    "vpn",
    "networking",
    "security",
]
categories = [
    "networking",
    "technical",]
series = ["VPN"]
aliases = ["Outline-VPN"]
image = "remarkable.jpg"
+++

## Introduction

As VPNs have become more popular and well-known, you may have been bombarded by advertisements promoting many paid VPN services, especially one that rhymes with 'chord'. There are also many free alternatives offered by corporations with large bandwidth offerrings such as Cloudflare and Google. However, there are many advantages (and disadvantages) to the use of a self-hosted virtual private network service.

The first thing one should always take into account when evaluating such security tools is their threat model. An average person is not likely to be targetted by state actors trying to log their activities. Similarly, a person that is a target is likely not going to be well protected by a consumer VPN product, especially one that does not even claim to not take logs. One of the many purported threats is the stealing of passwords when using public WiFi. This, of course, is a moot point given the prevalence of SSL-encrypted connections.
