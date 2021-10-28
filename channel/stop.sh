echo "Stopping peer group"
docker-compose -f peer1-orgA.yaml down 
docker-compose -f peer1-orgB.yaml down 
docker ps|grep peer
echo "Stop finished"

