# Microservices E-Commerce Application

A microservices-based e-commerce application built using Spring Boot, Angular, Kafka, Keycloak, and Kubernetes.  
This project is designed to demonstrate a scalable backend architecture with separate services for products, orders, inventory, notifications, and API gateway routing.

## Services

- **Product Service** — product catalog management
- **Order Service** — order processing
- **Inventory Service** — stock validation and inventory management
- **Notification Service** — order notifications
- **API Gateway** — request routing with Spring Cloud Gateway MVC
- **Shop Frontend** — Angular 18 user interface

## Tech Stack

- Spring Boot
- Angular 18
- MongoDB
- MySQL
- Kafka
- Keycloak
- Testcontainers
- WireMock
- Kubernetes
- Prometheus
- Grafana
- Loki
- Tempo
- Spring Cloud Gateway MVC

## Architecture

![Architecture](https://github.com/user-attachments/assets/d4ef38bd-8ae5-4cc7-9ac5-7a8e5ec3c969)

## Prerequisites

## How to run the frontend application

Make sure you have the following installed on your machine:

- Node.js
- NPM
- Angular CLI

Run the following commands to start the frontend application

```shell
cd frontend
npm install
npm run start
```
## How to build the backend services

Run the following command to build and package the backend services into a docker container

```shell
mvn spring-boot:build-image -DdockerPassword=<your-docker-account-password>
```

The above command will build and package the services into a docker container and push it to your docker hub account.

## How to run the backend services

Make sure you have the following installed on your machine:

- Java 21
- Docker
- Kind Cluster - https://kind.sigs.k8s.io/docs/user/quick-start/#installation

### Start Kind Cluster
    
Run the k8s/kind/create-kind-cluster.sh script to create the kind Kubernetes cluster

```shell
./k8s/kind/create-kind-cluster.sh
```
This will create a kind cluster and pre-load all the required docker images into the cluster, this will save you time downloading the images when you deploy the application.

### Deploy the infrastructure

Run the k8s/manisfests/infrastructure.yaml file to deploy the infrastructure

```shell
kubectl apply -f k8s/manifests/infrastructure.yaml
```

### Deploy the services

Run the k8s/manifests/applications.yaml file to deploy the services

```shell
kubectl apply -f k8s/manifests/applications.yaml
```

### Access the API Gateway

To access the API Gateway, you need to port-forward the gateway service to your local machine

```shell
kubectl port-forward svc/gateway-service 9000:9000
```

### Access the Keycloak Admin Console
To access the Keycloak admin console, you need to port-forward the keycloak service to your local machine

```shell
kubectl port-forward svc/keycloak 8080:8080
```

### Access the Grafana Dashboards
To access the Grafana dashboards, you need to port-forward the grafana service to your local machine

```shell
kubectl port-forward svc/grafana 3000:3000
```
