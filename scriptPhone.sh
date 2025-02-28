#!/bin/bash

if [ -z "$1" ]; then
  echo "Por favor, introduce un número de teléfono como argumento."
  echo "Uso: $0 <numero_de_telefono>"
  exit 1
fi

PHONE_NUMBER="$1"

python3 -c "
import phonenumbers
from phonenumbers import geocoder, carrier, timezone

try:
    phone_number = phonenumbers.parse('$PHONE_NUMBER', 'ES')
    
    if not phonenumbers.is_valid_number(phone_number):
        print('El número no es válido para España.')
    else:
        nacional_number = phonenumbers.format_number(phone_number, phonenumbers.PhoneNumberFormat.NATIONAL)
        country_code = phone_number.country_code
        location = geocoder.description_for_number(phone_number, 'es')
        phone_carrier = carrier.name_for_number(phone_number, 'es')
        tz = timezone.time_zones_for_number(phone_number)
        timezone_str = tz[0] if tz else 'Desconocida'

        # Usamos comillas simples en los textos para evitar conflictos
        print(f'🔍 --Información del Número--')
        print(f'📞 Número Formateado: {nacional_number}')
        print(f'🌍 País (Código): +{country_code} (ES)')
        print(f'📍 Ubicación: {location if location else \"No disponible\"}')  # Comillas escapadas
        print(f'🛜 Operador/ISP: {phone_carrier if phone_carrier else \"No identificado\"}')
        print(f'⏰ Zona Horaria: {timezone_str}')

except Exception as e:
    print(f'❌ Error: {str(e)}')
"
