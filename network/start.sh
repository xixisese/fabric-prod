echo "Starting orderer network"
docker-compose -f orderer1-orgA.yaml up -d 
docker-compose -f orderer2-orgA.yaml up -d 
docker-compose -f orderer1-orgB.yaml up -d 
docker ps|grep orderer
echo "Start finished"
