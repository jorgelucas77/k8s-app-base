echo "A Criar as imagens"

docker build -t jorgelucas/projeto-backend:1.0 backend/.
docker build -t jorgelucas/projeto-database:1.0 database/.

echo "A fazer o upload das imagens"

docker push jorgelucas/projeto-backend:1.0 backend/.
docker push jorgelucas/projeto-database:1.0 database/.

echo "Criar serviços no cluster de Kubernetes"

kubectl apply -f ./services.yml

echo "Criar os deployments no cluster de Kubernetes"

kubectl apply -f ./deployment.yml
