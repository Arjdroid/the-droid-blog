+++
draft = "false"
author = "Arjdroid"
title = "Encrypting the reMarkable 2 e-Paper Tablet"
date = "2024-06-26"
description = "How I went about setting up file encryption (and many other customisations) on the reMarkable 2."
tags = [
    "remarkable",
    "hacking",
    "security",
]
categories = [
    "hacking",
    "technical",]
series = ["reMarkable"]
aliases = ["reMarkable-Encryption"]
image = "remarkable.jpg"
+++

## Introduction

For the past few months, I've had my hands on the reMarkable 2 e-Paper tablet. The Norwegian company has been touting it as "the world's thinnest tablet" and a revolution in products that help you think.

Now, I won't dive into a full review of it because there are already many of those on the internet but the gist of it is that it is that it lies on that no man's land between a piece of paper and an iPad the appeal of which wholly depends upon what you're looking for; it is barebones, moreso extending paper as opposed to paring down a tablet. Personally, I am still unsure whether it can be an ideal notebook replacement for my use case primarily in School and for projects.

However, it does have one very cool thing going for it: Linux. The operating system is `systemd+Linux` based and has a whole community of people developing tweaks to make the device truly theirs.

As you might see from the cover image (which is styled after reMarkable's own marketing material), I had a list of customisations that I wanted to install.

> **Disclaimer**: Fair warning, these tweaks are pretty extreme and extremely unnecessary. There is also quite significant risk of bricking your device if you choose to follow in my footsteps. Fortunately, there is a [recovery process](https://remarkable.guide/tech/recovery.html#remarkable-2-recovery) for the reMarkable 2. Unfortunately, it does require you to hack some hardware and get pogo pins to interface with the tablet... So, take caution.

If you do happen to have a reMarkable 2 and are happy with it, I would recommend you stay away from messing with it too much. They are focusing on business/executive types that are willing to splurge on that reMarkable Connect subscription and get access to those precious Microsoft Powerpoint integrations without much in the form of on-device disk-encryption. As for tinkerers, they have provided the boon of kernel sources, toolchains and the like, but do not endorse nor cover damage from such modifications.

> Prerequisites: If you are serious about hacking (I use this term interchangeably with tinkering, not to be confused with the unlawful, unauthorised access of computer systems not owned by oneself.) your reMarkable, the first place to start is the [reMarkable Guide](https://remarkable.guide). They have step-by-step instructions I myself followed to configure your device, including setting up SSH keys to interface with it more easily. Only once you are familiar with that interface I would suggest you move forwards.
> Additionally, Linux experience is always recommended for such devices but, for the encryption step specifically you do need a Linux instance that has Docker installed to develop with the toolchain to compile encryption software for the reMarkable. If you have enough docker + Linux experience, you can improvise with macOS and Windows / WSL2 as well although that is not covered here.

### Step 1: Downgrading the OS

My first objective was to step down from a relatively new `3.8` version of the reMarkable software down to `2.11`. The vast majority of 3rd party tweaks and software only work with the `2.x` versions of the reMarkable OS (or more accurately, the main GUI `xochitl`, as we will soon see that the OS is separate). This is not really necessary, unless you want to do exactly what I'm trying. There are also those that claim the `2.x` software also had a more pure writing experience unencumbered by 'zoom' and 'straight lines'.

> Warning: Downgrading from `3.x` to `2.x` results in your previous files being UNREADABLE! Please back them up in a readable format such as PDF or PNG so that you can still access them. I would suggest you use reMarkable's free synchronisation app to do this, and export all your notes / books / pdfs to PDF as a backup as they will be useless after downgrading.

Accordingly, if you only want to dip your toes into lighter, safer tweaks you should stay on the normal OS and look into [reMarkable Connection Utility (RCU)](http://www.davisr.me/projects/rcu/) which is a comprehensive, paid but open source software suite that opens up a lot of tweaks for the reMarkable including its latest versions. You can change things like the splash screens and take backups and more.

To perform this, we will use [https://github.com/Jayy001/codexctl](https://github.com/Jayy001/codexctl). We can go straight to their [Releases](https://github.com/Jayy001/codexctl/releases/) page and download the latest `remarkable.zip` file. We can then transfer it to our tablet via `scp`:

```bash
$ scp ./remarkable.zip root@remarkable:~/
```

Following that, we can unzip it and run it:

```bash
$ unzip remarkable.zip
$ ./codexctl.bin status
```
> Warning: if your current version is `3.11` or higher, you will have to manually download the update file and write it to your reMarkable using `dd`, the instructions for which are in [this](https://github.com/Jayy001/codexctl/issues/71#issuecomment-2099115757) GitHub Issue.

This should do something similar to `uname -a` except it shows the reMarkable OS version. Then, you can perform `codexctl list` to list all available versions and `codexctl install` to install a desired OS version.

In our case:

```bash
$ ./codexctl.bin install 2.11.0.442
```

This downloads and installs the 2.11.0.442 OS version.

### Step 2: Install `toltec`

`toltec` is a package manager for reMarkable, the most popular one in the community. Learn more about it [here](https://remarkable.guide/guide/software/toltec.html).

In order to install it, we must make sure the reMarkable is connected to WiFi then, from our SSH session we can do the following:

```sh
$ wget http://toltec-dev.org/bootstrap
$ less bootstrap
$ echo "b87a085485404d2b000418b8ad44b52edd0293721f61427f2e427555ce9c6975  bootstrap" | sha256sum -c && bash bootstrap
```
Of course, it is unwise to just paste and run a random shell script from the internet so we should go over it a bit at least, hence the `less` command.

If everything looks okay, go ahead with the installation. This can be used later to install a wide array of different community packages, splash screens and other add-ons.

### Step 3: Set up `remarkable-hacks`

[remarkable-hacks](https://github.com/ddvk/remarkable-hacks) by GitHub user [ddvk](https://github.com/ddvk) is a cool set of patches that add functionality to the default reMarkable interface. These are again, not necessary, but for me personally, they serve as a huge quality of life improvement for everyday use with features like better page navigation, gestures, and more choice in marker thickness.

There is yet another 'Automagic' script you can run. Make sure that _WiFi_ is on before running it.

To inspect it you can run:

```sh
wget https://raw.githubusercontent.com/ddvk/remarkable-hacks/master/patch.sh -O-
```
> Pro Tip: You can even ask [ChatGPT](https://chat.openai.com) or your AI Chat model of choice to help you audit these scripts and explain each step to you. Usually, they are a great way to get started though they might get things wrong here and there.

If it looks all correct, you can go ahead and run it:

```sh
sh -c "$(wget https://raw.githubusercontent.com/ddvk/remarkable-hacks/master/patch.sh -O-)"
```

Then, with your USB C cable firmly still plugged into your reMarkable, you can test out the additional capabilities offered by these hacks. If you like them, which I think you will, you should press `CTRL+C` and then press `Y` and `Enter` in your SSH instance to make the changes stick. Otherwise, they will get removed without any permanent change to your device.

### Step 4: Encryption

This is the big fish. One of the larger drawbacks with the reMarkable and most other e-Ink / e-Paper devices is the security of the software. Luckily, one German cybersecurity company [RedTeam Pentesting GmbH](https://github.com/RedTeamPentesting) decided to set up and open source an encryption process for the reMarkable, mainly for their own use case which has a very high level threat model.

As such, this process interferes with a lot of things like cloud backups and normal use of the device, and definitely has a high risk of bricking it. This particular implementation is also not FDE (Full Disk Encryption) like most modern Android devices and the like. Instead, it only encrypts your notebook files. Accordingly, someone could still supposedly `chroot` the device and install some sort of monitoring to steal your password the next time you decrypt it if they have physical access to the hardware and chipset.

Most likely, you should not have to worry about this. If you do, I really hope you have better OpSec than to follow guidance from this amateur blog. This is purely to see _if_ I can have such a thing.

At the time of writing this, the [https://github.com/RedTeamPentesting/remarkable-encryption](https://github.com/RedTeamPentesting/remarkable-encryption) repository has instructions / files that are a bit out of date.

After cloning the repository, you need to make one change:

```bash
$ git clone https://github.com/RedTeamPentesting/remarkable-encryption
$ cd remarkable-encryption
$ $EDITOR Dockerfile
```

After opening the `Dockerfile` in your editor of choice, you need to change the top line FROM
```Dockerfile
FROM ghcr.io/toltec-dev/qt:v2.3
```
TO
```Dockerfile
FROM ghcr.io/toltec-dev/qt:v3.1
```

This works only if your reMarkable software version is higher than 2.9, preferably 2.10. More details about the toltec-dev toolchain docker image [here](https://github.com/toltec-dev/toolchain#version-matrix).

After that, we can follow all the same instructions from RedTeamPentesting's GitHub [Repository](https://github.com/RedTeamPentesting/remarkable-encryption#build), and it should work, ASSUMING YOU ARE RUNNING ON A LINUX DISTRIBUTION AND HAVE DOCKER. I have just put the same commands below:

> WARNING: This process will trigger a 'factory reset' of all notebook / book / pdf files on your reMarkable 2 so PLEASE backup your files. Additionally, it will trigger a reset of the SSH password so you will have to mess around with that a bit again, go back to [remarkable.guide](https://remarkable.guide/guide/access/ssh.html#setting-up-a-ssh-key) and set up your SSH keys for easier SSH access.

```bash
$ docker build -t remarkable-crypto-toolchain .
$ docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/project remarkable-crypto-toolchain make

# on reMarkable 2
$ mkdir -p /home/crypto/bin /home/crypto/fs /home/crypto/lib

# on build system
$ scp dist/home/crypto/bin/* remarkable:/home/crypto/bin/
$ scp dist/home/crypto/lib/* remarkable:/home/crypto/lib/
$ scp dist/etc/systemd/system/cryptodaemon.service remarkable:/etc/systemd/system/
$ scp dist/etc/systemd/system/framebufferserver.service remarkable:/etc/systemd/system/

# on reMarkable 2
$ chmod u+x /home/crypto/bin/*
$ PATH=/home/crypto/bin gocryptfs -init /home/crypto/fs
$ systemctl daemon-reload

# WARNING: after the next step, xochitl (on plaintext home directory)
# won't start by default anymore
$ systemctl mask xochitl --now

# after this step the screen will become blank
$ systemctl enable framebufferserver --now

# WARNING: After entering the password, xochitl will start with the
# encrypted filesystem which is still empty. This means that the
# device setup starts again and A NEW SSH PASSPHRASE IS SET.
$ systemctl enable cryptodaemon --now
```

After all this, you should be done. Another key thing to keep in mind is that since RedTeamPentesting is a German company, they have made the decryption page's keyboard with the `QWERTZ` layout as opposed to the `QWERTY` layout you are likely used to. I don't think there is a way to change this unless you take it upon yourself to learn `Qt` programming and make a pull request of the remarkable-encryption repository to add that keyboard layout.

Now, if you have made it to the end, thank you very much for reading this. I would not really recommend all these tweaks. The reMarkable itself is likely hyped up by the YouTube community. Sure, it is quite a premium device but I'm not all that convinced if this is the best that e-Paper can offer. I think a nice pen like the LAMY Safari or Xiaomi Ballpoint Pen with good paper can be quite a great thinking companion. I have not yet hit that volume of writing where I struggle to organise my life notes as I also use [Logseq](https://logseq.com) and other note taking apps so I do not see the full appeal. I will say that in its default state, the reMarkable is nice for digital markups or drawings on documents, although an iPad, which I do not have, would likely be better.

You may have seen that one last un-checked item on my list is to set-up ddvk's [rmfakecloud](https://github.com/ddvk/rmfakecloud). This is a self-hosted alternative to reMarkable's cloud connect solution. I might, or might not, write about trying to get it running with this encrypted reMarkable setup but until then, adios!

---
