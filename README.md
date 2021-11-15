# k8s-bootstrap-wrapper


Deploys argo-workflow and templates.

Deploys a workflow of workflows that:

1. sets up some namespaces (just a demo of completing prerequisites)
2. deploys argocd helm chart
3. Sets up the argocd Application Custom Resource for argocd to manage itself

You should be able to reuse step 2 and step 3 for any helm chart 

```sh

helm dependency update .

helm upgrade --install multi-card --set bootstrap-init.enabled=true  --set argo-workflows.enabled=true -n argo-workflows --create-namespace=true .

# remove

helm delete  multi-card  -n argo-workflows

# created from install but not removed by 'delete'
helm delete  son-of-workflow  -n argo-cd

```
