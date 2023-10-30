#!/bin/bash
cat <<EOF > mi_archivo.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
  align-items: stretch;
  align-content: flex-start;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.flex-item {
  width: 100px; /* Ancho dinámico de los elementos flexibles */
  height: 100px; /* Altura dinámica de los elementos flexibles */
  margin: 10px; /* Márgenes dinámicos entre los elementos flexibles */
  background-color: lightgray; /* Color de fondo dinámico de los elementos */
}

.centered-box {
  width: 100px;
  height: 100px;
  background-color: lightblue;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="centered-box">Centered</div>
</div>
</body>
</html>
EOF
