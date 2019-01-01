# Kubernetes resources

## Postgres

Simple StatefulSet

## Backend

Groovy based backend, using a script defined in [backend-configmap.yaml]([backend-configmap.yaml)

Startup time is quite high (about 1 min) as groovy dependencies are loaded at startup and not baked into the docker image.

## Frontend

Groovy based frontend, using a script defined in [frontend-configmap.yaml]([backend-configmap.yaml)

Startup time is quite high (about 1 min) as groovy dependencies are loaded at startup and not baked into the docker image.
