#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

logfile="website_status.log"

for site in "${websites[@]}"; do
    
    response=$(curl -Is --max-time 5 "$site" | head -n 1)
    
    status_code=$(echo "$response" | cut -d' ' -f2)

    if [ "$status_code" == "200" ]; then
        echo "$site працює" >> "$logfile"
    else
        echo "$site не працює" >> "$logfile"
    fi
done

echo "Результати збережено у файл: $logfile"