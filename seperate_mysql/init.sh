#! /usr/bin/env bash


kubectl apply -f mysql-service.yml
sleep 30
jinja deplyoment_template.j2 -D instance_name prod -D mysql_pod_name nearbeach-db-ss-0 | kubectl apply -f - 