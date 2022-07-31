# TODO: Use something the kustomize or helm instead of hack crap.
# TODO: Add nearbeach namespace
# TODO: Add ingress 

So the idea was to use a stateful set to scale entries for db
Then you can create a deployment using the name of the pod_name of the statefulset you wish to aim at.
This means you could have them all pointing at a single db container of have each one pointed at there own (

Some hacky little scripts to help with this
bash ./init.sh # will create a prod entry
bash ./add_deployment.sh test # will extend and add test entry and a will scale up the stateful set.
