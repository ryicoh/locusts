#! /bin/bash

gcloud beta container clusters create locusts \
  --cluster-version=1.12.7-gke.17 \
  --node-version=1.12.7-gke.17 \
  --default-max-pods-per-node=110 \
  --enable-autorepair \
  --enable-autoupgrade \
  --no-enable-cloud-logging \
  --no-enable-cloud-monitoring \
  --enable-ip-alias \
  --enable-autoscaling \
  --image-type=COS_CONTAINERD \
  --disk-size=10gb \
  --machine-type=f1-micro \
  --node-labels="name=default-pool" \
  --num-nodes=3 \
  --max-nodes=3 \
  --min-nodes=1 \
  --region=asia-northeast1-a \
  --preemptible

gcloud beta container node-pools create gvisor-pool \
  --cluster=locusts \
  --node-version=1.12.7-gke.17 \
  --enable-autoupgrade \
  --enable-autoscaling \
  --image-type=COS_CONTAINERD \
  --sandbox=type=gvisor \
  --disk-size=10gb \
  --machine-type=g1-small \
  --node-labels="name=gvisor-pool" \
  --num-nodes=3 \
  --min-nodes=0 \
  --max-nodes=100 \
  --region=asia-northeast1-a \
  --node-taints=gvisor=true:NoSchedule \
  --preemptible
