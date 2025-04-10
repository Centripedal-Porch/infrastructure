# CentriPedal-Porch/infrastructure

## Contents

1. [Top-level Repository README](./README.md)
1. [`tfstate_backend` Infrastructure README](./tfstate_backend/README.md)
1. [`centripedalporch.com` Infrastructure README](./centripedalporch.com/README.md)
1. [`centripedalporch.com` Frontend Site
   README](./centripedalporch.com/frontends/www/README.md)

This repository contains complete configurations for all of CentriPedal Porch's
cloud infrastructure.

## Filesystem Hierarchy

The top-level directory contains two key sub-directories:

* `tfstate_backend/` containing the configuration for the Terraform state
   backend.
* `centripedalporch.com/` containing configs for the root domain itself.

## Modules

Custom Terraform modules are sourced from
[`github.com/caseysparkz/infrastructure`](https://github.com/caseysparkz/infrastructure).

The modules themselves are not versioned, but their dependencies are. As such,
you may see dependency conflicts until such a time as the repository itself is
versioned, which will be when I get around to it.

## Secrets Management

**Without exception**, all secrets should exist in AWS Secrets Manager and be
called by the Terraform manifests.

Secrets should be manually update via the AWS CLI, or the AWS console, and
**not** managed by Terraform.

## Dependencies

### Required Software

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Go](https://go.dev/doc/install)
* [Hugo](https://gohugo.io/getting-started/quick-start)
* [Infracost](https://www.infracost.io/docs)
* [NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* [Python 3.10+](https://www.python.org/downloads/release/python-3100)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Recommended Software

* [GitHub CLI](https://cli.github.com)
* [cf-terraforming](https://github.com/cloudflare/cf-terraforming)
* [eslint](https://eslint.org/docs/latest/use/getting-started)
* [mdl](https://github.com/markdownlint/markdownlint)
* [nektos/act](https://nektosact.com)
* [ruff](https://docs.astral.sh/ruff/installation)
* [yamllint](https://github.com/adrienverge/yamllint)

## Setup

Project subdirectories each have their own READMEs and setup instructions.

Recurse the directories in this repository and read all documentation before
making changes.

1. Install and configure the [required software](#required-software).
1. Authenticate to AWS via the AWS CLI utility.
