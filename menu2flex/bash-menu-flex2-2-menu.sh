#!/bin/bash

display_options() {
  echo "Opciones:"
  echo "1. Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex)"
  echo "2. Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row)"
  echo "3. Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap)"
  echo "4. Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start)"
  echo "5. Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch)"
  echo "6. Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start)"
  echo "7. Introduce el ancho de los elementos flexibles (ej. '100px') (actual: 100px)"
  echo "8. Introduce la altura de los elementos flexibles (ej. '100px') (actual: 100px)"
  echo "9. Introduce el margen entre los elementos flexibles (ej. '10px') (actual: 10px)"
  echo "10. Introduce el color de fondo de los elementos (ej. 'lightgray') (actual: lightgray)"
  echo "11. Introduce el color de fondo de la caja centrada (ej. 'lightblue') (actual: lightblue)"
  echo "12. Introduce la visualización flex de la caja centrada (ej. 'flex') (actual: flex)"
  echo "13. Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center)"
  echo "14. Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center)"
}

get_custom_values() {
  display_options

  while true; do
    read -p "Ingrese el número de la opción que desea cambiar (0 para salir): " option

    case $option in
      0) echo "Saliendo..."; exit;;
      1) echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex):"
         read -r GRID_DISPLAY
         GRID_DISPLAY=${GRID_DISPLAY:-"flex"};;
      2) echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row):"
         read -r FLEX_DIRECTION
         FLEX_DIRECTION=${FLEX_DIRECTION:-"row"};;
      3) echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap):"
         read -r FLEX_WRAP
         FLEX_WRAP=${FLEX_WRAP:-"nowrap"};;
      4) echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start):"
         read -r JUSTIFY_CONTENT
         JUSTIFY_CONTENT=${JUSTIFY_CONTENT:-"flex-start"};;
      5) echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch):"
         read -r ALIGN_ITEMS
         ALIGN_ITEMS=${ALIGN_ITEMS:-"stretch"};;
      6) echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start):"
         read -r ALIGN_CONTENT
         ALIGN_CONTENT=${ALIGN_CONTENT:-"flex-start"};;
      7) echo "Introduce el ancho de los elementos flexibles (ej. '100px') (actual: 100px):"
         read -r ITEM_WIDTH
         ITEM_WIDTH=${ITEM_WIDTH:-"100px"};;
      8) echo "Introduce la altura de los elementos flexibles (ej. '100px') (actual: 100px):"
         read -r ITEM_HEIGHT
         ITEM_HEIGHT=${ITEM_HEIGHT:-"100px"};;
      9) echo "Introduce el margen entre los elementos flexibles (ej. '10px') (actual: 10px):"
         read -r ITEM_MARGIN
         ITEM_MARGIN=${ITEM_MARGIN:-"10px"};;
      10) echo "Introduce el color de fondo de los elementos (ej. 'lightgray') (actual: lightgray):"
          read -r ITEM_BACKGROUND_COLOR
          ITEM_BACKGROUND_COLOR=${ITEM_BACKGROUND_COLOR:-"lightgray"};;
      11) echo "Introduce el color de fondo de la caja centrada (ej. 'lightblue') (actual: lightblue):"
          read -r CENTERED_BOX_BACKGROUND_COLOR
          CENTERED_BOX_BACKGROUND_COLOR=${CENTERED_BOX_BACKGROUND_COLOR:-"lightblue"};;
      12) echo "Introduce la visualización flex de la caja centrada (ej. 'flex') (actual: flex):"
          read -r CENTERED_BOX_DISPLAY
          CENTERED_BOX_DISPLAY=${CENTERED_BOX_DISPLAY:-"flex"};;
      13) echo "Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center):"
          read -r CENTERED_BOX_ALIGN
          CENTERED_BOX_ALIGN=${CENTERED_BOX_ALIGN:-"center"};;
      14) echo "Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center):"
          read -r CENTERED_BOX_JUSTIFY
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
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 300px;
  border: 1px solid black;
}

.flex-item {
  width: $ITEM_WIDTH;
  height: $ITEM_HEIGHT;
  margin: $ITEM_MARGIN;
  background-color: $ITEM_BACKGROUND_COLOR;
}

.centered-box {
  width: $ITEM_WIDTH;
  height: $ITEM_HEIGHT;
  background-color: $CENTERED_BOX_BACKGROUND_COLOR;
  display: $CENTERED_BOX_DISPLAY;
  align-items: $CENTERED_BOX_ALIGN;
  justify-content: $CENTERED_BOX_JUSTIFY;
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
