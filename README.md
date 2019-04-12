# kube-scale

Script and yaml template to cron the scaling of kubernetes deployments

## Deploy

```sh
kubetpl render kube-scale.yaml -s DEPLOYMENT_NAME={deployment-name} -s REPLICAS={replicas} -s CRON={cron} -s IMAGE_NAME={docker-image-name} -s IMAGE_TAG={docker-image-tag} [-s IMAGE_PULL_SECRET={docker-image-pull-secret}] --syntax=go-template | kubectl -n {namespace} apply -f -
```