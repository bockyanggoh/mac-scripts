#/bin/bash

target="$1"

if [[ -z $target ]]; then
    lowest_ping_world_name=""
    lowest_ping=10000000.0
    ping_array=()
    world_array=()
    echo "Running...."
    for world in {1..259}
    do
        world_link="world${world}.runescape.com"
        
        if output=$(ping $world_link -c 1 | grep -o 'time=[[:digit:]]\+\.[[:digit:]]\+' | awk -F= '{ print $NF}') ; then
            if (( $(echo "$output < $lowest_ping" |bc -l) )); then
                lowest_ping=$output
                lowest_ping_world_name=$world_link
            fi
        else
            echo "Skipping World ${world_link} because it doesn't exist"
        fi
    done



    echo "Evaluation Ended! Here are the results"
    echo "--------------------------------------"
    echo "Best World: ${lowest_ping_world_name}"
    echo "Lowest Ping: ${lowest_ping} ms"
    echo "--------------------------------------"
else
    world_link="world${target}.runescape.com"
    output=$(ping $world_link -c 1 | grep -o 'time=[[:digit:]]\+\.[[:digit:]]\+' | awk -F= '{ print $NF}')
    echo "World: ${world_link}, Ping: $output ms"
fi
