#! /usr/bin/env bash

export REPLICAS=$( expr `kubectl get statefulsets.apps nearbeach-db-ss --template "{{ .spec.replicas }}"` + 1)

kubectl scale statefulset nearbeach-db-ss --replicas=$REPLICAS

sleep 10 # Give it some time to spin up the pod 10s

export DB_POD_NAME=$(kubectl get pods --selector=app=NearbeachDatabaseService --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | sort | tail -n 1)

# Could check here that its (replicas - 1)
jinja deplyoment_template.j2 -D instance_name $1 -D mysql_pod_name $DB_POD_NAME | kubectl apply -f - 
