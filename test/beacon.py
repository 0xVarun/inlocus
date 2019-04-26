import requests
import json

HOST = 'http://localhost:3000{}'

def device_register():
    url = '/api/device/register'
    body = { 'IMEI': 'DUMMY_IMEI', 'GAID': 'DUMMY_GAID', 'deviceId': 'DUMMY_DEVICE_ID' }
    header = { 'Content-Type': 'application/json' }
    dev_reg = requests.post(HOST.format(url), data=json.dumps(body), headers=header)

    print(dev_reg.status_code)

    return dev_reg.text
    # {"id":2,"deviceId":"DUMMY_DEVICE_ID"}

def user_register():
    url = '/api/user/register'
    body = { 'userId': 'DUMMY_USER_ID', 'mobileNo': 'DUMMY_NUMBER', 'emailId': 'DUMMY_EMAIL', 'deviceId': '2' }
    header = { 'Content-Type': 'application/json', 'x-app-api-key': 'AXFXD9S-EJCMQ2C-GNYNRSA-MVXTQH2' }
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
    

if __name__ == '__main__':
    # data = device_register()
    # user_register()
    # login()
    beacon()