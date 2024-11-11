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
try:
    phone_number = phonenumbers.parse('$PHONE_NUMBER', 'ES')
    
    # Validación del número
    if not phonenumbers.is_valid_number(phone_number):
        print('El número no es válido para España.')
    else:
        # Obtener la región
        location = geocoder.description_for_number(phone_number, 'es')
        # Obtener el operador
        phone_carrier = carrier.name_for_number(phone_number, 'es')

        print(f'Número: {phone_number.national_number}')
        print(f'Ubicación: {location}')
        print(f'Operador: {phone_carrier}')

except phonenumbers.phonenumberutil.NumberParseException:
    print('El número no es válido o está mal formateado.')
"
