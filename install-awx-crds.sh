#! /bin/bash

VERSION_TAG="2.7.2"
curl -lO https://raw.githubusercontent.com/ansible/awx-operator/${VERSION_TAG}/deploy/awx-operator.yaml
kubectl apply -f awx-operator.yaml
