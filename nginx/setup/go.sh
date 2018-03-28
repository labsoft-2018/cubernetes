#!/bin/bash

set -euxo pipefail


function k () {
  kubectl apply -f "$1"
}

k namespace.yaml

echo "Configuring certificates"
# kubectl create secret tls tls-certificate --key /etc/ssl/private/nginx-selfsigned.key --cert /etc/ssl/certs/nginx-selfsigned.crt --namespace=cru
# kubectl create secret generic tls-dhparam --from-file=/etc/ssl/certs/dhparam.pem --namespace=cru

echo "General config..."

k default-backend.yaml
k config-map.yaml
k tcp-services-config-map.yaml
k udp-services-config-map.yaml

echo "Using RBAC Roles"
k rbac.yaml

k nginx-ingress-controller.yaml

echo "AWS Specific config - using layer 4 (transport)"
k service-layer-4.yaml
k patch-config-map-layer-4.yaml