#!/bin/bash
rm data.json > /dev/null
wget -q https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/17/lat/59/data.json

declare -A temps

for i in {0..23}; do
    for j in {0..18}; do
        current=$(./jq-linux64 ".timeSeries[$i].parameters[$j].name" data.json)
        if [[ "$current" == "\"t\"" ]]; then
            temps[$i]=`./jq-linux64 ".timeSeries[$i].parameters[$j].values[0]" data.json`
        fi
    done
    k=$(expr $i + 1)
    echo "$(echo $(expr 100 / 22) \* $k | bc)% done"
done

for i in {0..23}; do
    echo "temperaturen kommer vara ${temps[$i]} $(date --date="+$i hours" +"%d/%m/%y %H:00")"
done
