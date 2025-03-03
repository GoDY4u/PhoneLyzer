# 📞 PhoneLyzer 🕵️‍♂️

This **Bash** script allows you to retrieve information about phone numbers using Google's **libphonenumber** library. It provides details such as location, carrier, country code, and time zone.

---

## 📜 Description

The script analyzes a given phone number and returns relevant information, including:

- 📞 **National Format**
- 🌍 **Country Code**
- 📍 **Estimated Location**
- 🛜 **Carrier/ISP**
- ⏰ **Time Zone**
- ⌛ **And More...**

It uses **phonenumbers**, a Python library, to process the number and extract the information.

---

## 📋 Requirements

Before running the script, ensure you meet the following requirements:

- A **Linux/Unix** system with **Bash**.
- Python 3 installed.
- The `phonenumbers` library installed.

You can install the library with:

```bash
pip install phonenumbers
```

You also need to grant execution permissions to the script:
```bash
sudo chmod +x phonelyzer.sh
```

---

## 🚀 Usage

To run the script, simply provide the phone number as an argument:

### 📌 Syntax:
```bash
./phonelyzer.sh <+Prefix_Country><phone_number>
```

### 📌 Example:
```bash
./phonelyzer.sh +34666777888
```

If the number is valid, the script will return information like this:

```bash

🔍 === NUMBER INFORMATION ===
📞 National format: 666 77 78 88
🌐 International format: +34 666 77 78 88
⚡ E.164 format: +34666777888
🌍 Country: Spain (+34, ES)
🛜 Carrier/ISP: Vodafone
⏰ Time zone(s): Atlantic/Canary, Europe/Madrid
📱 Number type: 📱 Mobile
✅ Valid: Yes (A valid number can be dialed and is assigned to a real telephone)
🔍 Possible: Yes (A possible number matches the length and digit pattern of numbers in that region)

```

---

## 🛠 Configuration and Customization

If you want to modify the script, you can edit the Python block inside `phonelyzer.sh`. 
For example, to change the language of geolocation output, modify this line:

```python
location = geocoder.description_for_number(phone_number, 'en')  # Change 'en' to 'es' for Spanish
```

You can also adjust the output format by editing the `print()` statements in the script.

---

## ⚠️ Notes and Warnings

- 📌 The script works best with properly formatted numbers, including the country code (e.g., `+34` for Spain).
- 🚨 The accuracy of the information is not guaranteed, as it relies on the `libphonenumber` database.
- ❌ It does not provide private or personal data, only public information based on the number prefix.

---

📩 For any questions or suggestions, open an **issue** on GitHub.

---

## 🌍 Connect

If you liked this project, feel free to leave a ⭐ on the repository and share it with the community. 😃

---

## ⚡ Disclaimer ⚡

As the creator of this script, I **do not take any responsibility** for any damage, disruption, or legal consequences caused by its use. 
**You** (the user) are solely responsible for ensuring that you have proper authorization and permission before using the script. 
Misuse could result in criminal charges, and it is your responsibility to act within the boundaries of the law.
