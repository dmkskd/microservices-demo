# Microservices demo

## Overview

This is a microservice test using a container scheduler - kubernetes, on GKE

The application is split into 3 layers:

- frontend (groovy)
- backend (groovy)
- database (postgres)

You can find more info in [k8s/README.md](k8s/README.md)

## Setup

run `./run_demo.sh`

It will perform the following:
- check all the needed tools are ensure_tools_are_installed
  - `gcloud`
  - `kubectl`
- create a k8s cluster using `gcloud`
- deploy the k8s manifests using `kubectl`

Please specify the followings in [k8s.env](k8s.env):
- GKE_PROJECT
- GKE_ZONE

## How to access

[to be defined]

## Cleanup

run `./cleanup.sh`
