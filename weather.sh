rm data.json > /dev/null
 
wget -q https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/17/lat/59/data.json

echo "det kommer att vara $(./jq-linux64 '.timeSeries[24].parameters[1].values[0]' data.json) grader C imorgon vid den här tiden"
