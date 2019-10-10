

build:
	./bin/build.sh

deploy-namespace:
	kubectl create -f namespace-dev.json && find ./ -name deploy.yaml | xargs -n1 kubectl apply -n blue-team-dev -f

deploy:
	find ./ -name deploy.yaml | xargs -n1 kubectl apply -f

proxy:
	kubectl port-forward $(shell kubectl get pods -l app=webapp -ojsonpath='{.items[0].metadata.name}')  8080:80
	
clean-namespace:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -n blue-team-dev -f && kubectl delete -f namespace-dev.json
	
clean:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -f 
