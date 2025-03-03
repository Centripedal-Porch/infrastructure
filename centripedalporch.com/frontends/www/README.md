# www.centripedalporch.com

This directory contains the Hugo configurations for the static (JAMstack)
frontend website at [www.centripedalporch.com](www.centripedalporch.com).

## Software

### Required

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Hugo](https://gohugo.io/getting-started/quick-start) (extended v0.143.0+)
* [NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

### Recommended

Linters:

* [eslint](https://eslint.org/docs/latest/use/getting-started)
* [mdl](https://github.com/markdownlint/markdownlint)
* [yamllint](https://github.com/adrienverge/yamllint)

## Setup

The following commands should be run from
[this (centripedalporch-infra/centripedalporch.com/frontends/www](./) directory.

```sh
git submodule update --init                     # Install the site theme
npm install                                     # Install Nodejs dependencies
hugo --minify                                   # Compile the website
hugo server                                     # Run a local development server
```
