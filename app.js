const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.json({
    message: 'Bienvenido a la aplicación de evaluación DevOps',
    timestamp: new Date(),
    environment: process.env.NODE_ENV || 'development',
    hostname: require('os').hostname()
  });
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.listen(port,'0.0.0.0', () => {
  console.log(`Servidor ejecutándose en http://localhost:${port}`);
});
