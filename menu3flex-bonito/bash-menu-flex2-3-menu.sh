#!/bin/bash

# Function to display options available for customizing the HTML file
display_options() {
  echo "Opciones:"
  echo "1. Introduce el tipo de display para el contenedor (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex)"  # Container's display type
  echo "2. Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row)"  # Flex items direction
  echo "3. Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap)"  # Flex items wrap property
  echo "4. Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start)"  # Horizontal alignment of flex items
  echo "5. Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch)"  # Vertical alignment of flex items
  echo "6. Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start)"  # Alignment of flex container content
  echo "7. Introduce el ancho de los elementos flexibles (por ejemplo, '100px') (actual: 100px)"  # Width of flex items
  echo "8. Introduce la altura de los elementos flexibles (por ejemplo, '100px') (actual: 100px)"  # Height of flex items
  echo "9. Introduce el margen entre los elementos flexibles (por ejemplo, '10px') (actual: 10px)"  # Margin between flex items
  echo "10. Introduce el color de fondo de los elementos (por ejemplo, 'lightgray') (actual: lightgray)"  # Background color of flex items
  echo "11. Introduce el color de fondo de la caja centrada (por ejemplo, 'lightblue') (actual: lightblue)"  # Background color of centered box
  echo "12. Introduce la visualización flex de la caja centrada (por ejemplo, 'flex') (actual: flex)"  # Flex display of centered box
  echo "13. Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center)"  # Vertical alignment of centered box
  echo "14. Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center)"  # Horizontal alignment of centered box
  echo "15. Introduce la fuente de los elementos (por ejemplo, 'Arial, sans-serif') (actual: inherit)"  # Font family of items
  echo "16. Introduce el tamaño de fuente de los elementos (por ejemplo, '16px') (actual: 16px)"  # Font size of items
  echo "17. Introduce el relleno de los elementos (por ejemplo, '10px') (actual: 10px)"  # Padding of items
  echo "18. Introduce el borde de los elementos (por ejemplo, '1px solid black') (actual: none)"  # Border of items
  echo "19. Introduce la sombra de los elementos (por ejemplo, '2px 2px 5px gray') (actual: none)"  # Box shadow of items
  echo "20. Introduce la clase para el contenedor flex (actual: flex-container)"  # Class for flex container
  echo "21. Introduce la clase para los elementos flexibles (actual: flex-item)"  # Class for flex items
  echo "22. Introduce la clase para la caja centrada (actual: centered-box)"  # Class for centered box
}

# Function to get user-defined values
get_custom_values() {
  display_options  # Show options available for HTML customization

  while true; do
    read -p "Ingrese el número de la opción que desea cambiar (0 para salir): " option

    case $option in
      0)
        echo "Saliendo..."
        exit
        ;;
      1)
        read -p "Introduce el tipo de display para el contenedor (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex): " GRID_DISPLAY
        GRID_DISPLAY=${GRID_DISPLAY:-"flex"}
        ;;
      2)
        read -p "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row): " FLEX_DIRECTION
        FLEX_DIRECTION=${FLEX_DIRECTION:-"row"}
        ;;
      3)
        read -p "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap): " FLEX_WRAP
        FLEX_WRAP=${FLEX_WRAP:-"nowrap"}
        ;;
      4)
        read -p "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start): " JUSTIFY_CONTENT
        JUSTIFY_CONTENT=${JUSTIFY_CONTENT:-"flex-start"}
        ;;
      5)
        read -p "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch): " ALIGN_ITEMS
        ALIGN_ITEMS=${ALIGN_ITEMS:-"stretch"}
        ;;
      6)
        read -p "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start): " ALIGN_CONTENT
        ALIGN_CONTENT=${ALIGN_CONTENT:-"flex-start"}
        ;;
      7)
        read -p "Introduce el ancho de los elementos flexibles (por ejemplo, '100px') (actual: 100px): " ITEM_WIDTH
        ITEM_WIDTH=${ITEM_WIDTH:-"100px"}
        ;;
      8)
        read -p "Introduce la altura de los elementos flexibles (por ejemplo, '100px') (actual: 100px): " ITEM_HEIGHT
        ITEM_HEIGHT=${ITEM_HEIGHT:-"100px"}
        ;;
      9)
        read -p "Introduce el margen entre los elementos flexibles (por ejemplo, '10px') (actual: 10px): " ITEM_MARGIN
        ITEM_MARGIN=${ITEM_MARGIN:-"10px"}
        ;;
      10)
        read -p "Introduce el color de fondo de los elementos (por ejemplo, 'lightgray') (actual: lightgray): " ITEM_BACKGROUND_COLOR
        ITEM_BACKGROUND_COLOR=${ITEM_BACKGROUND_COLOR:-"lightgray"}
        ;;
      11)
        read -p "Introduce el color de fondo de la caja centrada (por ejemplo, 'lightblue') (actual: lightblue): " CENTERED_BOX_BACKGROUND_COLOR
        CENTERED_BOX_BACKGROUND_COLOR=${CENTERED_BOX_BACKGROUND_COLOR:-"lightblue"}
        ;;
      12)
        read -p "Introduce la visualización flex de la caja centrada (por ejemplo, 'flex') (actual: flex): " CENTERED_BOX_DISPLAY
        CENTERED_BOX_DISPLAY=${CENTERED_BOX_DISPLAY:-"flex"}
        ;;
      13)
        read -p "Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center): " CENTERED_BOX_ALIGN
        CENTERED_BOX_ALIGN=${CENTERED_BOX_ALIGN:-"center"}
        ;;
      14)
        read -p "Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center): " CENTERED_BOX_JUSTIFY
        CENTERED_BOX_JUSTIFY=${CENTERED_BOX_JUSTIFY:-"center"}
        ;;
      15)
        read -p "Introduce la fuente de los elementos (por ejemplo, 'Arial, sans-serif') (actual: inherit): " FONT_FAMILY
        FONT_FAMILY=${FONT_FAMILY:-"inherit"}
        ;;
      16)
        read -p "Introduce el tamaño de fuente de los elementos (por ejemplo, '16px') (actual: 16px): " FONT_SIZE
        FONT_SIZE=${FONT_SIZE:-"16px"}
        ;;
      17)
        read -p "Introduce el relleno de los elementos (por ejemplo, '10px') (actual: 10px): " PADDING
        PADDING=${PADDING:-"10px"}
        ;;
      18)
        read -p "Introduce el borde de los elementos (por ejemplo, '1px solid black') (actual: none): " BORDER
        BORDER=${BORDER:-"none"}
        ;;
      19)
        read -p "Introduce la sombra de los elementos (por ejemplo, '2px 2px 5px gray') (actual: none): " BOX_SHADOW
        BOX_SHADOW=${BOX_SHADOW:-"none"}
        ;;
      20)
        read -p "Introduce la clase para el contenedor flex (actual: flex-container): " FLEX_CONTAINER_CLASS
        FLEX_CONTAINER_CLASS=${FLEX_CONTAINER_CLASS:-"flex-container"}
        ;;
      21)
        read -p "Introduce la clase para los elementos flexibles (actual: flex-item): " FLEX_ITEM_CLASS
        FLEX_ITEM_CLASS=${FLEX_ITEM_CLASS:-"flex-item"}
        ;;
      22)
        read -p "Introduce la clase para la caja centrada (actual: centered-box): " CENTERED_BOX_CLASS
        CENTERED_BOX_CLASS=${CENTERED_BOX_CLASS:-"centered-box"}
        ;;
      *)
        echo "Opción no válida. Por favor, seleccione un número válido."
        ;;
    esac
  done
}

# Call the function to get custom values
get_custom_values

# Use the values to generate the HTML file
cat <<EOF >mi_archivo.html
<!DOCTYPE html>
<html>
<head>
<style>
.${FLEX_CONTAINER_CLASS} {
  display: ${GRID_DISPLAY};
  flex-direction: ${FLEX_DIRECTION};
  flex-wrap: ${FLEX_WRAP};
  justify-content: ${JUSTIFY_CONTENT};
  align-items: ${ALIGN_ITEMS};
  align-content: ${ALIGN_CONTENT};
  font-family: ${FONT_FAMILY};
  font-size: ${FONT_SIZE};
  padding: ${PADDING};
  border: ${BORDER};
  box-shadow: ${BOX_SHADOW};
  /* ... (rest of the styles) */
}

.${FLEX_ITEM_CLASS} {
  width: ${ITEM_WIDTH};
  height: ${ITEM_HEIGHT};
  margin: ${ITEM_MARGIN};
  background-color: ${ITEM_BACKGROUND_COLOR};
  /* ... (rest of the styles) */
}

.${CENTERED_BOX_CLASS} {
  width: ${ITEM_WIDTH};
  height: ${ITEM_HEIGHT};
  background-color: ${CENTERED_BOX_BACKGROUND_COLOR};
  display: ${CENTERED_BOX_DISPLAY};
  align-items: ${CENTERED_BOX_ALIGN};
  justify-content: ${CENTERED_BOX_JUSTIFY};
  /* ... (rest of the styles) */
}
</style>
</head>
<body>
<div class="${FLEX_CONTAINER_CLASS}">
  <div class="${FLEX_ITEM_CLASS}">1</div>
  <div class="${FLEX_ITEM_CLASS}">2</div>
  <div class="${CENTERED_BOX_CLASS}">Centered</div>
</div>
</body>
</html>
EOF
