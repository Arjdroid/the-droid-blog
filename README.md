# the_droid_blog-source_files

This repository is a repository meant to contain the source files that I will use in order to construct [my blog website](https://arjdroid.github.io). My website is constructed using the [hugo website construction engine](https://gohugo.io), a tool that takes .md files as input and uses them, along side a theme, to generate multiple static html pages within a master directory that can be used as a static website.

## Choice of Architecture

These static pages, generated with the [hugo engine](https://gohugo.io), are very flexible in terms of their appearance and the devices which they can be viewed upon. The specific hugo theme which I have used, is [gruvbox](https://github.com/schnerring/hugo-theme-gruvbox) with slight modifications to make it more to my liking.

## Usage

```bash
# clone repository
git clone https://github.com/Arjdroid/the-droid-blog

# move to repository
cd the-droid-blog/

# install dependencies
npm i

# start dev server
hugo server
```

## Publishing Changes

> Note: Current build process is yet to be automated with GitHub Actions

```bash
# remove the old public/ directory
rm -rf public/

git submodule add https://github.com/Arjdroid/arjdroid.github.io/ public/

# build the website
hugo

# move to submodule
cd public/

# push changes
git add ./*

git commit -S -m "Updated blog"

git push origin main
```

# TODO:

- Fix `hugo.toml` configuration, links to About, Blog, and CV.
  - Fix `hugo.toml` [module] mounts as they are throwing errors and are potentially related to the above
- Change background colour to be less harsh; contrast
  configuration in `hugo.toml` doesn't seem to work, at least as how I'd expect it to.
- Finish this Rehaul of The Droid Blog, currently incomplete and non-presentable
- Implement Hugo CI / CD Pipeline via GitHub Actions
