#! /bin/bash

helm repo add awx-operator https://ansible.github.io/awx-operator/

helm repo update

helm search repo awx-operator

helm pull awx-operator/awx-operator

helm template awx-operator awx-operator/awx-operator --version 2.7.1 -f values.yaml --no-hooks --include-crds --output-dir awx/base/

cd awx

kubectl apply -f base/awx-operator/crds   # If not already applied

mv base/awx-operator/templates/* base/

kustomize build overlays

kubectl apply -k overlays