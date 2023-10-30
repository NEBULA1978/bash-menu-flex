#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  read -r GRID_DISPLAY

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  read -r FLEX_DIRECTION

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  read -r FLEX_WRAP

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  read -r JUSTIFY_CONTENT

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  read -r ALIGN_ITEMS

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
  read -r ALIGN_CONTENT

  echo "Introduce el ancho de los elementos flexibles (en píxeles):"
  read -r ITEM_WIDTH

  echo "Introduce la altura de los elementos flexibles (en píxeles):"
  read -r ITEM_HEIGHT

  echo "Introduce el margen entre los elementos flexibles (en píxeles):"
  read -r ITEM_MARGIN

  echo "Introduce el color de fondo de los elementos (por ejemplo, 'lightgray', 'blue', '#RRGGBB', etc.):"
  read -r ITEM_BACKGROUND_COLOR

  echo "Introduce el ancho de la caja centrada (en píxeles):"
  read -r CENTERED_WIDTH

  echo "Introduce la altura de la caja centrada (en píxeles):"
  read -r CENTERED_HEIGHT

  echo "Introduce el color de fondo de la caja centrada (por ejemplo, 'lightblue', '#RRGGBB', etc.):"
  read -r CENTERED_BACKGROUND_COLOR
}

# Función para generar el archivo HTML con CSS personalizado
generate_html() {
  cat <<EOF >flexbox_example.html
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
  width: ${ITEM_WIDTH:-100}px; /* Ancho dinámico de los elementos flexibles */
  height: ${ITEM_HEIGHT:-100}px; /* Altura dinámica de los elementos flexibles */
  margin: ${ITEM_MARGIN:-10}px; /* Márgenes dinámicos entre los elementos flexibles */
  background-color: ${ITEM_BACKGROUND_COLOR:-lightgray}; /* Color de fondo dinámico de los elementos */
}

.centered-box {
  width: ${CENTERED_WIDTH:-100}px;
  height: ${CENTERED_HEIGHT:-100}px;
  background-color: ${CENTERED_BACKGROUND_COLOR:-lightblue};
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
}

# Menú de opciones
while true; do
  clear
  echo "Menú de Ejemplos de Flexbox:"
  echo "1. Ejemplo de Flexbox con dirección 'row'"
  echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
  echo "3. Ejemplo de Flexbox con dirección 'column'"
  echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
  echo "5. Ejemplo de Flexbox con personalización de valores"
  echo "6. Ejemplo de Flexbox con display 'inline-flex'"
  echo "7. Ejemplo de Flexbox con elementos centrados"
  echo "8. Ejemplo de Flexbox con contenedor centrado"
  echo "9. Otra opción adicional"
  echo "10. Salir"

  read -n 1 -r OPTION
  echo "" # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $OPTION in
    1)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="row"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    2)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="row-reverse"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    3)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="column"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    4)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="column-reverse"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    5)
      get_custom_values
      generate_html
      ;;

    6)
      GRID_DISPLAY="inline-flex"
      FLEX_DIRECTION="row"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    7)
      cat <<EOF >centered_flexbox.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.centered-box {
  width: ${CENTERED_WIDTH:-100}px;
  height: ${CENTERED_HEIGHT:-100}px;
  background-color: ${CENTERED_BACKGROUND_COLOR:-lightblue};
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="centered-box">Centered</div>
</div>
</body>
</html>
EOF
      ;;

    8)
      get_custom_values
      generate_html
      ;;

    9)
      # Otra opción adicional
      ;;

    10)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 10."
      ;;
  esac

  echo "Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar."
  read -r
done
