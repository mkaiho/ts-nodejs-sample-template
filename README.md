# ts-nodejs-sample-template

## Prerequisite

- Docker
- minikube
- VirtualBox
- kubectl

## Local development

### create containers for development

- `docker compose up --build -d`

### login containers for development

- `docker exec -it <CONTAINER_NAME> bash`

### remove containers for development

- `docker compose down`

## Build and Push docker image

## log in docker

`docker login`

### build image

- `docker build -t  <ACCOUNT_NAME>/<IMAGE_NAME>:<TAG> .`

### push image to docker registry

- `docker push <ACCOUNT_NAME>/<<IMAGE_NAME>:<TAG>>`

## minikube

### start minikube

- `minikube start --vm-driver=virtualbox`

### enable ingress controller

- `minikube addons enable ingress`

### check contexts

- `kubectl config get-contexts`

### set default namespace to context

- `kubectl config set-context <CONTEXT_NAME> --namespace=<NAMESPAME>`

### create namespace for develop

- `kubectl apply -f deploy/development/namespace.yml`

### deploy container to develop namespace

- `kubectl apply -f deploy/development`

### check ip to add to /etc/hosts

- minikube ip

### check normaly running

- curl \<HOST>
