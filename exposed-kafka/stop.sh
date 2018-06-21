#!/bin/bash

for s in zookeeper broker1 broker2 broker3; do
  kubectl delete -f ${s}-service.yml
done

for p in zookeeper kafka1 kafka2 kafka3; do
  kubectl delete -f ${p}-app.yml
done
