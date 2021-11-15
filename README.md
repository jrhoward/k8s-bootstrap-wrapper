# k8s-bootstrap-wrapper

```sh

helm dependency update .

helm upgrade --install multi-card --set bootstrap-init.enabled=true  --set argo-workflows.enabled=true -n argo-workflows --create-namespace=true .

# remove

helm delete  multi-card  -n argo-workflows

# created from install but not removed by 'delete'
helm delete  son-of-workflow  -n argo-cd

```
