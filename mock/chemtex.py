import json
import requests

url = """https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs&latlng=19.116230,72.909851&sensor=true"""
# url = """https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD0awMda5obf1OnLxaJ1gqghu2A19Fr7Bs&latlng=19.231077,72.971083&sensor=true"""

r = requests.get(url)

if r.status_code == 200:
	data = json.loads(r.text)

	for d in data['results']:
		# print('-'*20)
		print(d['formatted_address'])
		print('-'*20)


	# print(data['results'][0]['formatted_address'])