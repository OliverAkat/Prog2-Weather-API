import json

with open("data.json", "r") as f:
    data = json.loads(f.read())["timeSeries"]

for i in data:
    for j in i["parameters"]:
        if j["name"] == "t":
            print(j["values"][0])
