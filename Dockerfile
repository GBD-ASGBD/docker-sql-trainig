# Imatge oficial de Postgres
FROM postgres:17

# Variables d'entorn per a la BD
ENV POSTGRES_USER=isard
ENV POSTGRES_PASSWORD=pirineus
ENV POSTGRES_DB=training

# Copiem l'script SQL a la carpeta d'inicialització
COPY training.sql /docker-entrypoint-initdb.d/
