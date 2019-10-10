

build:
	./bin/build.sh

deploy-prod-namespace:
	kubectl create -f namespace-prod.json && find ./ -name deploy.yaml | xargs -n1 kubectl apply -n blue-team-prod -f

deploy:
	find ./ -name deploy.yaml | xargs -n1 kubectl apply -f

proxy:
	kubectl port-forward $(shell kubectl get pods -l app=webapp -ojsonpath='{.items[0].metadata.name}')  8080:80
	
clean-prod-namespace:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -n blue-team-prod -f && kubectl delete -f namespace-prod.json
	
clean:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -f 
