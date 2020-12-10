#!/bin/sh

sink=$(pacmd list-sinks | grep device.description | grep -Eo '"[^"]+"' | tr -d '"' | dmenu)
sinkid=$(pacmd list-sinks | grep -e "index" -e "device.description" | grep -B 1 "$sink" | grep index | grep -Eo '[0-9]+')

pacmd set-default-sink $sinkid
for index in $(pacmd list-sink-inputs | grep index | grep -Eo '[0-9]+'); do
    echo $index "->" $sinkid
    pacmd move-sink-input $index $sinkid
done
