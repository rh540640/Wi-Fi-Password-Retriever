#!/bin/bash

echo "Retrieving saved Wi-Fi passwords..."

# Get a list of saved Wi-Fi connections
connections=$(nmcli connection show)

# Loop through the connections and extract the Wi-Fi SSID and password
while IFS= read -r line; do
  if [[ $line == *802-11-wireless.ssid* ]]; then
    ssid=$(echo $line | awk '{print $2}')
  elif [[ $line == *802-11-wireless-security.psk* ]]; then
    password=$(echo $line | awk '{print $2}')
    echo "Wi-Fi network: $ssid, Password: $password"
  fi
done <<< "$connections"
