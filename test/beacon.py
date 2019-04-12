import sys
import json
import requests


def login():
    DEVICE_ID = 'defn24ijqeif2f'
    USER_ID = 1

    LOGIN_BODY = {
        "userId": USER_ID,
        "deviceId": DEVICE_ID
    }
    LOGIN_HEADERS = {
        'Content-Type': 'application/json',
        'x-app-api-key': 'KHK9J4K-AGQ4BY7-K94B4G8-WQTFWGJ'
    }

    login = requests.post('http://13.127.205.229/api/user/login', headers=LOGIN_HEADERS, data=json.dumps(LOGIN_BODY))
    
    if login.status_code != 200:
        print('Login Failed')
        sys.exit(1)

    token_payload = json.loads(login.text)
    return token_payload['token']

def beacon():
    
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklkIjoiVEVTVCIsIm1vYmlsZU5vIjoiODg3OTM0OTUyMSIsImRldmljZUlkIjoxLCJhcHBJZCI6MSwiZW1haWxJZCI6InZ0ZXdhcmkyNkBnbWFpbC5jb20iLCJpYXQiOjE1NTMyMzU4MzAsImV4cCI6MTU4NDc3MTgzMH0.n_WVKw1Iq3eUSfhjvBUjz7tMPii3XkF_juVEDa_FBmg' #token_payload['token']
    
    SENSOR_HEADERS = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer {}'.format(token)
    }

    BEACON_BODY = {   
        "major": "36287", #36287
        "minor": "18995", #18995
        "rssi": 14845484,
        "uuid": "f7826da6-4fa2-4e98-8024-bc5b71e0893e",
        "distance": 3
    }
    
    beacon = requests.put('http://13.127.205.229/api/sensor/beacon', headers=SENSOR_HEADERS, data=json.dumps(BEACON_BODY))
    print(beacon.text)

if __name__ == '__main__':
    beacon()
