# CentriPedal-Porch/infrastructure

This repository contains complete configurations for all of CentriPedal Porch's
cloud infrastructure.

## Filesystem Hierarchy

The top-level directory contains three key sub-directories:

* `tfstate_backend/` containing the configuration for the S3 backend.
* `centripedalporch.com` containing configs for the root domain itself.

## Secrets Management

All secrets should exist in AWS Secrets Manager and be called by the Terraform
manifests.

## Software Requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Go](https://go.dev/doc/install)
* [Hugo](https://gohugo.io/getting-started/quick-start)
* [Node.js](https://nodejs.org/en/download)
* [Python 3.10+](https://www.python.org/downloads/release/python-3100)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Recommended Software

* [GitHub CLI](https://cli.github.com/)
   * [nektos/act](https://nektosact.com/)
* [mdl](https://github.com/markdownlint/markdownlint)
* [yamllint](https://github.com/adrienverge/yamllint)
* [ruff](https://docs.astral.sh/ruff/installation)
