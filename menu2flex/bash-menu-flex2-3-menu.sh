#!/bin/bash

# Función para mostrar las opciones disponibles para personalizar el archivo HTML
display_options() {
  echo "Opciones:"
  echo "1. Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex)"  # Tipo de display del contenedor flex
  echo "2. Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row)"  # Dirección de los elementos flexibles
  echo "3. Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap)"  # Propiedad flex-wrap
  echo "4. Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start)"  # Alineación horizontal de los elementos
  echo "5. Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch)"  # Alineación vertical de los elementos
  echo "6. Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start)"  # Alineación del contenido del contenedor
  echo "7. Introduce el ancho de los elementos flexibles (ej. '100px') (actual: 100px)"  # Ancho de los elementos flexibles
  echo "8. Introduce la altura de los elementos flexibles (ej. '100px') (actual: 100px)"  # Altura de los elementos flexibles
  echo "9. Introduce el margen entre los elementos flexibles (ej. '10px') (actual: 10px)"  # Margen entre elementos
  echo "10. Introduce el color de fondo de los elementos (ej. 'lightgray') (actual: lightgray)"  # Color de fondo de los elementos
  echo "11. Introduce el color de fondo de la caja centrada (ej. 'lightblue') (actual: lightblue)"  # Color de fondo de la caja centrada
  echo "12. Introduce la visualización flex de la caja centrada (ej. 'flex') (actual: flex)"  # Visualización flex de la caja centrada
  echo "13. Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center)"  # Alineamiento vertical de la caja centrada
  echo "14. Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center)"  # Alineamiento horizontal de la caja centrada
}

# Función para obtener valores personalizados del usuario
get_custom_values() {
  display_options  # Muestra las opciones disponibles para personalizar el archivo HTML

  while true; do
    read -p "Ingrese el número de la opción que desea cambiar (0 para salir): " option

    case $option in
      0) echo "Saliendo..."; exit;;  # Opción para salir del menú
      1) echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex):"
         read -r GRID_DISPLAY  # Tipo de display del contenedor flex
         GRID_DISPLAY=${GRID_DISPLAY:-"flex"};;
      2) echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row):"
         read -r FLEX_DIRECTION  # Dirección de los elementos flexibles
         FLEX_DIRECTION=${FLEX_DIRECTION:-"row"};;
      3) echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap):"
         read -r FLEX_WRAP  # Propiedad flex-wrap
         FLEX_WRAP=${FLEX_WRAP:-"nowrap"};;
      4) echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start):"
         read -r JUSTIFY_CONTENT  # Alineación horizontal de los elementos
         JUSTIFY_CONTENT=${JUSTIFY_CONTENT:-"flex-start"};;
      5) echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch):"
         read -r ALIGN_ITEMS  # Alineación vertical de los elementos
         ALIGN_ITEMS=${ALIGN_ITEMS:-"stretch"};;
      6) echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start):"
         read -r ALIGN_CONTENT  # Alineación del contenido del contenedor
         ALIGN_CONTENT=${ALIGN_CONTENT:-"flex-start"};;
      7) echo "Introduce el ancho de los elementos flexibles (ej. '100px') (actual: 100px):"
         read -r ITEM_WIDTH  # Ancho de los elementos flexibles
         ITEM_WIDTH=${ITEM_WIDTH:-"100px"};;
      8) echo "Introduce la altura de los elementos flexibles (ej. '100px') (actual: 100px):"
         read -r ITEM_HEIGHT  # Altura de los elementos flexibles
         ITEM_HEIGHT=${ITEM_HEIGHT:-"100px"};;
      9) echo "Introduce el margen entre los elementos flexibles (ej. '10px') (actual: 10px):"
         read -r ITEM_MARGIN  # Margen entre elementos
         ITEM_MARGIN=${ITEM_MARGIN:-"10px"};;
      10) echo "Introduce el color de fondo de los elementos (ej. 'lightgray') (actual: lightgray):"
          read -r ITEM_BACKGROUND_COLOR  # Color de fondo de los elementos
          ITEM_BACKGROUND_COLOR=${ITEM_BACKGROUND_COLOR:-"lightgray"};;
      11) echo "Introduce el color de fondo de la caja centrada (ej. 'lightblue') (actual: lightblue):"
          read -r CENTERED_BOX_BACKGROUND_COLOR  # Color de fondo de la caja centrada
          CENTERED_BOX_BACKGROUND_COLOR=${CENTERED_BOX_BACKGROUND_COLOR:-"lightblue"};;
      12) echo "Introduce la visualización flex de la caja centrada (ej. 'flex') (actual: flex):"
          read -r CENTERED_BOX_DISPLAY  # Visualización flex de la caja centrada
          CENTERED_BOX_DISPLAY=${CENTERED_BOX_DISPLAY:-"flex"};;
      13) echo "Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center):"
          read -r CENTERED_BOX_ALIGN  # Alineamiento vertical de la caja centrada
          CENTERED_BOX_ALIGN=${CENTERED_BOX_ALIGN:-"center"};;
      14) echo "Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center):"
          read -r CENTERED_BOX_JUSTIFY  # Alineamiento horizontal de la caja centrada
          CENTERED_BOX_JUSTIFY=${CENTERED_BOX_JUSTIFY:-"center"};;
      *) echo "Opción no válida. Por favor, seleccione un número válido.";;
    esac
  done
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
  display: $GRID_DISPLAY;  # Tipo de display del contenedor flex
  flex-direction: $FLEX_DIRECTION;  # Dirección de los elementos flexibles
  flex-wrap: $FLEX_WRAP;  # Propiedad flex-wrap
  justify-content: $JUSTIFY_CONTENT;  # Alineación horizontal de los elementos
  align-items: $ALIGN_ITEMS;  # Alineación vertical de los elementos
  align-content: $ALIGN_CONTENT;  # Alineación del contenido del contenedor
  height: 300px;
  border: 1px solid black;
}

.flex-item {
  width: $ITEM_WIDTH;  # Ancho de los elementos flexibles
  height: $ITEM_HEIGHT;  # Altura de los elementos flexibles
  margin: $ITEM_MARGIN;  # Margen entre elementos
  background-color: $ITEM_BACKGROUND_COLOR;  # Color de fondo de los elementos
}

.centered-box {
  width: $ITEM_WIDTH;  # Ancho de la caja centrada
  height: $ITEM_HEIGHT;  # Altura de la caja centrada
  background-color: $CENTERED_BOX_BACKGROUND_COLOR;  # Color de fondo de la caja centrada
  display: $CENTERED_BOX_DISPLAY;  # Visualización flex de la caja centrada
  align-items: $CENTERED_BOX_ALIGN;  # Alineamiento vertical de la caja centrada
  justify-content: $CENTERED_BOX_JUSTIFY;  # Alineamiento horizontal de la caja centrada
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
