#!/usr/bin/env bash

set -e

function ensure_tools_are_installed
{
  echo "*** Ensure tools are installed"
  command -v kubectl || { echo >&2 "'kubectl' not installed"; exit 1; }
  command -v gcloud || { echo >&2 "'gcloud' not installed"; exit 1; }
  echo "All tools are installed !"
}

function create_k8_cluster
{
  echo "
*** Creating k8s cluster using gke

No version is specified as versions in gke are rapidly changing
and by the time this script is run any fixed version may not exist
anymore. So let's google pick up a good default for us (currently defaultClusterVersion: 1.10.9-gke.5)

Current versions can be displayed with:

gcloud container \
  get-server-config \
  --zone europe-west2-c'
"
  gcloud container clusters create "$GKE_CLUSTER_NAME" \
    --machine-type="$GKE_INSTANCE_TYPE" \
    --project="$GKE_PROJECT" \
    --zone="$GKE_ZONE" \
    --num-nodes="$GKE_NUM_NODES"
}

function deploy_k8s_manifests
{
  echo "Deploying k8s manifests"
  kubectl apply -f k8s/
}

function main
{
  source "k8s.env"
  ensure_tools_are_installed
  create_k8_cluster
  deploy_k8s_manifests
}

main "$@"
