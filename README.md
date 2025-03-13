# the_droid_blog-source_files

TODO:
- Update or move to a new theme, the current instance is too out of date, keep having to remove deprecated bits and hope the website continues to render + I don't really have an understanding of the theme
- Finish the following posts that are brewing:
  - outline-vpn
  - typst
  - distro hopping
  - text editors
  - mechanical keyboards
  - coffee

Currently, my blog is just a small folder of thoughts, though over time it may mature into something more.

This repository is meant to contain the source files used to construct my [blog website](https://arjdroid.github.io). The site is built with [hugo](https://gohugo.io), a tool that takes Markdown files as input and uses them, along side a theme, to generate multiple static html pages within a master directory that can be used as a static website.

## Choice of Architecture

These static pages, generated with the [hugo engine](https://gohugo.io), are very flexible in terms of their appearance and the devices which they can be viewed upon. The specific hugo theme which I have used, is [stack](https://themes.gohugo.io/hugo-theme-stack/).

I plan to use a more bespoke and tenable solution in the future as relying on others' themes is not optimal for the health of the website, and disallows me from easily implementing desired features and design changes.

## Usage

```bash
# clone repository
git clone https://github.com/Arjdroid/the-droid-blog

# move to repository
cd the-droid-blog/

# start dev server
hugo server
// Won't work right now because
// many parts of the theme's instance are deprecated, including the structure itself
```

## Publishing Changes

There is a github actions workflow that deploys this site onto github-pages after generating the static site files with a Hugo instance.
