# CentriPedal-Porch/infrastructure

This repository contains complete configurations for all of CentriPedal Porch's
cloud infrastructure.

## Filesystem Hierarchy

The top-level directory contains three key sub-directories:

* `tfstate_backend/` containing the configuration for the Terraform backend
   (S3).
* `modules/` for Terraform modules.
* `centripedalporch.com` containing configs for the root domain itself.

## Secrets Management

All secrets should (eventually) exist in AWS Secrets Manager and be called by
code.
