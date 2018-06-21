#!/bin/bash

for s in zookeeper broker1 broker2 broker3; do
  kubectl create -f ${s}-service.yml
done

for p in zookeeper kafka1 kafka2 kafka3; do
  kubectl create -f ${p}-app.yml
done

echo "-------"
echo "Add this to /etc/hosts to reach kafka externally:"
echo "$(minikube ip)  broker1.kafka.svc.cluster.local broker2.kafka.svc.cluster.local broker3.kafka.svc.cluster.local"
echo "   (you can also add zookeeper.kafka.svc.cluster.local if you want to talk to zookeeper)"

