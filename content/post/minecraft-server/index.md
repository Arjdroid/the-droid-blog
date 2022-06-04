+++
draft = "false"
author = "Arjdroid"
title = "Hosting my own Minecraft Server with Docker on Linux"
date = "2022-06-04"
description = "An article that details how I hosted my own Minecraft Server using the Docker Engine."
tags = [
    "minecraft",
    "gaming",
    "networking",
    "homelab",
]
categories = [
    "gaming",
    "homelab",
    "networking",
]
series = ["Minecraft"]
aliases = ["Minecraft-Server"]
image = "minecraft-server.png"
+++

> **Disclaimer**: This guide is a general overview, please also do additional research before following. If you plan on using this article as a guide for setting up your OWN minecraft (Java Edition) server, **PLEASE** read the entire article before going through with this process (It may help clear any doubts you have as well as ensure that you can go through with this process). Also, do remember that **I AM NOT RESPONSIBLE** for any damage that YOU may cause to yourself or your own hardware including, but not limited to: bricked devices, dead SD cards, thermonuclear war, or you getting fired because the alarm app failed. YOU are choosing to make these modifications, and I provide no guarantees of any sort.
>
> **This guide is slightly advanced and not recommended to those unfamiliar with using Linux**

## Introduction

The idea of running my own Minecraft server for me and my friends first came to me after watching countless online videos of people playing on Minecraft SMP's (Survival-Multi-Player), I wanted to be able to collaborate with my friends on glorious builds and finding boatloads of diamonds (to turn into netherite of course).

There are a lot of different Minecraft server hosting options, some even being free of cost, but the free ones were not of the best experience, though one can't really complaing when it's free...

I wanted a better experience, with a more fine-tuned control over the settings and have better server performance. Although this is much more advanced than using a paid, dedicated Minecraft hosting service.

## Prerequisites
 * A usable server (basically any computer, from a desktop to a laptop to a Raspberry Pi, a [Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine), or a cloud server on something like *Google Cloud Platform*)
 * Decent Specifications (to handle around 5 simultaneous players):
   * Atleast a dual core 64bit processor (any modern Intel Core CPU or AMD Ryzen CPU), or a Raspberry 4 (I'm not sure how well a 3 would hold up)
   * As much RAM as possible, atleast 4GB, more is preffered
   * 8+ GB of *free storage*, because you want to take a LOT of backups of your world. Even though a really large world on its own may be at a max of 4GB if it's humongous (you will never realistically reach this on your home server because if your world is going to be visited by hundreds or thousands over the span of years, you should really be looking at more professional solutions with better uptime / support), it will usually be a couple hundred MB.
 * Any Linux distro (Ubuntu Server is very usable or Raspberry Pi OS Lite if you're on a Pi)
 * A valid Minecraft Java Edition License (to be able to play on your server!)
 * A working brain

I myself will be using a dual core (hyperthreaded) amd64 virtual machine with 8GB of RAM assigned to it, running the server Linux distro Ubuntu. (If you use a distribution such as Arch Linux or Fedora or CentOS or OpenSUSE, the package commands will be quite different for you, please look up official instructions for those distributions.)

**This guide assumes that you have already installed and setup your Linux distribution upon your server, whatever it may be, and that the server is connected to the internet and up-to-date and that you have access to its command line (either via SSH or via a keyboard + monitor)**

 > **If you have not set up your Linux distribution yet, you will need to do so** via the official instructions provided by its website.
 >
 > Usually it is a very straightforward installation process. I would recommend using the linux distribution Ubuntu Server.
 >
 > You can follow Ubuntu's official installation documentation at https://ubuntu.com/tutorials/install-ubuntu-server

## Docker Engine Setup

If you already have docker installed on your system, please skip ahead to the next section, "Setting Up The Minecraft Server"

We will be using the [containerization](https://www.ibm.com/cloud/learn/containerization) engine known as Docker, this allows us to separate the application (Minecraft Server) from the rest of the operating system, making the application more portable (the environment is identical in each and every docker instance) and possibly more secure by isolating the application from the rest of the system as well as greatly easing the installation process.

Installing Docker is very simple, simply follow the instructions laid out at [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/). It has instructions for all certified compatible systems. Just look at the table they give, and click on the tick-mark ✔️ which corresponds to your system, for my example, I'd click on the tick for "Debian x86_64/amd64".

> I am including the instructions for my specific configuration, it may differ from the instructions you require, so please check the [official documentation](https://docs.docker.com/engine/install/) to be sure. As always, read instructions CAREFULLY before following!
> #### Sidenote: Docker officially support use on the following Linux Distributions
>  * Ubuntu / Debian (x86_64, arm64)
>  * Fedora / RHEL (x86_64, arm64)
>  * Raspbian (arm32-bit, and soon the new arm64 OS aswell)
>  * CentOS (x86_64, arm64)
>  * If you are using Arch Linux, you should follow the [Arch Wiki guide to using Docker](https://wiki.archlinux.org/title/Docker) as it is not officially supported by Docker, but community maintained.

The button leads to a webpage containing all necessary instructions such as uninstalling any old versions present:

`
sudo apt-get remove docker docker-engine docker.io containerd runc`

It is most likely that, as you are on a fresh install, apt-get will report that none of these packages are installed or even been heard of (in it's default repositories).

I will be following Docker's recommended method of installation, which is to configure apt (Ubuntu's package manager) to use Docker's private repositories for easily manageable installs, there are other, more advanced methods which may suit specific needs, but for our purposes, this method is the simplest.

To copy commands quickly you can double click the command to select the full line before pressing CTRL + C (or Command + C) to copy the line.

First we must update our package repositories:

`
sudo apt update`

Then install some dependencies required for adding Docker's repositories.

`
sudo apt install ca-certificates curl gnupg lsb-release`

After that you have to actually add Docker's official GPG key (used to verify Docker's repository) to Ubuntu Server's keyring:

`
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

Then you need to choose which Docker repository you are going to add, in this case I'm choosing __stable__ which is almost always the desired option.

`
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

Then, to actually install the latest version of Docker Engine, you need to update your repositories:

`
sudo apt update`

Then install the following packages:

`
sudo apt install docker-ce docker-ce-cli containerd.io`

To verify that Docker Engine is installed correctly, run the __hello-world__ image:

`
sudo docker run hello-world`

It should give an output similar to this:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

You can try out its advise to run a proper Ubuntu container as well with the command `docker run -it ubuntu bash` though keep in mind that this will eat up a couple of gigabytes of valuable storage which you may not have to spare because it creates a new docker container and it downloads the ubuntu image from docker's hub.

> Tip:
>
> You can delete old containers and images that you are no longer using via the following commands:
> To delete an old container you must first know the name or the id of the container
> ```
> $ sudo docker container ls -a
> CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS   NAMES
> aaa7aab55ac1   hello-world   "/hello"   5 minutes ago   Exited (0) 5 minutes ago           eager_haibt
> 5f4294d34628   ubuntu        "bash"     4 minutes ago   Exited (0) 4 minutes ago           modest_banzai
> ```
> Suppose I want to delete
