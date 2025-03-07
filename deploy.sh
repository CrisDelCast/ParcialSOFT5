#!/bin/bash

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Por favor, instálalo y vuelve a intentarlo."
    exit 1
fi

# Construir la imagen
echo "Construyendo la imagen de Docker..."
docker build -t mi-aplicacion-node .

# Verificar si el contenedor ya está corriendo y detenerlo si es necesario
if [ $(docker ps -q -f name=mi-contenedor) ]; then
    echo "Deteniendo contenedor existente..."
    docker stop mi-contenedor
    docker rm mi-contenedor
fi

# Ejecutar el contenedor con las variables de entorno adecuadas
echo "Ejecutando el contenedor..."
docker run -d -p 8080:8080 --name mi-contenedor -e PORT=8080 -e NODE_ENV=production mi-aplicacion-node

# Esperar unos segundos para que la aplicación inicie
sleep 5

# Verificar que la aplicación responde
if curl -s http://localhost:8080 | grep "Bienvenido a la aplicación de evaluación DevOps" &> /dev/null
then
    echo "La aplicación está funcionando correctamente."
    exit 0
else
    echo "Error: La aplicación no responde correctamente."
    exit 1
fi