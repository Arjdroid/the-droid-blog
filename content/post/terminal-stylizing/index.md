+++
draft = "false"
author = "Arjdroid"
title = "Customising a UNIX Terminal"
date = "2022-05-12"
description = "This blog post details the steps I took in customising my UNIX terminals."
tags = [
    "powerusers",
    "commandline",
    "guide",
]
categories = [
    "powerusers",
    "commandline",
    "guide",
]
series = ["Command-Line"]
aliases = ["Customise-UNIX-Terminal"]
image = "myterminal.jpg"
+++

## Introduction

When you spend a lot of your time working on a command line interface, it's pretty important (at least for me) to make sure that you like how your command line looks and that it is an efficient environment that can boost your productivity in your command line workflow.

A customised terminal is unique and brings the personality of the user into the console, highlighting what the user thinks is important, as well as bringing in a little style to stand out from the boring black and white terminals with a single dollar sign line indicator.

There are many ways to go about customising your terminal, from using automated shell scripts all the way to hand editing your `.bashrc` or `.zshrc` files, all depending upon on how much time you want to spend on such a task.

> ### Prerequisites:
> * A UNIX-like terminal interface either on macOS or Linux (no PowerShell but WSL does count as Linux, I'm also not supporting BSD at this time)
> * Some knowledge on working with a terminal interface

## Terminal Emulator

Your first choice is going to be on what terminal emulator you are going to use in order to experience the command line interface. There are many different options depending upon your operating system.

#### macOS

On macOS I've found that the default [Terminal](https://support.apple.com/en-gb/guide/terminal/welcome/mac) application included by Apple is quite the option. It has all the features that modern terminal emulators require, from tabs, to text search, scrolling, and everything in between. I have also found it to be satisfyingly customisable, not just with functionality in terms of changing key macros but also appearance, with it being able to change every coloured item.

I am very happy with the default terminal application, but there are other alternatives available as well.

Take [iTerm2](https://iterm2.com/) for example, it is another macOS focused Terminal Emulator, that is also open source and has a boat load of features. It is very popular and is comparable in terms of customisability. I'd say it is just really dependent on personal preference whether you should go for the default macOS "Terminal" or iTerm2 as they are both really solid options.

One other macOS Terminal emulator that comes to mind is [Alacritty](https://alacritty.org/). It is a very different choice from the others mentioned thus far. Firstly, it is quite a lot less feature packed as the alternatives, it doesn't have many features that others may consider basic such as tabs. All configuration is done via editing of the `alacritty.yml` YAML file rather than a Graphical User Interface. It isn't as "User Friendly" but is extremely customisable and blazingly fast at executing commands due to its GPU accelerated nature providing a noticeable improvement in speed on some machines. It is the least polished Terminal Emulator of the three as it is still considered to be at a beta level of readiness and the developers aren't very "friendly" to macOS as, though they provide a macOS .dmg installer you are required to jump through a few hoops in terms of allowing the software to bypass macOS' Gateway in order to run the software because it is not actually Apple notarized so it has not been certified as "Not Malware" in Apple's eyes.

To install Alacritty you have to go about it via a slightly more "complicated" path of adding a few flags in the brew package manager command, and this is potentially less secure so take that as you will.

Installing alacritty using the [brew](https://brew.sh/) package manager, in my opinion one of the best package managers for macOS although that is a topic for another time.

```
brew install --cask alacritty --no-quarantine
```

There are probably a lot more macOS Terminal Emulators out there but these are the few that come off the top of my head and overall, macOS' very own "Terminal" is my preferred choice.
You can easily find a lot of great colour schemes for the macOS Terminal over here, https://github.com/lysyi3m/macos-terminal-themes it has a lot of my favourites.

#### Linux

There is a great deal more choice in Terminal Emulators on the Linux platform, given that every Desktop Environment and or distribution has its own, I am just going to stick to the few that I know well.

Firstly, GNOME Terminal, included by default with GNOME based distros such as Ubuntu, Pop!\_OS, and Fedora (and even on FreeBSD's GNOME) is a great choice. It is quite a simplistic Terminal Emulator with all the basics that you'd expect such as Tabs, Search and key bind assignments as well as good choice in colour changing.
I would recommend checking out this project; https://gogh-co.github.io/Gogh/ which includes most of the same colour schemes as the other, macos-terminal-themes repository but also support a variety of Linux terminal emulators such as GNOME Terminal, Pantheon Terminal, Tilix or XFCE4 Terminal, and it also supports iTerm2 on macOS.

Alacritty is also available on Linux (and FreeBSD) with much of the same features. I have my own alacritty.yml file on my Github repository; https://github.com/Arjdroid/Terminal-Custom-Configurator which has my preferred colour scheme and configurations although they probably may not be to your liking. I would suggest using the official [Alacritty documentation](https://github.com/alacritty/alacritty/blob/master/docs/features.md) and also their sample [alacritty.yml](https://github.com/alacritty/alacritty/blob/master/alacritty.yml) file which has a guide on how to edit it to your preferences.

These are the only two Terminal Emulators I generally use on Linux as I don't often use other Desktop Environments such as KDE Plasma or XFCE4 as daily drivers.

## Shell Program

The most common shell program found on Linux systems is GNU Bash as it is included by default in most Linux distros. It is quite customisable with tools like [oh-my-bash](https://github.com/ohmybash/oh-my-bash) as well as manually editing your `.bashrc` file (usually located in ~/.bashrc) for which [this]() may be a helpful guide https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/ . It can go quite a long way but it just isn't quite there for me in terms of plugin support.

### Zsh

This is where Zsh comes in. Zsh is a newer, more modern shell program for UNIX-like systems and it is almost, if not fully compatible with bash commands. It is a drop-in replacement. It will be included in almost every Linux distro's package repositories under the `zsh` package name. Zsh is also included in macOS as the default shell program from macOS Catalina onwards so it is almost certain that your macOS computer already comes with Zsh.
I personally prefer and use Zsh due to its customisability, with a lot of plugins and pre-built themes available for it. There are also many Zsh frameworks available to make tuning your Zsh setup more user friendly.

#### Oh My Zsh

Currently I make use of [ohmyzsh](https://ohmyz.sh/) as it is quite a popular open source Zsh framework and it is very convenient to use. It has an automated install script that helps you set it up. I added the ohmyzsh script to my own script, available in my aforementioned repository in order to quickly and semi-automatically deploy my preferred zsh-setup.

You can click the install button on the Zsh homepage to see the command needed to install it, either via `curl` or `wget`:

curl:

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

wget:

```
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Once you install ohmyzsh, you do have to dig in a bit into your ohmyzsh revamped `.zshrc` file. This will be located at the same ~/.zshrc location. The first thing I'd look at modifying is your theme, there are a lot of built-in themes to explore at https://github.com/ohmyzsh/ohmyzsh/wiki/Themes it can be hard to choose a favourite! You can easily switch themes by going into your `.zshrc` and changing the `ZSH_THEME=` variable so, by default it is `ZSH_THEME=robbyrussell` but you could change it to something like `ZSH_THEME=dst` or whatever you choose.

#### Zsh Plugins

Then there are Zsh plugins, this where a big difference is made in usage experience. There are a couple ways to add plugins, either by appending the plugin to your `.zshrc` or to add them via ohmyzsh.

The github organisation [zsh-users](https://github.com/zsh-users) has a lot of repositories containing Zsh plugins. For each plugin they have installation instructions (though they're pretty much identical just replacing the name of the plugin).

For example, one of my favourite plugins is [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting). The installation instructions are on that page which links to https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md where it gives you a plethora of different installation options. I would recommend going for the ohmyzsh method as it is distro-agnostic however, updates can be a bit of a pain in the butt. (maybe I should make an update script to go along with my installation script).

Basically, you clone the plugin's repository into your ohmyzsh plugins directory:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then you must append the plugin name, in this case `zsh-syntax-highlighting` to your plugins list in your ~/.zshrc file so it might be like

```
plugins=(git zsh-syntax-highlighting something-else)
```

Each plugin is separated by a space, no commas or apostrophes.

Another good plugin is [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

And I think that, with this, you are now ready to venture into the crazy world of terminal customisation. And soon you may explore other Terminal Emulators like Konsole and other shell programs such as fish and ash and try to find what you personally enjoy to use.

> Thank you for reading!
