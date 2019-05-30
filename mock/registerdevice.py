import requests
import json

HOST = 'https://inlocus.pinprox.com{}'

def device_register():
    url = '/api/device/register'
    print(HOST.format(url))
    body = { 'IMEI': '356645081376511', 'GAID': 'iPhone 6s iOS 12.2, iPhone', 'deviceId': '356645081376511' }
    header = { 'Content-Type': 'application/json' }
    dev_reg = requests.post(HOST.format(url), data=json.dumps(body), headers=header)

    print(dev_reg.status_code)

    return dev_reg.text
    # {"id":30,"deviceId":"356645081376511"}

def user_register():
    url = '/api/user/register'
    body = { 'userId': '30', 'mobileNo': 'VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ', 'emailId': 'iphone-siddhant.com', 'deviceId': '30' }
    header = { 'Content-Type': 'application/json', 'x-app-api-key': 'VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ' }
    # header = { 'Content-Type': 'application/json', 'x-app-api-key': 'VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ' }
    # VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ
    usr_reg = requests.post(HOST.format(url), data=json.dumps(body), headers=header)

    print(usr_reg.status_code)
    print(usr_reg.text)

    # {"appUserId":1}
    # {"appUserId":24}


def login():
    url = '/api/user/login'
    body = { 'userId': 24, 'deviceId': '356645081376511' }
    header = { 'Content-Type': 'application/json', 'x-app-api-key': 'AXFXD9S-EJCMQ2C-GNYNRSA-MVXTQH2' }
    login_req = requests.post(HOST.format(url), headers=header, data=json.dumps(body))

    print(login_req.status_code)
    print(login_req.text)     

    # {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiRFVNTVlfVVNFUl9JRCIsIm1vYmlsZU5vIjoiRFVNTVlfTlVNQkVSIiwiZGV2aWNlSWQiOjIsImFwcElkIjoxLCJlbWFpbElkIjoiRFVNTVlfRU1BSUwiLCJpYXQiOjE1NTYyNjMxODMsImV4cCI6MTU4Nzc5OTE4M30.-9ABOXxpXomxaB-PDzT4tZqll1TCtX3XRIWRRKN6hlk"}

def beacon():
    url = '/api/sensor/beacon'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiRFVNTVlfVVNFUl9JRCIsIm1vYmlsZU5vIjoiRFVNTVlfTlVNQkVSIiwiZGV2aWNlSWQiOjIsImFwcElkIjoxLCJlbWFpbElkIjoiRFVNTVlfRU1BSUwiLCJpYXQiOjE1NTYyNjMxODMsImV4cCI6MTU4Nzc5OTE4M30.-9ABOXxpXomxaB-PDzT4tZqll1TCtX3XRIWRRKN6hlk'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    body = { 'major': '9481', 'minor': '1587', 'uuid': 'snjsndjsndjnajsndjnasdj', 'rssi': -1542975, 'distance': 5 }
    bea = requests.put(HOST.format(url), headers=headers, data=json.dumps(body))
    
    print(bea.status_code)
    print(bea.text)
    
def location():
    url = '/api/sensor/location'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJJZCI6IjIyIiwibW9iaWxlTm8iOiIzNTg5NTgwNjcyMDgxMzkiLCJkZXZpY2VJZCI6MjIsImFwcElkIjoyLCJlbWFpbElkIjoiTW90byBHICg1KSBQbHVzLmNvbSIsImlhdCI6MTU1ODA3NjcxNiwiZXhwIjoxNTg5NjEyNzE2fQ.2zmWrqFnma_xghzxK46dAH76W41S6syYlihD_Ovlv9k'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    body = { 'latitude': '19.119896460324526', 'longitude': '72.91322736069561' }
    # body = { 'latitude': '27.173891', 'longitude': '78.042068' }
    # 27.173891, 78.042068.
    bea = requests.put(HOST.format(url), headers=headers, data=json.dumps(body))
    
    print(bea.status_code)
    print(bea.text)

def notify():
    url = '/api/notify/11'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwidXNlcklkIjoiOSIsIm1vYmlsZU5vIjoiODYyMTAzMDMwNTk4MDg5IiwiZGV2aWNlSWQiOjksImFwcElkIjoxLCJlbWFpbElkIjoiUmVkbWkgTm90ZSA0LmNvbSIsImlhdCI6MTU1NzIxODU0NiwiZXhwIjoxNTg4NzU0NTQ2fQ.O13amDeSDbGbX6bM6zjxNYMxeQoQxwRel7NOya50KnQ'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    bea = requests.get(HOST.format(url), headers=headers)
    
    print(bea.status_code)


def wifi():
    url = '/api/sensor/wifi/multi'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJJZCI6IjIyIiwibW9iaWxlTm8iOiIzNTg5NTgwNjcyMDgxMzkiLCJkZXZpY2VJZCI6MjIsImFwcElkIjoyLCJlbWFpbElkIjoiTW90byBHICg1KSBQbHVzLmNvbSIsImlhdCI6MTU1ODA3NjcxNiwiZXhwIjoxNTg5NjEyNzE2fQ.2zmWrqFnma_xghzxK46dAH76W41S6syYlihD_Ovlv9k'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    body = [
        {"bssid":"18:a6:f7:67:78:d6","ssid":"Beaconstalk","freq":-42,"rssi":0,"distance":2462},
        {"bssid":"78:32:1b:9a:e5:901","ssid":"Osmos","freq":-42,"rssi":0,"distance":2462},
        {"bssid":"24:f5:a2:15:8b:1a1","ssid":"Linksys01906","freq":-42,"rssi":0,"distance":2462}
    ]

    r = requests.put(HOST.format(url), headers=headers, data=json.dumps(body))
    print(r.status_code)
    print(r.text)

if __name__ == '__main__':
    # data = device_register()
    # user_register()
    login()
    # beacon()
    # location()
    # notify()
    # wifi()  

# LAT: 19.119896460324526, 72.91322736069561
# 8
# INSIDE false
