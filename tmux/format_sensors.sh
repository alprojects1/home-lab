#!/bin/bash 


# lm sensor power draw & sensor info parsed data

printf "%-15s" "Sensor" #keep it at 15, started from 20 

for i in {0..15}; do 

    printf "%-8s" "Core $i"  # Adjusted to 8 for spacing between each core header 

done 

echo 

# Initialize arrays to hold the temperature values and sensor details 

declare -A core_temp 

declare -A sensor_details 

# Parse the sensors output and fill the arrays 

while IFS= read -r line; do 

    if [[ "$line" =~ ^Core ]]; then 

        core_number=$(echo "$line" | awk '{print $2}' | cut -d":" -f1) 

        temp=$(echo "$line" | awk '{print $3}') 

        core_temp["Core$core_number"]=$temp 

    elif [[ "$line" =~ ^Package ]]; then 

        package_number=$(echo "$line" | awk '{print $3}') 

        temp=$(echo "$line" | awk '{print $4}') 

        sensor_details["Package$package_number"]=$temp 

    elif [[ "$line" =~ power1 ]]; then 

        power=$(echo "$line" | awk '{print $2, $3}') 

        sensor_details["Power Draw"]=$power 

    elif [[ "$line" =~ ^Adapter ]]; then 

        sensor_name=$(echo "$line" | awk '{print $2}') 

        sensor_details["Adapter"]=$sensor_name 

    fi 

done < <(sensors) 

 

# Ensure all cores from 0 to 15 are initialized 

for i in {0..15}; do 

    if [ -z "${core_temp[Core$i]}" ]; then 

        core_temp["Core$i"]="N/A" 

    fi 

done 

# Print Core temperatures with proper formatting 

printf "%-15s" "Cores" 

for i in {0..15}; do 

    printf "%-9s" "${core_temp[Core$i]}"  # Adjusted to 9 for spacing between each core value 

done 

echo 

# Print sensor details with proper formatting 

for key in "${!sensor_details[@]}"; do 

    printf "%-15s" "$key" 

    printf "%s\n" "${sensor_details[$key]}" 

done 
