#!/bin/bash

# Define opciones sugeridas para cada variable o propiedad CSS
declare -A options
options["container-bg"]="burlywood white lightgray"
options["container-padding"]="10px 20px 5px"
options["container-border"]="2px solid black 1px dashed gray"
options["child-bg"]="gainsboro white lightblue"
options["child-width"]="100px 150px 80px"
options["child-margin"]="10px 15px 5px"
options["child-text-align"]="center left right"
options["child-line-height"]="75px 80px 60px"
options["child-font-size"]="30px 24px 36px"
options["child-border"]="2px solid black 1px dotted gray"
options["box-sizing"]="border-box content-box"
options["flex-container-display"]="flex inline-flex"
options["flex-container-flex-flow"]="row wrap column nowrap"
options["flex-container-justify-content"]="space-between flex-start center"
options["flex-container-align-items"]="stretch center flex-start"

# Función para mostrar opciones y obtener selección
select_option() {
    local var_name="$1"
    local current_value="${options[$var_name]}"
    local options_list="${options[$var_name]}"
    local options_array=($options_list)

    echo "Valor actual para $var_name: $current_value"
    echo "Opciones disponibles:"
    for ((i = 0; i < ${#options_array[@]}; i++)); do
        echo "$i. ${options_array[i]}"
    done

    read -p "Selecciona una opción (0-$((i - 1))) o presiona Enter para usar el valor actual: " selected_option

    if [[ -z "$selected_option" || ($selected_option -ge 0 && $selected_option -lt ${#options_array[@]}) ]]; then
        echo "${options_array[$selected_option]}"
    else
        echo "$current_value"
    fi
}

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
}

# Mostrar el menú para elegir valores por defecto o personalizados
echo "Seleccione una opción:"
echo "0. Valores por defecto"
echo "1. Personalizar valores"

read -p "Opción: " choice

# Comprueba la elección del usuario
if [ "$choice" == "0" ]; then
    # Valores por defecto
    declare -A default_values
    for var_name in "${!options[@]}"; do
        default_values["$var_name"]=$(echo "${options[$var_name]}" | cut -d ' ' -f 1)
    done

else
    # Personalizar valores
    for var_name in "${!options[@]}"; do
        current_value=$(select_option "$var_name")
        options["$var_name"]="$current_value"
    done

    # Solicitar valores personalizados
    get_custom_values
fi

# Crea un archivo HTML con las variables y propiedades actualizadas
cat > index-limpio-espanol-bash-con-variables.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flex</title>

    <style>
        :root {
            --box-sizing: ${options["box-sizing"]};
            --container-bg: ${options["container-bg"]};
            --container-padding: ${options["container-padding"]};
            --container-border: ${options["container-border"]};

            --child-bg: ${options["child-bg"]};
            --child-width: ${options["child-width"]};
            --child-margin: ${options["child-margin"]};
            --child-text-align: ${options["child-text-align"]};
            --child-line-height: ${options["child-line-height"]};
            --child-font-size: ${options["child-font-size"]};
            --child-border: ${options["child-border"]};
        }

        * {
            box-sizing: var(--box-sizing);
        }

        .flex-container {
            display: ${GRID_DISPLAY:-${options["flex-container-display"]}};
            flex-flow: ${FLEX_DIRECTION:-${options["flex-container-flex-flow"]}};
            justify-content: ${JUSTIFY_CONTENT:-${options["flex-container-justify-content"]}};
            align-items: ${ALIGN_ITEMS:-${options["flex-container-align-items"]}};
            background-color: var(--container-bg);
            padding: var(--container-padding);
            border: var(--container-border);
        }

        .flex-container div {
            background-color: var(--child-bg);
            width: var(--child-width};
            margin: var(--child-margin);
            text-align: var(--child-text-align);
            line-height: var(--child-line-height);
            font-size: var(--child-font-size);
            border: var(--child-border);
        }
    </style>
</head>
<body>
<div class "flex-container">
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>9</div>
    <div>10</div>
</div>
</body>
</html>
EOF

# Muestra un mensaje de confirmación
echo "Archivo HTML creado: index-limpio-espanol-bash-con-variables.html"
