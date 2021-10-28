echo "Stopping orderer network"
docker-compose -f orderer1-orgA.yaml down 
docker-compose -f orderer2-orgA.yaml down 
docker-compose -f orderer1-orgB.yaml down 
echo "Stop finished"
