# Comandes a executar al terminal
Cal tenir Docker instal·lat a l'ordinador, pots veure la documentació sobre com instal·lar-lo en diferents plataformes al següent enllaç
[https://docs.docker.com/get-started/get-docker/](Docker)

Primer has de descarregar el projecte, ja sigui descarregant el codi directament amb el botó verd de la part superior dreta o si saps com funciona git pots crear un clon del repositori al teu ordinador.

Dins la carpeta del projecte cal executar les següents comandes
## Per crear la imatge
`docker build -t postgres-training .`
## Per crear el contenidor amb el nom training-db 
`docker run -d --name training-db -p 5432:5432 postgres-training`

## Per executar el psql que hi ha dins el contenidor
`docker exec -it training-db psql -U isard -d training`

## Per aturar el contenidor
`docker stop training-db`

# Importar un fitxer sql des de l'editor de comandes de postgres

Per poder importar un fityxer sql des de l'editor de comandes de postgres cal que aquest fitxer estigui accessible pel propi editor.
## Fer el fitxer sql accessible des del contenidor
El primer que cal fer és copiar el fitxer sql a importar a les carpetes accessibles pel Docker, per fer-ho cal anar a la carpeta on tens el fitxer sql des del terminal del teu ordinador i escriure

`docker cp .\nom_fitxer_sql.sql training-db:/tmp/nom_fitxer_sql.sql`

on `nom_fitxer_sql.sql` ha de ser el nom real que li hagis posat al teu fitxer

## Importar el fitxer

Un cop tinguis el fitxer a la carpeta de docker entra al terminal de postgres amb la comanda que ja hem utilitzat

`docker exec -it training-db psql -U isard -d training`

i finalment, des de dins del terminal de postgres escriu

`\i /tmp/nom_fitxer_sql.sql`
