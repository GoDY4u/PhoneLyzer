#!/bin/bash

# Check if the number was passed as an argument
if [ -z "$1" ]; then
  echo "Please provide a phone number as an argument."
  echo "Usage: $0 <phone_number>"
  exit 1
fi

# Phone number to query
PHONE_NUMBER="$1"

# Python script to process the number with libphonenumber
python3 -c "
import phonenumbers
from phonenumbers import geocoder, carrier, timezone

try:
    phone_number = phonenumbers.parse('$PHONE_NUMBER', 'ES')
    
    # Number validation
    if not phonenumbers.is_valid_number(phone_number):
        print('The number is not valid for Spain.')
    else:
        # Get details
        national_number = phonenumbers.format_number(phone_number, phonenumbers.PhoneNumberFormat.NATIONAL)
        country_code = phone_number.country_code
        
        # Get location
        location = geocoder.description_for_number(phone_number, 'en')
        
        # Get carrier/ISP
        phone_carrier = carrier.name_for_number(phone_number, 'en')
        
        # Get timezone
        tz = timezone.time_zones_for_number(phone_number)
        timezone_str = tz[0] if tz else 'Unknown'

        # Display results
        print('🔍 ==Number Information==')
        print(f'📞 National Format: {national_number}')
        print(f'🌍 Country Code: +{country_code} (ES)')
        print(f'📍 Location: {location if location else \"Not available\"}')
        print(f'🛜 Carrier/ISP: {phone_carrier if phone_carrier else \"Not identified\"}')
        print(f'⏰ Timezone: {timezone_str}')

except Exception as e:
    print(f'❌ Error: {str(e)}')
"
