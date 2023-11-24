#! /bin/bash

# This script is designed to run on killcoda lab environment course/fluxcd-course/lab13

echo Deleting existing resource in monitoring namespace

sleep 5

kubectl -n monitoring delete deployment my-kube-prometheus-stack-kube-state-metrics
kubectl -n monitoring delete deployment my-kube-prometheus-stack-operator
kubectl -n monitoring delete sts prometheus-my-kube-prometheus-stack-prometheus
kubectl -n monitoring delete daemonsets my-kube-prometheus-stack-prometheus-node-exporter
kubectl -n monitoring delete deployment my-kube-prometheus-stack-grafana
sleep 10
SERVICE=$(kubectl get svc -n monitoring | awk -F" " '{ if (NR!=1) print $1 }')
for S in $SERVICE; do kubectl -n monitoring delete svc $S; done;

# create awx crds
echo Sleep 5 seconds
sleep 5
kubectl apply -k awx/overlays/crds/

echo Sleep 5 seconds
sleep 5
# Create awx operator
kubectl apply -k awx/overlays/operator/

echo Sleep 5 seconds
sleep 5
# create custom awx secrets
kubectl apply -f awx/awx-custom-cred/


# Create awx deployment
echo Sleep 60 seconds
sleep 60
kubectl apply -k awx/overlays/awx/

echo Finished Deploying

echo Watching resources

kubectl get pod -w -n awx
