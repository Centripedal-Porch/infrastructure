# CentriPedal-Porch/infrastructure

**Contents**

1. [Top-level Repository README](./README.md)
1. [tfstate_backend Infrastructure README](./tfstate_backend/README.md)
1. [centripedalporch.com Infrastructure README](./centripedalporch.com/README.md)
1. [centripedalporch.com Frontend Site
   README](./centripedalporch.com/frontends/www/README.md)

This repository contains complete configurations for all of CentriPedal Porch's
cloud infrastructure.

## Filesystem Hierarchy

The top-level directory contains two key sub-directories:

* `tfstate_backend/` containing the configuration for the S3 backend.
* `centripedalporch.com` containing configs for the root domain itself.

## Secrets Management

**Without exception**, all secrets should exist in AWS Secrets Manager and be
called by the Terraform manifests.

Secrets should be manually update via the AWS CLI, or the AWS console, and
**not** managed by Terraform.

## Software

## Required

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Go](https://go.dev/doc/install)
* [Hugo](https://gohugo.io/getting-started/quick-start)
* [Infracost](https://www.infracost.io/docs)
* [NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* [Python 3.10+](https://www.python.org/downloads/release/python-3100)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Recommended

* [GitHub CLI](https://cli.github.com)
   * [nektos/act](https://nektosact.com)
* [cf-terraforming](https://github.com/cloudflare/cf-terraforming)
* [eslint](https://eslint.org/docs/latest/use/getting-started)
* [mdl](https://github.com/markdownlint/markdownlint)
* [ruff](https://docs.astral.sh/ruff/installation)
* [yamllint](https://github.com/adrienverge/yamllint)

## Setup

Project subdirectories have their own READMEs and setup instructions.

Recurse the directories in this repository and read all documentation before
making changes.

1. Install and configure the [required software](#required).
1. Authenticate to AWS via the AWS CLI utility.
