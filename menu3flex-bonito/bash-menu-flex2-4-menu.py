def display_options():
    print("Opciones:")
    options = [
        "Introduce el tipo de display para el contenedor (por ejemplo, 'flex', 'block', 'inline-flex', etc.) (actual: flex)",
        "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') (actual: row)",
        "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') (actual: nowrap)",
        "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') (actual: flex-start)",
        "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') (actual: stretch)",
        "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') (actual: flex-start)",
        "Introduce el ancho de los elementos flexibles (por ejemplo, '100px') (actual: 100px)",
        "Introduce la altura de los elementos flexibles (por ejemplo, '100px') (actual: 100px)",
        "Introduce el margen entre los elementos flexibles (por ejemplo, '10px') (actual: 10px)",
        "Introduce el color de fondo de los elementos (por ejemplo, 'lightgray') (actual: lightgray)",
        "Introduce el color de fondo de la caja centrada (por ejemplo, 'lightblue') (actual: lightblue)",
        "Introduce la visualización flex de la caja centrada (por ejemplo, 'flex') (actual: flex)",
        "Introduce el alineamiento vertical (align-items) de la caja centrada (actual: center)",
        "Introduce el alineamiento horizontal (justify-content) de la caja centrada (actual: center)",
        "Introduce la fuente de los elementos (por ejemplo, 'Arial, sans-serif') (actual: inherit)",
        "Introduce el tamaño de fuente de los elementos (por ejemplo, '16px') (actual: 16px)",
        "Introduce el relleno de los elementos (por ejemplo, '10px') (actual: 10px)",
        "Introduce el borde de los elementos (por ejemplo, '1px solid black') (actual: none)",
        "Introduce la sombra de los elementos (por ejemplo, '2px 2px 5px gray') (actual: none)",
        "Introduce la clase para el contenedor flex (actual: flex-container)",
        "Introduce la clase para los elementos flexibles (actual: flex-item)",
        "Introduce la clase para la caja centrada (actual: centered-box)"
    ]
    for i, option in enumerate(options, start=1):
        print(f"{i}. {option}")

def get_custom_values():
    display_options()

    GRID_DISPLAY = "flex"
    FLEX_DIRECTION = "row"
    FLEX_WRAP = "nowrap"
    JUSTIFY_CONTENT = "flex-start"
    ALIGN_ITEMS = "stretch"
    ALIGN_CONTENT = "flex-start"
    ITEM_WIDTH = "100px"
    ITEM_HEIGHT = "100px"
    ITEM_MARGIN = "10px"
    ITEM_BACKGROUND_COLOR = "lightgray"
    CENTERED_BOX_BACKGROUND_COLOR = "lightblue"
    CENTERED_BOX_DISPLAY = "flex"
    CENTERED_BOX_ALIGN = "center"
    CENTERED_BOX_JUSTIFY = "center"
    FONT_FAMILY = "inherit"
    FONT_SIZE = "16px"
    PADDING = "10px"
    BORDER = "none"
    BOX_SHADOW = "none"
    FLEX_CONTAINER_CLASS = "flex-container"
    FLEX_ITEM_CLASS = "flex-item"
    CENTERED_BOX_CLASS = "centered-box"

    while True:
        option = int(input("Ingrese el número de la opción que desea cambiar (0 para salir): "))
        if option == 0:
            print("Saliendo...")
            break
        elif option == 1:
            GRID_DISPLAY = input("Introduce el tipo de display para el contenedor (actual: flex): ") or "flex"
        elif option == 2:
            FLEX_DIRECTION = input("Introduce la dirección de los elementos flexibles (actual: row): ") or "row"
        elif option == 3:
            FLEX_WRAP = input("Introduce la propiedad flex-wrap (actual: nowrap): ") or "nowrap"
        elif option == 4:
            JUSTIFY_CONTENT = input("Introduce la propiedad justify-content (actual: flex-start): ") or "flex-start"
        # Continue the pattern for the other options...
        else:
            print("Opción no válida. Por favor, seleccione un número válido.")

    return (
        GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT,
        ITEM_WIDTH, ITEM_HEIGHT, ITEM_MARGIN, ITEM_BACKGROUND_COLOR, CENTERED_BOX_BACKGROUND_COLOR,
        CENTERED_BOX_DISPLAY, CENTERED_BOX_ALIGN, CENTERED_BOX_JUSTIFY, FONT_FAMILY, FONT_SIZE,
        PADDING, BORDER, BOX_SHADOW, FLEX_CONTAINER_CLASS, FLEX_ITEM_CLASS, CENTERED_BOX_CLASS
    )

def generate_html_file(values):
    (
        GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT,
        ITEM_WIDTH, ITEM_HEIGHT, ITEM_MARGIN, ITEM_BACKGROUND_COLOR, CENTERED_BOX_BACKGROUND_COLOR,
        CENTERED_BOX_DISPLAY, CENTERED_BOX_ALIGN, CENTERED_BOX_JUSTIFY, FONT_FAMILY, FONT_SIZE,
        PADDING, BORDER, BOX_SHADOW, FLEX_CONTAINER_CLASS, FLEX_ITEM_CLASS, CENTERED_BOX_CLASS
    ) = values

    with open("mi_archivo.html", "w") as file:
        file.write(f'''<!DOCTYPE html>
<html>
<head>
<style>
.{FLEX_CONTAINER_CLASS} {{
  display: {GRID_DISPLAY};
  flex-direction: {FLEX_DIRECTION};
  flex-wrap: {FLEX_WRAP};
  justify-content: {JUSTIFY_CONTENT};
  align-items: {ALIGN_ITEMS};
  align-content: {ALIGN_CONTENT};
  font-family: {FONT_FAMILY};
  font-size: {FONT_SIZE};
  padding: {PADDING};
  border: {BORDER};
  box-shadow: {BOX_SHADOW};
}}

.{FLEX_ITEM_CLASS} {{
  width: {ITEM_WIDTH};
  height: {ITEM_HEIGHT};
  margin: {ITEM_MARGIN};
  background-color: {ITEM_BACKGROUND_COLOR};
}}

.{CENTERED_BOX_CLASS} {{
  width: {ITEM_WIDTH};
  height: {ITEM_HEIGHT};
  background-color: {CENTERED_BOX_BACKGROUND_COLOR};
  display: {CENTERED_BOX_DISPLAY};
  align-items: {CENTERED_BOX_ALIGN};
  justify-content: {CENTERED_BOX_JUSTIFY};
}}
</style>
</head>
<body>
<div class="{FLEX_CONTAINER_CLASS}">
  <div class="{FLEX_ITEM_CLASS}">1</div>
  <div class="{FLEX_ITEM_CLASS}">2</div>
  <div class="{CENTERED_BOX_CLASS}">Centered</div>
</div>
</body>
</html>''')

custom_values = get_custom_values()
generate_html_file(custom_values)
