import requests
import json

class NonInlocus(object):
    def __init__(self):
        # self.register()
        # self.user_register()
        # self.login()
        self.beacon()

    # {"id":2,"deviceId":"TESTINGDEVICEID"}

    def register(self):
        register_payload_device = {
            "IMEI": "TESTINGIMEI",
            "GAID": "TESTGAID",
            "deviceId": "TESTINGDEVICEID"
        }

        headers = {
            'Content-Type': 'application/json'
        }

        r = requests.post("http://13.127.205.229/api/device/register", headers=headers, data=json.dumps(register_payload_device))
        print(r.text)


    # {"appUserId":2}
    def user_register(self):
        headers = {
            'Content-Type': 'application/json',
            'x-app-api-key': '0V4VMXP-WQJ497N-Q17SBTS-99KXYVK'
        }

        user_payload = {
            "userId": "TESTINGUSERID",
            "mobileNo": "9787464656",
            "emailId": "lol@Lol.com",
            "deviceId": 16
        }

        r = requests.post("http://13.127.205.229/api/user/register", headers=headers, data=json.dumps(user_payload))
        print(r.text)

    # eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcklkIjoiVEVTVElOR1VTRVJJRCIsIm1vYmlsZU5vIjoiOTc4NzQ2NDY1NiIsImRldmljZUlkIjoyLCJhcHBJZCI6MywiZW1haWxJZCI6ImxvbEBMb2wuY29tIiwiaWF0IjoxNTUzNDk1NTkyLCJleHAiOjE1ODUwMzE1OTJ9.lb88qYg9hHIh5DyrxvryGwK8mgLGCqf0eLIR81Zvv0E
    
    # eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywidXNlcklkIjoiVEVTVElOR1VTRVJJRCIsIm1vYmlsZU5vIjoiOTc4NzQ2NDY1NiIsImRldmljZUlkIjoxNiwiYXBwSWQiOjIsImVtYWlsSWQiOiJsb2xATG9sLmNvbSIsImlhdCI6MTU1NDI3MjM3MywiZXhwIjoxNTg1ODA4MzczfQ.EEaxFMTyUfTvrmalUZevYdoki2EbeT0EifmcyrYEEyg
    def login(self):
        DEVICE_ID = 'TESTINGDEVICEID'
        USER_ID = 7

        LOGIN_BODY = {
            "userId": USER_ID,
            "deviceId": DEVICE_ID
        }
        LOGIN_HEADERS = {
            'Content-Type': 'application/json',
            'x-app-api-key': '0V4VMXP-WQJ497N-Q17SBTS-99KXYVK'
        }

        login = requests.post('http://13.127.205.229/api/user/login', headers=LOGIN_HEADERS, data=json.dumps(LOGIN_BODY))
        
        if login.status_code != 200:
            print('Login Failed')
            sys.exit(1)

        token_payload = json.loads(login.text)
        print(token_payload['token'])

    def beacon(self):
        # token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcklkIjoiVEVTVElOR1VTRVJJRCIsIm1vYmlsZU5vIjoiOTc4NzQ2NDY1NiIsImRldmljZUlkIjoyLCJhcHBJZCI6MywiZW1haWxJZCI6ImxvbEBMb2wuY29tIiwiaWF0IjoxNTUzNDk1NTkyLCJleHAiOjE1ODUwMzE1OTJ9.lb88qYg9hHIh5DyrxvryGwK8mgLGCqf0eLIR81Zvv0E' #token_payload['token']
        token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywidXNlcklkIjoiVEVTVElOR1VTRVJJRCIsIm1vYmlsZU5vIjoiOTc4NzQ2NDY1NiIsImRldmljZUlkIjoxNiwiYXBwSWQiOjIsImVtYWlsSWQiOiJsb2xATG9sLmNvbSIsImlhdCI6MTU1NDI3MjM3MywiZXhwIjoxNTg1ODA4MzczfQ.EEaxFMTyUfTvrmalUZevYdoki2EbeT0EifmcyrYEEyg'
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
        if beacon.text == '':
            print(beacon.status_code)
        else:
            print(beacon.text)


if __name__ == '__main__':
    n = NonInlocus()