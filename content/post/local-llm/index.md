+++
draft = "false"
author = "Arjdroid"
title = "Running a Local Large Language Model (AKA Local AI ChatBot) PART ONE"
date = "2024-01-11"
description = "This is blog post details my journey in setting up and running an (LLM) large-language-model on my very own computer in order to have my own alternative to ChatGPT"
tags = [
    "ai",
    "llm",
    "gpt",
]
categories = [
    "ai",
    "technical",]
series = ["AI"]
aliases = ["Local-LLM"]
image = "llama2-on-mac.png"
+++

## Introduction

I'm sure that over the past year you've heard a _LOT_ about AI, ChatGPT, and maybe something called a Large Language Model.

Well, the underlying technique with which we've had a lot of recent advances in AI, resulting in the offerring of such powerful tools like [ChatGPT](https://chat.openai.com), [Perplexity](https://perplexity.ai), etc. has been the Large Language Model.

If you're really curious, and have the time (~1 hour) to really get down to some details about how these models work and how we use them, I _highly_ recommend you watch this [YouTube Video](https://youtu.be/zjkBMFhNj_g?si=AHkn0iOyrgwREBNK)

Additionally, you can also watch the Royal Institute's [video](https://www.youtube.com/watch?v=b76gsOSkHB4) which is more of a general opener rather than very many technical details.

However, in today's blog post we're just jumping straight into how we can get started actually running some models on our very own systems!

## Prerequisites

* A computer running either Linux or macOS (Windows users have other options not covered in this Blog Post)
* Decent hardware (It says at least 8GB RAM to run the smallest models), but you can also expand by having more RAM, faster CPUs and a discreteGPU
  * In this post I'm demonstrating it on an M1 MacBook Air, so anything in that ballpark or faster should be good to run the most basic stuff.
* A lot of storage available, at least 50GB to be comfortable

> For this demonstration, I am showing `ollama` running on an Apple M1 MacBook Air with an 8 core CPU, 8 core GPU, 16GB RAM and 512GB of Storage.
>
> I have also tested `ollama` running on a Fedora Linux system with 16GB RAM, an AMD Ryzen 7 3700X, and an Nvidia GeForce RTX 3070 with 8 GB VRAM. Future blog posts will be on this system.

## Starting Off

For this project I'm going to be using the [ollama](https://ollama.ai) tool. It makes the whole thing _very_ simple, because it's almost plug and play, while still allowing you to have a lot of control and customisation. 

It supports GPU acceleration (if you have it), running a local API (so that you can use the model with a GUI interface instead of the command line), etc.

And the best thing? It's completely open source!

### Installation

You can go to the ollama website [https://ollamai.ai](https://ollamai.ai) or their GitHub [https://github.com/jmorganca/ollama](https://github.com/jmorganca/ollama)

And follow the basic instructions from there

On a Mac, it's quite simple as you just need to install their Application file (which has been Apple Notarised so there's less worry about sketchy software too) and then you have access to the `ollama` command in your terminal.

> Note: you do have to trust the application and give it administrator / root access

Once you've done that, you're ready to go!

They recommend you start off with the base, 7 billion parameter `llama2` model and you can do that with:

`ollama run llama2`

And there you have it! You can talk to it, ask it questions, even write some code.

However, once you eventually get bored with that, you should start looking at other models, with different purposes.

I'd suggest taking a look at `mistral` as it's similarly lightweight and quite responsive, as well as _so many more!_

You can check out the [ollama library](https://ollama.ai/library) to see all sorts of different options. But remember, larger models require more RAM and or more VRAM to run.

### Tidbits

I pasted all the above contents of the blog post into the llama2 model and asked it to conclude the post, here's what it said:

Running a local LLM can offer several advantages, such as faster response times, greater 
control over the model's training data, and reduced latency compared to using cloud-based 
models. By running our own LLMs, we can also explore new use cases and applications that are 
not yet possible with existing models.

Pretty good!

## Up Next
Right now, I'm on a delivery of new RAM modules to upgrade my PC so that I can run larger models like `mixtral` and `llama2:70b` as they promise to be a lot more powerful.

Upcoming blog posts in this series will detail the differences between these kinds of models, as well as some more exploration like setting up a nice web ui to interface with them more comfortably and from more devices on the network!

I also want to learn about different kinds of tests they use to evaluate the performance of these models and run them myself to compare the results.

>> See you next time

---