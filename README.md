# k8s-bootstrap-wrapper

```sh

helm dependency update .

helm install argo-workflows --wait --set argo-workflows.enabled=true -n argo-workflows --create-namespace=true .
# Now deploy workflows to do the rest

helm install bootstrap-init --set bootstrap-init.enabled=true -n argo-workflows --create-namespace=true .

helm install argo-cd --set argo-cd.enabled=true -n argo-cd --create-namespace=true .

```

or ...

```sh

helm upgrade --install multi-card --set bootstrap-init.enabled=true  --set argo-workflows.enabled=true -n argo-workflows --create-namespace=true .

# remove

helm delete  multi-card  -n argo-workflows

# created from install but not removed by 'delete'
helm delete  son-of-workflow  -n argo-cd

```