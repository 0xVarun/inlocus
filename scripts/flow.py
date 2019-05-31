#!/usr/bin/env python3
import os
import sys
import json
import pickle
import random
import string
import requests
from argparse import ArgumentParser

PROD = False

class Registration(object):
    CONFIG = {}
    def __init__(self, *args, **kwargs):
        self.imei = kwargs.pop('imei', 'DUMMY_IMEI')
        self.gaid = kwargs.pop('gaid', 'DUMMY_GAID')
        self.phone = kwargs.pop('phone', 'DUMMY_PHONE')
        self.email = kwargs.pop('email', 'DUMMY_EMAIL')
        self.api_key = kwargs.pop('api_key', None)

        if not self.api_key:
            raise Exception('Cannot register device without an API key') 

        self.__register_device()
        self.__register_user()
        self.__save_config()

    def __register_device(self):
        uri = '/api/device/register'
        url = self.__get_host().format(uri)
        body = { 'IMEI': self.imei, 'GAID': self.gaid, 'deviceId': Registration.get_random_string() }
        header = { 'Content-Type': 'application/json' }

        res = requests.post(url, data=json.dumps(body), headers=header)

        res_body = json.loads(res.text)

        self.CONFIG['device'] = res_body 

    def __register_user(self):
        uri = '/api/user/register'
        url = self.__get_host().format(uri)
        body = { 'userId': Registration.get_random_string(), 'mobileNo': self.phone, 'emailId': self.email, 'deviceId': self.CONFIG['device']['id'] }
        header = { 'Content-Type': 'application/json', 'x-app-api-key': self.api_key }

        res = requests.post(url, data=json.dumps(body), headers=header)

        res_body = json.loads(res.text)

        self.CONFIG['user'] = res_body

    @staticmethod
    def get_random_string(length=6):
        chars = string.ascii_lowercase + string.ascii_uppercase + string.digits
        return ''.join(random.choice(chars) for _ in range(length))

    def __get_host(self):
        if PROD:
            return 'https://inlocus.pinprox.com{}'
        else:
            return 'http://localhost:3000{}'

    def __save_config(self):
        print(json.dumps(self.CONFIG))
        with open('config.json', 'w') as config_:
            json.dump(self.CONFIG, config_, sort_keys=True, indent=4)

class Login(object):
    CONFIG = None
    def __init__(self, *args, **kwargs):
        if os.path.exists('config.json'):
            with open('config.json', 'r') as config_:
                self.CONFIG = json.loads(config_.read())
        else:
            raise Exception('Config file not found...maybe you forgot to register')

        self.__login()
        self.__save_config()

    def __login(self):
        uri = '/api/user/login'
        url = self.__get_host().format(uri)
        body = { 'userId': self.CONFIG['user']['appUserId'], 'deviceId': self.CONFIG['device']['deviceId'] }
        header = { 'Content-Type': 'application/json' }

        res = requests.post(url, data=json.dumps(body), headers=header)

        res_body = json.loads(res.text)

        self.CONFIG['login'] = res_body 

    def __get_host(self):
        if PROD:
            return 'https://inlocus.pinprox.com{}'
        else:
            return 'http://localhost:3000{}'

    def __save_config(self):
        print(json.dumps(self.CONFIG))
        with open('config.json', 'w') as config_:
            json.dump(self.CONFIG, config_, sort_keys=True, indent=4)

class Sensor(object):
    CONFIG = None
    def __init__(self, *args, **kwargs):
        if os.path.exists('config.json'):
            with open('config.json', 'r') as config_:
                self.CONFIG = json.loads(config_.read())
        else:
            raise Exception('Config file not found...maybe you forgot to register')

        self.typeof = kwargs.pop('typeof', None)
        self.latitude = kwargs.pop('lat', None)
        self.longitude = kwargs.pop('lng', None)

        if self.typeof == 'location':
            self.__send_location()
        elif self.typeof == 'beacon':
            self.__send_beacon()
        elif self.typeof == 'wifi':
            self.__send_wifi()


    def __get_host(self):
        if PROD:
            return 'https://inlocus.pinprox.com{}'
        else:
            return 'http://localhost:3000{}'

    def __send_location(self):
        uri = '/api/sensor/location'
        url = self.__get_host().format(uri)
        token = self.CONFIG['login']['token']
        body = { 'latitude': str(self.latitude), 'longitude': str(self.longitude) }
        header = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }

        res = requests.put(url, data=json.dumps(body), headers=header)
        print('status code -> {}'.format(res.status_code))
        print(res.text)
    
    def __send_beacon(self):
        pass

    def __send_wifi(self):
        pass


def main(args):
    if args.command == 'reg':
        reg = Registration(
            imei=args.imei,
            gaid=args.gaid,
            phone=args.phone,
            email=args.email,
            api_key=args.api_key
        )
    elif args.command == 'login':
        login = Login()
    elif args.command == 'location':
        sensor = Sensor(typeof=args.command,lat=args.lat, lng=args.lng)
    elif args.command == 'beacon':
        print('beacon--')
    elif args.command == 'wifi':
        print('wifi') 
    else:
        pass

if __name__ == '__main__':
    parser = ArgumentParser(description="inLocus User Register Flow")

    parser.add_argument('--prod', type=bool, help="Use production server instead of default local server")

    subparser = parser.add_subparsers(dest="command")

    reg = subparser.add_parser("reg", help="Registration")
    login = subparser.add_parser("login", help="Login")
    location = subparser.add_parser("location", help="Send Location Data")
    beacon = subparser.add_parser("beacon", help="Send Beacon Data")
    wifi = subparser.add_parser("wifi", help="Send WiFi Data")

    reg.add_argument('-i', '--imei', type=str, help="Device IMIE")
    reg.add_argument('-g', '--gaid', type=str, help="Device GAID")
    reg.add_argument('-m', '--phone', type=str, help="User Phone number")
    reg.add_argument('-e', '--email', type=str, help="User Email Address")
    reg.add_argument('-a', '--api-key', type=str, help="API KEY")

    location.add_argument('--lat', type=str, help="Latitude")
    location.add_argument('--lng', type=str, help="Longitude")

    args = parser.parse_args(sys.argv[1:])
    
    main(args)


# ./flow.py reg -i 8879249521 -g 'Mi A1, Android 9.0' -m 8879349521 -e mia1@beaconstalk.com -a '09DYPCV-YB44YDF-JMAZ4MM-9BM61F0'
