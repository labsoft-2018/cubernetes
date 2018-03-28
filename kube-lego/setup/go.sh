#!/bin/bash

set -euxo pipefail


function k () {
  kubectl apply -f "$1"
}

export LEGO_EMAIL="rafael.correia.poli@gmail.com"
k namespace.yaml
# ConfigMap (please setup you KUBE_LEGO EMAIL before deploying)
k config-map.yaml
# RBAC objects
k service-account.yaml
k cluster-role.yaml
k cluster-role-binding.yaml
# Deployment
k deployment.yaml