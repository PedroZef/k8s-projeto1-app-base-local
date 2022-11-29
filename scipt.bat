echo "Criando as imagens....."

docker build -t pedrozef/projeto-backend:2.0 backend/.
docker build -t pedrozef/projeto-database:2.0 database/.

echo "Realizando o push das imagens...."

docker push pedrozef/projeto-backend:2.0 
docker push pedrozef/projeto-database:2.0

echo "Criando servicos no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl  apply -f ./deploymnet.yml