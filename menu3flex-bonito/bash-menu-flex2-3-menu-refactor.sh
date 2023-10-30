#!/bin/bash

# Declare array variables with default values
declare -a options=(
  "flex"          # 1. Grid display
  "row"           # 2. Flex direction
  "nowrap"        # 3. Flex wrap
  "flex-start"    # 4. Justify content
  "stretch"       # 5. Align items
  "flex-start"    # 6. Align content
  "100px"         # 7. Item width
  "100px"         # 8. Item height
  "10px"          # 9. Item margin
  "lightgray"     # 10. Item background color
  "lightblue"     # 11. Centered box background color
  "flex"          # 12. Centered box display
  "center"        # 13. Centered box align items
  "center"        # 14. Centered box justify content
  "inherit"       # 15. Font family
  "16px"          # 16. Font size
  "10px"          # 17. Padding
  "none"          # 18. Border
  "none"          # 19. Box shadow
)

# Function to display options
display_options() {
  echo "Opciones:"
  echo "1. Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: ${options[0]})"
  echo "2. Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: ${options[1]})"
  # ... (rest of the options)
  echo "15. Introduce la fuente de los elementos (ej. 'Arial, sans-serif') (actual: ${options[14]})"
  echo "16. Introduce el tamaño de fuente de los elementos (ej. '16px') (actual: ${options[15]})"
  echo "17. Introduce el relleno de los elementos (ej. '10px') (actual: ${options[16]})"
  echo "18. Introduce el borde de los elementos (ej. '1px solid black') (actual: ${options[17]})"
  echo "19. Introduce la sombra de los elementos (ej. '2px 2px 5px gray') (actual: ${options[18]})"
}

# Function to get custom values
get_custom_values() {
  display_options

  while true; do
    read -p "Ingrese el número de la opción que desea cambiar (0 para salir): " option

    if [ $option -eq 0 ]; then
      echo "Saliendo..."
      exit 0
    elif [ $option -ge 1 ] && [ $option -le 19 ]; then
      read -p "Introduce el nuevo valor: " value
      options[$(($option - 1))]="${value:-${options[$(($option - 1))]}}"
    else
      echo "Opción no válida. Por favor, seleccione un número válido."
    fi
  done
}

# Call the function to get custom values
get_custom_values

# Utilize the values in generating the HTML file
cat <<EOF >mi_archivo.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: ${options[0]};
  flex-direction: ${options[1]};
  flex-wrap: ${options[2]};
  justify-content: ${options[3]};
  align-items: ${options[4]};
  align-content: ${options[5]};
  /* ... (rest of the styles) */
}
.centered-box {
  width: ${options[6]};
  height: ${options[7]};
  background-color: ${options[8]};
  display: ${options[9]};
  align-items: ${options[10]};
  justify-content: ${options[11]};
  /* ... (rest of the styles) */
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

# Es un programa Bash que permite al usuario personalizar estilos CSS para la estructura de un archivo HTML. Aquí está una explicación detallada de lo que hace:

#     Declaración de Variables:
#         Se declara un arreglo llamado options que almacena valores predeterminados para varios estilos CSS.

#     Función display_options():
#         Esta función muestra las opciones disponibles para personalizar el archivo HTML. Imprime por pantalla las descripciones de cada opción junto con los valores actuales.

#     Función get_custom_values():
#         Esta función maneja la interacción con el usuario.
#         Muestra las opciones disponibles utilizando la función display_options().
#         Mediante un bucle while, permite al usuario elegir un número correspondiente a una opción y cambiar su valor. Las opciones están indexadas del 1 al 19. El usuario puede ingresar un nuevo valor para la opción seleccionada o simplemente presionar Enter para mantener el valor actual.
#         Si el usuario ingresa 0, el programa termina.

#     Generación del Archivo HTML:
#         Después de que el usuario ha ingresado y/o confirmado los valores deseados para los estilos, se utilizan estos valores para generar un archivo HTML.
#         Se usa la redirección de la salida (cat <<EOF >mi_archivo.html) para crear un archivo HTML denominado mi_archivo.html que contiene una estructura básica HTML.
#         Dentro del archivo, se incluye una sección <style> que define estilos CSS basados en las opciones personalizadas proporcionadas por el usuario.
#         Se genera una estructura HTML básica con un contenedor de clase flex-container y un conjunto de elementos interiores que siguen los estilos definidos en el CSS, incluyendo una caja centrada con una clase centered-box.

# En resumen, este script proporciona una interfaz sencilla para la personalización de estilos CSS, permitiendo al usuario modificar las propiedades de un archivo HTML. Luego, genera un archivo HTML con los estilos personalizados especificados por el usuario.