#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a phone number."
  echo "Usage: $0 <phone_number> [country_code]"
  exit 1
fi

PHONE_NUMBER="$1"
REGION="${2:-ES}"  # Default country code: Spain (ES)

python3 -c "
import phonenumbers
from phonenumbers import geocoder, carrier, timezone
from phonenumbers.phonenumberutil import PhoneNumberType, number_type

try:
    phone_number = phonenumbers.parse(\"$PHONE_NUMBER\", \"$REGION\")
    
    # Basic validations
    is_valid = phonenumbers.is_valid_number(phone_number)
    is_possible = phonenumbers.is_possible_number(phone_number)
    
    if not is_valid:
        print(\"❌ Invalid number for the specified region\")
    else:
        # Number formats
        national_format = phonenumbers.format_number(phone_number, phonenumbers.PhoneNumberFormat.NATIONAL)
        international_format = phonenumbers.format_number(phone_number, phonenumbers.PhoneNumberFormat.INTERNATIONAL)
        e164_format = phonenumbers.format_number(phone_number, phonenumbers.PhoneNumberFormat.E164)
        
        # Geographic information
        region_code = phonenumbers.region_code_for_number(phone_number)
        country_code = phone_number.country_code
        location = geocoder.description_for_number(phone_number, \"en\")  # In English
        country_name = geocoder.country_name_for_number(phone_number, \"en\")
        
        # Carrier and number type
        carrier_name = carrier.name_for_number(phone_number, \"en\")
        num_type = number_type(phone_number)  # Correction here
        number_types = {
            PhoneNumberType.MOBILE: \"📱 Mobile\",
            PhoneNumberType.FIXED_LINE: \"🏠 Landline\",
            PhoneNumberType.TOLL_FREE: \"🆓 Toll-Free\",
            PhoneNumberType.PREMIUM_RATE: \"💎 Premium\",
            PhoneNumberType.SHARED_COST: \"🤝 Shared Cost\",
            PhoneNumberType.VOIP: \"🌐 VoIP\",
            PhoneNumberType.PERSONAL_NUMBER: \"👤 Personal\",
            PhoneNumberType.PAGER: \"📟 Pager\",
            PhoneNumberType.UAN: \"🏢 UAN\",
            PhoneNumberType.UNKNOWN: \"❓ Unknown\"
        }
        
        # Time zones
        time_zones = timezone.time_zones_for_number(phone_number)
        
        # Display information
        print(\"🔍 === DETAILED INFORMATION ===\")
        print(f\"📞 National format: {national_format}\")
        print(f\"🌐 International format: {international_format}\")
        print(f\"⚡ E.164 format: {e164_format}\")
        print(f\"🌍 Country: {country_name} (+{country_code}, {region_code})\")
        print(f\"📍 Location: {location if location else 'Not available'}\")
        print(f\"🛜 Carrier: {carrier_name if carrier_name else 'Not identified'}\")
        print(f\"⏰ Time zone(s): {', '.join(time_zones) if time_zones else 'Unknown'}\")
        print(f\"📱 Number type: {number_types.get(num_type, 'Unknown')}\")
        
        # Explanation for validity and possibility
        print(f\"✅ Valid: {'Yes' if is_valid else 'No'} (A valid number can be dialed and is assigned to a real telephone)\")
        print(f\"🔍 Possible: {'Yes' if is_possible else 'No'} (A possible number matches the length and digit pattern of numbers in that region)\")
        
        print(\"=\"*30)

except Exception as e:
    print(f\"❌ Error: {str(e)}\")
    exit(1)
"
