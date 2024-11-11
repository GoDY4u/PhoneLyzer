# PhoneCarrierLookUp


¿Cómo usar libphonenumber en bash?
Instalar libphonenumber:

La biblioteca está disponible en varios lenguajes de programación (Java, Python, C++, JavaScript, etc.). Para usarla en bash, lo más sencillo es utilizar una herramienta en Python, que puedes invocar desde un script de bash.

Si no tienes Python instalado, puedes instalarlo con:

bash
Copiar código
sudo apt install python3 python3-pip
Instalar el paquete phonenumbers en Python:

bash
Copiar código
pip3 install phonenumbers
Crear el script en Bash que usa libphonenumber a través de Python:

Aquí te dejo un ejemplo de cómo podrías hacer esto con un pequeño script de Python invocado desde bash:

Script de Bash con Python para libphonenumber
bash
Copiar código
#!/bin/bash

# Verificar si el número fue pasado como argumento
if [ -z "$1" ]; then
  echo "Por favor, introduce un número de teléfono como argumento."
  echo "Uso: $0 <numero_de_telefono>"
  exit 1
fi

# Número de teléfono a consultar
PHONE_NUMBER="$1"

# Script de Python para procesar el número con libphonenumber
python3 -c "
import phonenumbers
from phonenumbers import geocoder, carrier

# El número de teléfono
phone_number = phonenumbers.parse('$PHONE_NUMBER', 'ES')

# Validación del número
if not phonenumbers.is_valid_number(phone_number):
    print('El número no es válido.')
else:
    # Obtener la región
    location = geocoder.description_for_number(phone_number, 'es')
    # Obtener el operador
    phone_carrier = carrier.name_for_number(phone_number, 'es')

    print(f'Número: {phone_number.national_number}')
    print(f'Ubicación: {location}')
    print(f'Operador: {phone_carrier}')
"
¿Cómo funciona?
El script de Bash recibe el número de teléfono como argumento.
Luego ejecuta un pequeño script en Python que usa la biblioteca phonenumbers para analizar el número.
Usa la función phonenumbers.parse() para analizar el número de teléfono.
Usa geocoder.description_for_number() para obtener la ubicación (ciudad/región) del número.
Usa carrier.name_for_number() para obtener el operador (carrier).
Si el número es válido, se imprime la información de la ubicación y el operador.
Ejemplo de uso:
bash
Copiar código
./lookup.sh 612345678
Salida esperada:
makefile
Copiar código
Número: 612345678
Ubicación: Madrid
Operador: Movistar
Dependencias:
Python: Para ejecutar el script que utiliza libphonenumber.
phonenumbers: La biblioteca de Python que implementa las funcionalidades de libphonenumber.
bash
Copiar código
pip3 install phonenumbers
Opción 2: Otras herramientas de código abierto
Existen otros proyectos y herramientas de código abierto que permiten hacer validaciones de números, pero suelen ser menos completas que libphonenumber. Aquí te dejo algunas más que podrían interesarte:

PhoneNumberKit (para Swift, iOS):

Si trabajas con desarrollo en iOS, esta es una implementación de libphonenumber en Swift.
Proyecto en GitHub: PhoneNumberKit
Phone Number Utils (para JavaScript):

Una versión de libphonenumber para JavaScript.
Proyecto en GitHub: google/libphonenumber
Conclusión
Si prefieres una solución completamente de código abierto sin depender de servicios de pago o APIs externas, libphonenumber es tu mejor opción. Aunque no te proporcionará la información exacta sobre el operador (carrier) sin una API de terceros, sí te permitirá obtener la validez del número y la región del teléfono, lo que puede ser suficiente en muchos casos.

Si necesitas detalles más completos como el operador o información de geolocalización precisa, tendrás que recurrir a servicios externos como las APIs de numverify o Twilio, o montar tu propio servicio con bases de datos de operadores telefónicos, pero eso generalmente implica más trabajo y complejidad.



















# Carrier Phone Lookup para Números de España

Este es un script que permite obtener información sobre el **operador** y la **ubicación** de un número de teléfono móvil en **España** utilizando la biblioteca de código abierto [libphonenumber](https://github.com/google/libphonenumber) a través de su implementación en Python, `phonenumbers`.

El script valida y procesa números de teléfono móviles españoles y devuelve información relevante como el operador y la ubicación (ciudad/región) del número.

## Requisitos

Antes de ejecutar el script, necesitarás tener instalados los siguientes programas y bibliotecas:

- **Python 3**: Asegúrate de tener Python 3 y `pip` instalados.
- **Biblioteca `phonenumbers`**: Esta biblioteca se utiliza para validar números de teléfono y extraer información como la ubicación y el operador.

### Instalación

1. **Instala Python 3** (si no lo tienes ya instalado):

   En sistemas basados en **Debian/Ubuntu**:

   ```bash
   sudo apt update
   sudo apt install python3 python3-pip










Instala la biblioteca phonenumbers:

Ejecuta el siguiente comando para instalar la biblioteca necesaria:

bash
Copiar código
pip3 install phonenumbers













Uso
El script toma un número de teléfono español como argumento y devuelve la ubicación (ciudad/región) y el operador (carrier).

Ejemplo de ejecución:
Clona el repositorio:

bash
Copiar código
git clone https://github.com/TuUsuario/TuRepositorio.git
cd TuRepositorio
Da permisos de ejecución al script (si no los tiene):

bash
Copiar código
chmod +x lookup.sh
Ejecuta el script pasando un número de teléfono español como argumento:

bash
Copiar código
./lookup.sh 612345678
Ejemplo de salida:

makefile
Copiar código
Número: 612345678
Ubicación: Madrid
Operador: Movistar
Descripción del proceso
Validación: El script utiliza la función phonenumbers.is_valid_number() para verificar si el número es válido para España.
Ubicación: La función geocoder.description_for_number() devuelve la ubicación del número (como la ciudad o región).
Operador: La función carrier.name_for_number() devuelve el nombre del operador de telecomunicaciones.
Formato del número de teléfono
El número de teléfono debe ingresarse en formato nacional, es decir, sin el prefijo internacional (+34), solo el número de teléfono:

bash
Copiar código
./lookup.sh 612345678
Licencia
Este proyecto está licenciado bajo la Licencia Apache 2.0. Puedes usar, modificar y distribuir este código según los términos de dicha licencia.

¡Espero que te sea útil este script! Si tienes algún problema o pregunta, no dudes en abrir un issue en GitHub o hacer un pull request con mejoras.











### Descripción del `README.md`:

- **Título y Descripción**: Explica de qué se trata el proyecto, qué hace el script y qué tecnología utiliza.
- **Requisitos**: Detalla las dependencias necesarias (Python 3 y la biblioteca `phonenumbers`).
- **Instalación**: Instrucciones claras para instalar Python y la biblioteca requerida.
- **Uso**: Explica cómo clonar el repositorio, dar permisos de ejecución al script y ejecutarlo.
- **Licencia**: Se menciona que el proyecto está bajo la Licencia Apache 2.0, ya que `libphonenumber` tiene esa licencia.

### ¿Cómo puedes personalizarlo?

- **Nombre del repositorio**: Asegúrate de cambiar el enlace de GitHub (`https://github.com/TuUsuario/TuRepositorio.git`) por el nombre de tu propio repositorio.
- **Instrucciones adicionales**: Si haces modificaciones o agregas más funcionalidades, puedes actualizar la sección de uso o agregar nuevos ejemplos.

Este `README.md` debería ser suficiente para que los usuarios entiendan qué hace el proyecto, cómo instalarlo y cómo usarlo. ¡Espero que te sea útil para tu repositorio! Si necesitas más cambios o detalles, avísame.


