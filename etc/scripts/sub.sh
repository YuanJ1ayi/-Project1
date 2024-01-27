#!/bin/bash
function sub() {
    read -p "Type the topic_name: " topic_name
    read -p "Type the file_name.csv: " file_name
    read -p "Type the rate of data publication (e.g., 1 Hz): " rate


    echo "Subscribing to topic: $topic_name"
    echo "Logging data to: $file_name"
    echo "Data publication rate: $rate"

 
 
    previous_topics=(/drone/pose /drone/velocity /drone/battery)

    
    for topic in "${previous_topics[@]}"; do
        echo "$topic" >> "$file_name"
    done

    echo "Subscription and logging completed."
}

sub
