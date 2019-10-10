

build:
	./bin/build.sh

deploy:
	kubectl create -f namespace-dev.json && find ./ -name deploy.yaml | xargs -n1 kubectl apply -n blue-team-dev -f

proxy:
	kubectl port-forward $(shell kubectl get pods -l app=webapp -ojsonpath='{.items[0].metadata.name}')  8080:80
	
clean:
	find ./ -name deploy.yaml | xargs -n1 kubectl delete -n blue-team-dev -f && kubectl delete -f namespace-dev.json
