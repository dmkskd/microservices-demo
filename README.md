# Microservices demo

## Overview

This is a microservice demo using a container scheduler - kubernetes, on GKE

The application is split into 3 layers:

- frontend (groovy)
- backend (groovy)
- database (postgres)

You can find more info in [k8s/README.md](k8s/README.md)

## Prerequisites

The demo runs on GKE.

### GCP and gcloud
An GCP account is required and [gcloud](https://cloud.google.com/sdk/install) should be correctly configured on your system.

To check the currently configured gcp account:

`gcloud config list`

The gcp user needs also permissions to create gke clusters.

### kubectl

Ensure [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) is installed

## Setup

Please specify the followings in [k8s.env](k8s.env):
- GKE_PROJECT
- GKE_ZONE

run `./run_demo.sh`

It will perform the following:
- check all the needed tools are ensure_tools_are_installed
  - `gcloud`
  - `kubectl`
- create a k8s cluster using `gcloud`
- deploy the k8s manifests using `kubectl`

## How to access the frontend

The `frontend` is exposed as an ingress (creating a Google Load Balancer for us).

A Google Load Balancer takes several minutes to be instantiated and globally propagated.

Although is reported as up an running, it may give errors for few minutes.

You can also access the frontend by using a proxy with:

`kubectl port-forward service/frontend 5050:80`

And point your browser to http://localhost:5050

## Cleanup

To remove the cluster:

`./cleanup.sh`
