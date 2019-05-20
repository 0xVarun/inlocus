import requests
import json

HOST = 'http://localhost:3000{}'
#HOST = 'https://inlocus.pinprox.com{}'

def device_register():
    url = '/api/device/register'
    print(HOST.format(url))
    body = { 'IMEI': 'DUMMY_IMEI', 'GAID': 'DUMMY_GAID', 'deviceId': 'DUMMY_DEVICE_ID' }
    header = { 'Content-Type': 'application/json' }
    dev_reg = requests.post(HOST.format(url), data=json.dumps(body), headers=header)

    print(dev_reg.status_code)

    return dev_reg.text
    # {"id":2,"deviceId":"DUMMY_DEVICE_ID"}

def user_register():
    url = '/api/user/register'
    body = { 'userId': 'DUMMY_USER_ID', 'mobileNo': 'DUMMY_NUMBER', 'emailId': 'DUMMY_EMAIL', 'deviceId': '1' }
    header = { 'Content-Type': 'application/json', 'x-app-api-key': 'AXFXD9S-EJCMQ2C-GNYNRSA-MVXTQH2' }
    # header = { 'Content-Type': 'application/json', 'x-app-api-key': 'VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ' }
    # VYR6VAY-PQV4EPF-JKRFWE8-CFENBGQ
    usr_reg = requests.post(HOST.format(url), data=json.dumps(body), headers=header)

    print(usr_reg.status_code)
    print(usr_reg.text)

    # {"appUserId":1}

def login():
    url = '/api/user/login'
    body = { 'userId': 1, 'deviceId': 'DUMMY_DEVICE_ID' }
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
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiRFVNTVlfVVNFUl9JRCIsIm1vYmlsZU5vIjoiRFVNTVlfTlVNQkVSIiwiZGV2aWNlSWQiOjIsImFwcElkIjoxLCJlbWFpbElkIjoiRFVNTVlfRU1BSUwiLCJpYXQiOjE1NTYyNjMxODMsImV4cCI6MTU4Nzc5OTE4M30.-9ABOXxpXomxaB-PDzT4tZqll1TCtX3XRIWRRKN6hlk'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    body = { 'latitude': '19.007711', 'longitude': '72.82958' }
    # body = { 'latitude': '27.173891', 'longitude': '78.042068' }
    # 27.173891, 78.042068.
    bea = requests.put(HOST.format(url), headers=headers, data=json.dumps(body))
    
    print(bea.status_code)
    print(bea.text)

def notify():
    url = '/api/notify/11'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiRFVNTVlfVVNFUl9JRCIsIm1vYmlsZU5vIjoiRFVNTVlfTlVNQkVSIiwiZGV2aWNlSWQiOjIsImFwcElkIjoxLCJlbWFpbElkIjoiRFVNTVlfRU1BSUwiLCJpYXQiOjE1NTYyNjMxODMsImV4cCI6MTU4Nzc5OTE4M30.-9ABOXxpXomxaB-PDzT4tZqll1TCtX3XRIWRRKN6hlk'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    bea = requests.get(HOST.format(url), headers=headers)
    
    print(bea.status_code)


def wifi():
    url = '/api/sensor/wifi/multi'
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiRFVNTVlfVVNFUl9JRCIsIm1vYmlsZU5vIjoiRFVNTVlfTlVNQkVSIiwiZGV2aWNlSWQiOjIsImFwcElkIjoxLCJlbWFpbElkIjoiRFVNTVlfRU1BSUwiLCJpYXQiOjE1NTYyNjMxODMsImV4cCI6MTU4Nzc5OTE4M30.-9ABOXxpXomxaB-PDzT4tZqll1TCtX3XRIWRRKN6hlk'
    headers = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }
    body = [
        {"bssid":"14:1f:ba:74:73:08","ssid":"Joispot-wifi","freq":-42,"rssi":0,"distance":2462},
        {"bssid":"78:32:1b:9a:e5:901","ssid":"Osmos","freq":-42,"rssi":0,"distance":2462},
        {"bssid":"24:f5:a2:15:8b:1a1","ssid":"Linksys01906","freq":-42,"rssi":0,"distance":2462}
    ]

    r = requests.put(HOST.format(url), headers=headers, data=json.dumps(body))
    # print(r.status_code)
    print(r.text)

if __name__ == '__main__':
    # data = device_register()
    #user_register()
    # login()
    # beacon()
    # location()
    # notify()
    wifi()