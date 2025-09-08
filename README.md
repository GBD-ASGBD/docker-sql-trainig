# Comandes a executar al terminal
Cal tenir Docker instal·lat a l'ordinador, pots veure la documentació sobre com instal·lar-lo en diferents plataformes al següent enllaç
[https://docs.docker.com/get-started/get-docker/]
Dins la carpeta del projecte cal executar les Comandes
## Per crear la imatge
`docker build -t postgres-training .`
## Per crear el contenidor amb el nom training-db 
`docker run -d --name training-db -p 5432:5432 postgres-training`

## Per executar el psql que hi ha dins el contenidor
`docker exec -it training-db psql -U isard -d training`

## Per aturar el contenidor
`docker stop training-db`