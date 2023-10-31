import os
import sys

# Definimos un diccionario con los valores predeterminados
default_values = {
    "grid_display": "flex",
    "flex_direction": "row",
    "flex_wrap": "nowrap",
    "justify_content": "flex-start",
    "align_items": "stretch",
    "align_content": "flex-start",
    "item_width": "100px",
    "item_height": "100px",
    "item_margin": "10px",
    "item_background_color": "lightgray",
    "centered_box_background_color": "lightblue",
    "centered_box_display": "flex",
    "centered_box_align": "center",
    "centered_box_justify": "center",
    "font_family": "inherit",
    "font_size": "16px",
    "padding": "10px",
    "border": "none",
    "box_shadow": "none",
    "output_file": "mi_archivo.html"
}

# Función para mostrar las opciones disponibles
def display_options():
  for i, (option, value) in enumerate(default_values.items()):
    print(f"{i + 1}. {option}: {value}")

# Función para obtener los valores personalizados
def get_custom_values():
  display_options()

  while True:
    try:
      option = int(input("Ingrese el número de la opción que desea cambiar (0 para salir): "))

      if option == 0:
        sys.exit()

      if option < 1 or option > len(default_values):
        raise ValueError

      value = input(f"Introduce el nuevo valor para {option}: ")
      default_values[option] = value
    except ValueError as e:
      print(e)

# Función para generar el archivo HTML
def generate_html():
  with open(default_values["output_file"], "w") as f:
    f.write(f"""<!DOCTYPE html>
<html>
<head>
<style>
.{default_values["grid_display"]} {
  display: {default_values["grid_display"]};
  flex-direction: {default_values["flex_direction"]};
  flex-wrap: {default_values["flex_wrap"]};
  justify-content: {default_values["justify_content"]};
  align-items: {default_values["align_items"]};
  align-content: {default_values["align_content"]};
  font-family: {default_values["font_family"]};
  font-size: {default_values["font_size"]};
  padding: {default_values["padding"]};
  border: {default_values["border"]};
  box-shadow: {default_values["box_shadow"]};
  /* ... (rest of the styles) */
}

.{default_values["flex_item_class"]} {
  width: {default_values["item_width"]};
  height: {default_values["item_height"]};
  margin: {default_values["item_margin"]};
  background-color: {default_values["item_background_color"]};
  /* ... (rest of the styles) */
}

.{default_values["centered_box_class"]} {
  width: {default_values["item_width"]};
  height: {default_values["item_height"]};
  background-color: {default_values["centered_box_background_color"]};
  /* ... (rest of the styles) */
}

/* ... (rest of the HTML code) */
</style>
</head>
<body>
/* ... (rest of the HTML code) */
</body>
</html>
""")

# Llamamos a las funciones
display_options()
get_custom_values()
generate_html()
