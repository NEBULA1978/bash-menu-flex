#!/bin/bash

get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex):"
  read -r GRID_DISPLAY
  GRID_DISPLAY=${GRID_DISPLAY:-"flex"}

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row):"
  read -r FLEX_DIRECTION
  FLEX_DIRECTION=${FLEX_DIRECTION:-"row"}

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap):"
  read -r FLEX_WRAP
  FLEX_WRAP=${FLEX_WRAP:-"nowrap"}

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start):"
  read -r JUSTIFY_CONTENT
  JUSTIFY_CONTENT=${JUSTIFY_CONTENT:-"flex-start"}

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch):"
  read -r ALIGN_ITEMS
  ALIGN_ITEMS=${ALIGN_ITEMS:-"stretch"}

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start):"
  read -r ALIGN_CONTENT
  ALIGN_CONTENT=${ALIGN_CONTENT:-"flex-start"}
}

# Llamada a la función para obtener los valores personalizados
get_custom_values

# Utilización de los valores en la generación del archivo HTML
cat <<EOF >mi_archivo.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
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
