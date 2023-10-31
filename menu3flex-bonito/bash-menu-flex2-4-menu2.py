def generate_html_file(styles):
    with open("mi_archivo.html", "w") as file:
        file.write(f'''<!DOCTYPE html>
<html>
<head>
<style>
/* CSS styles based on user-defined values */
.flex-container {{
  {styles["GRID_DISPLAY"]}: {styles.get("GRID_DISPLAY_VAL", "flex")};
  flex-direction: {styles.get("FLEX_DIRECTION", "row")};
  flex-wrap: {styles.get("FLEX_WRAP", "nowrap")};
  justify-content: {styles.get("JUSTIFY_CONTENT", "flex-start")};
  align-items: {styles.get("ALIGN_ITEMS", "stretch")};
  align-content: {styles.get("ALIGN_CONTENT", "flex-start")};
  font-family: {styles.get("FONT_FAMILY", "inherit")};
  font-size: {styles.get("FONT_SIZE", "16px")};
  padding: {styles.get("PADDING", "10px")};
  border: {styles.get("BORDER", "none")};
  box-shadow: {styles.get("BOX_SHADOW", "none")};
}}

.flex-item {{
  width: {styles.get("ITEM_WIDTH", "100px")};
  height: {styles.get("ITEM_HEIGHT", "100px")};
  margin: {styles.get("ITEM_MARGIN", "10px")};
  background-color: {styles.get("ITEM_BACKGROUND_COLOR", "lightgray")};
}}

.centered-box {{
  width: {styles.get("ITEM_WIDTH", "100px")};
  height: {styles.get("ITEM_HEIGHT", "100px")};
  background-color: {styles.get("CENTERED_BOX_BACKGROUND_COLOR", "lightblue")};
  display: {styles.get("CENTERED_BOX_DISPLAY", "flex")};
  align-items: {styles.get("CENTERED_BOX_ALIGN", "center")};
  justify-content: {styles.get("CENTERED_BOX_JUSTIFY", "center")};
}}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="centered-box">Centered</div>
</div>
</body>
</html>''')

# User input for custom values
user_styles = {
    "GRID_DISPLAY": "display",
    "FLEX_DIRECTION": "flex-direction",
    "FLEX_WRAP": "flex-wrap",
    "JUSTIFY_CONTENT": "justify-content",
    "ALIGN_ITEMS": "align-items",
    "ALIGN_CONTENT": "align-content",
    "ITEM_WIDTH": "width",
    "ITEM_HEIGHT": "height",
    "ITEM_MARGIN": "margin",
    "ITEM_BACKGROUND_COLOR": "background-color",
    "CENTERED_BOX_BACKGROUND_COLOR": "centered-box-bg-color",
    "CENTERED_BOX_DISPLAY": "centered-box-display",
    "CENTERED_BOX_ALIGN": "centered-box-align",
    "CENTERED_BOX_JUSTIFY": "centered-box-justify",
    "FONT_FAMILY": "font-family",
    "FONT_SIZE": "font-size",
    "PADDING": "padding",
    "BORDER": "border",
    "BOX_SHADOW": "box-shadow"
}

while True:
    for key, value in user_styles.items():
        user_input = input(f"Ingrese el valor para '{value}' (0 para salir): ")
        if user_input == "0":
            generate_html_file(user_styles)
            print("Saliendo...")
            break
        user_styles[key + "_VAL"] = user_input
