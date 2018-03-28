#!/bin/bash

set -euxo pipefail

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml