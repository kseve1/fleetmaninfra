#docker tag webapp:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/webapp:latest
#docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/webapp:latest
  
docker tag queue:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/queue:latest
docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/queue:latest
 
docker tag api-gateway:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/apigateway:latest
docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/apigateway:latest

docker tag position-simulator:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/positionsimulator:latest
docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/positionsimulator:latest
 
docker tag position-tracker:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/positiontracker:latest
docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/positiontracker:latest
