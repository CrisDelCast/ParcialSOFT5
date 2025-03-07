#imagen
FROM node:18-alpine
#directorio
WORKDIR /app
# Copiar archivos al contenedor
COPY package.json ./
# dependencias
RUN npm install --only=production
# Copiar el codigo
COPY . .
# exponer el puerto
EXPOSE 8080
# ejecutar la aplicación
CMD ["node", "app.js"]