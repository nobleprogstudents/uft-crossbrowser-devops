#!/bin/sh

# Mostramos mensaje inicial para identificar el inicio de la validación.
echo "Validando disponibilidad de Selenium Grid..."

# Definimos la URL interna del Grid.
# Esta URL funciona desde Jenkins porque Jenkins y Selenium Grid están en la misma red de Docker Compose.
GRID_URL="http://selenium-hub:4444/status"

# Mostramos la URL que se va a consultar.
echo "Consultando: $GRID_URL"

# Consultamos el endpoint /status de Selenium Grid.
# Si el Grid responde correctamente, curl imprimirá el JSON de estado.
curl -s "$GRID_URL"

# Imprimimos salto de línea para que el log de Jenkins quede más legible.
echo ""

# Mensaje final de validación.
echo "Validación de Selenium Grid finalizada."