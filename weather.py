import requests
import matplotlib.pyplot as plt

data = requests.get("https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/17/lat/59/data.json").json()

temperature_data = [[i['values'][0] for i in data['timeSeries'][j]['parameters'] if i['name'] == 't'] for j in range(len(data['timeSeries']))]

print(f"Temperaturen imorgon vid denna tid kommer vara {temperature_data[24][0]}C")

x = range(24)
y = [i[0] for i in temperature_data[:24]]

plt.scatter(x, y)
plt.plot(x, y)
plt.show()