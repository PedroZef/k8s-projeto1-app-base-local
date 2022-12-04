#!/bin/bash

echo "Criando as imagens....."

docker build -t denilsonbonatti/projeto-backend:1.0 backend/.
docker build -t denilsonbonatti/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push denilsonbonatti /projeto-backend:1.0 
docker push denilsonbonatti/projeto-database:1.0

echo "Criando servicos no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl  apply -f ./deploymnet.yml