# k8s-bootstrap-wrapper

```sh

helm dependency update .

helm install argo-workflows --wait --set argo-workflows.enabled=true -n argo-workflows --create-namespace=true .
# Now deploy workflows to do the rest

helm install bootstrap-init --set bootstrap-init.enabled=true -n argo-workflows --create-namespace=true .

helm install argo-cd --set argo-cd.enabled=true -n argo-cd --create-namespace=true .

```
