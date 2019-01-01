#!/usr/bin/env bash

set -e

function ensure_tools_are_installed
{
  echo "*** Ensure tools are installed"
  command -v kubectl || { echo >&2 "'kubectl' not installed"; exit 1; }
  command -v gcloud || { echo >&2 "'gcloud' not installed"; exit 1; }
  echo "All tools are installed !"
}

function delete_k8_cluster
{
  echo "*** Delete gke cluster $GKE_CLUSTER_NAME"
  gcloud container clusters delete "$GKE_CLUSTER_NAME" \
    --project="$GKE_PROJECT" \
    --zone="$GKE_ZONE"
}

function main
{
  source "k8s.env"
  ensure_tools_are_installed
  delete_k8_cluster
}

main "#@"
