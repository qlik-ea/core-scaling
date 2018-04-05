#!/usr/bin/env bash

cd "$(dirname "$0")"
set -e

kubectl create -f ./namespaces.yaml
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud info | grep Account |  awk -F'[][]' '{print $2}')
kubectl create -f ./prometheus
kubectl create -f ./custom-metrics-api
kubectl create -f ./ingress
