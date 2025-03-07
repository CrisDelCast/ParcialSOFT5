# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: Cristian David Del Castillo Garcia**
- **Código: A00369953**
- **Fecha:7/03/2025**

## Resumen de la Solución

En esta práctica, se realizó la contenerización de una aplicación Node.js utilizando Docker. Se creó un Dockerfile para construir la imagen del contenedor y un script de automatización en Bash (deploy.sh) para gestionar el proceso de construcción, eliminación de contenedores antiguos y despliegue de la aplicación. Finalmente, se verificó que la aplicación estuviera ejecutándose correctamente dentro del contenedor.

## Dockerfile
Se utilizó una imagen base ligera de Node.js (Alpine) para optimizar el tamaño del contenedor. Se configuró el WORKDIR, se copiaron los archivos necesarios y se instalaron las dependencias en modo producción. Finalmente, se expuso el puerto 8080 y se definió el comando de ejecución.

## Script de Automatización
**FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --only=production
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]**

## Principios DevOps Aplicados
1. Automatización: Se utilizó un script para evitar tareas manuales repetitivas.
2. Contenerización: Uso de Docker para asegurar consistencia en distintos entornos.
3. Integración y Despliegue Continuo: El script facilita una integración fluida en pipelines CI/CD.

## Captura de Pantalla
![alt text](image.png)
![alt text](image-1.png)
![alt text](image-2.png)
## Mejoras Futuras
1. Implementar un docker-compose.yml para mayor flexibilidad en la configuración.
2. Agregar pruebas unitarias y de integración en la aplicación.
3. Automatizar despliegue con GitHub Actions o Jenkins.

## Instrucciones para Ejecutar
1. CLONAR EL REPOSITORIO
git clone https://github.com/CrisDelCast/ParcialSOFT5.git
cd ParcialSOFT5
2. Construir y ejecutar la aplicación manualmente
docker build -t mi-aplicacion-node .
docker run -d -p 8080:8080 --name mi-contenedor mi-aplicacion-node
3. Usar el script 
./deploy.sh
