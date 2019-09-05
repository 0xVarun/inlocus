#!/usr/bin/env python3
import os
import sys
import json
import pickle
import random
import string
import logging
import requests
from argparse import ArgumentParser

PROD = False
FILE = 'config.json'

class Registration(object):
    CONFIG = {}
    def __init__(self, *args, **kwargs):
        self.imei = kwargs.pop('imei', 'DUMMY_IMEI')
        self.gaid = kwargs.pop('gaid', 'DUMMY_GAID')
        self.phone = kwargs.pop('phone', 'DUMMY_PHONE')
        self.email = kwargs.pop('email', 'DUMMY_EMAIL')
        self.api_key = kwargs.pop('api_key', None)

        if not self.api_key:
            logging.fatal('Cannot register device without an API key') 
            sys.exit(1)

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
        with open(FILE, 'w') as config_:
            json.dump(self.CONFIG, config_, sort_keys=True, indent=4)

class Login(object):
    CONFIG = None
    def __init__(self, *args, **kwargs):
        if os.path.exists(FILE):
            with open(FILE, 'r') as config_:
                self.CONFIG = json.loads(config_.read())
        else:
            logging.fatal('Config file {} not found...maybe you forgot to register'.format(FILE))
            sys.exit(1)

        self.__login()
        self.__save_config()

    def __login(self):
        uri = '/api/user/login'
        url = self.__get_host().format(uri)
        body = { 'userId': self.CONFIG['user']['appUserId'], 'deviceId': self.CONFIG['device']['deviceId'] }
        header = { 'Content-Type': 'application/json' }
        logging.debug('requesting login at url -> {}'.format(url))
        logging.debug('post body -> {}'.format(json.dumps(body)))
        try:
            res = requests.post(url, data=json.dumps(body), headers=header)
            res_body = json.loads(res.text)
            self.CONFIG['login'] = res_body 
        except Exception as e:
            logging.fatal(str(e))

    def __get_host(self):
        if PROD:
            return 'https://inlocus.pinprox.com{}'
        else:
            return 'http://localhost:3000{}'

    def __save_config(self):
        with open(FILE, 'w') as config_:
            json.dump(self.CONFIG, config_, sort_keys=True, indent=4)

class Sensor(object):
    CONFIG = None
    CAMP = None
    def __init__(self, *args, **kwargs):
        if os.path.exists(FILE):
            with open(FILE, 'r') as config_:
                self.CONFIG = json.loads(config_.read())
        else:
            logging.fatal('Config file {} not found...maybe you forgot to register'.format(FILE))
            sys.exit(1)

        self.typeof = kwargs.pop('typeof', None)

        self.latitude = kwargs.pop('lat', None)
        self.longitude = kwargs.pop('lng', None)

        self.major = kwargs.pop('major', None)
        self.minor = kwargs.pop('minor', None)

        self.notify = kwargs.pop('notify', None)

        if self.typeof == 'location':
            self.__send_location()
        elif self.typeof == 'beacon':
            self.__send_beacon()
        elif self.typeof == 'wifi':
            self.__send_wifi()

        if self.notify:
            self.__notify()

            
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

        logging.debug('sending location at url -> {}'.format(url))
        logging.debug('put body -> {}'.format(json.dumps(body)))

        try:
            res = requests.put(url, data=json.dumps(body), headers=header)
            logging.info('status code -> {}'.format(res.status_code))

            if res.status_code != 204:
                logging.info(res.text)

            if res.status_code == 200:
                self.CAMP = json.loads(res.text)

        except Exception as e:
            logging.fatal(str(e))

    def __send_beacon(self):
        uri = '/api/sensor/beacon'
        url = self.__get_host().format(uri)
        token = self.CONFIG['login']['token']
        body = { 'major': str(self.major), 'minor': str(self.minor), 'uuid': 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 'rssi': -5.875, 'distance': 20 }
        header = { 'Content-Type': 'application/json', 'authorization': 'Bearer {}'.format(token) }

        res = requests.put(url, data=json.dumps(body), headers=header)
        logging.info('status code -> {}'.format(res.status_code))
        if res.status_code != 204:
            logging.info(res.text)

        if res.status_code == 200:
            self.CAMP = json.loads(res.text)


    def __send_wifi(self):
        pass

    def __notify(self):
        if self.CAMP is not None:
            notificationId = self.CAMP['notificationId']
            uri = '/api/notify/{}'.format(notificationId)
            url = self.__get_host().format(uri)
            token = self.CONFIG['login']['token']
            header = { 'authorization': 'Bearer {}'.format(token) }
            res = requests.get(url, headers=header)
            logging.info('status code -> {}'.format(res.status_code))
        else:
            logging.info('Campaign is empty')



def main(args):
    if args.command == 'reg':
        Registration(
            imei=args.imei,
            gaid=args.gaid,
            phone=args.phone,
            email=args.email,
            api_key=args.api_key
        )
    elif args.command == 'login':
        Login()
    elif args.command == 'location':
        Sensor(typeof=args.command,lat=args.lat, lng=args.lng, notify=args.notify)
    elif args.command == 'beacon':
        Sensor(typeof=args.command,major=args.major, minor=args.minor, notify=args.notify)
    elif args.command == 'wifi':
        print('wifi') 
    else:
        pass

if __name__ == '__main__':
    parser = ArgumentParser(description="inLocus User Register Flow")

    parser.add_argument('--prod', action='store_true', help="Use production server instead of default local server")
    parser.add_argument('-f','--file', type=str, help="Path to config file, default is config.json", default="config.json")
    parser.add_argument('--verbose', action='store_true', help="Enable verbose logging")

    subparser = parser.add_subparsers(dest="command")

    reg = subparser.add_parser("reg", help="Registration")
    login = subparser.add_parser("login", help="Login")
    location = subparser.add_parser("location", help="Send Location Data")
    beacon = subparser.add_parser("beacon", help="Send Beacon Data")
    wifi = subparser.add_parser("wifi", help="Send WiFi Data")

    reg.add_argument('-i', '--imei', type=str, default=''.join(random.choice(string.digits) for _ in range(10)), help="Device IMIE")
    reg.add_argument('-g', '--gaid', type=str, help="Device GAID")
    reg.add_argument('-m', '--phone', type=str, help="User Phone number")
    reg.add_argument('-e', '--email', type=str, help="User Email Address")
    reg.add_argument('-a', '--api-key', type=str, help="API KEY")

    location.add_argument('--lat', type=str, help="Latitude")
    location.add_argument('--lng', type=str, help="Longitude")
    location.add_argument('-n', '--notify', action='store_true')

    beacon.add_argument('--major', type=str, help="Beacon Major")
    beacon.add_argument('--minor', type=str, help="Beacon Minor")
    beacon.add_argument('-n', '--notify', action='store_true')

    args = parser.parse_args(sys.argv[1:])
    
    if args.prod:
        PROD = True

    FILE = args.file

    if args.verbose:
        logging.basicConfig(level=logging.DEBUG,format='[%(levelname)s]: %(message)s')
    else:
        logging.basicConfig(level=logging.INFO,format='[%(levelname)s]: %(message)s')

    main(args)


# ./flow.py reg -i 8879249521 -g 'Mi A1, Android 9.0' -m 8879349521 -e mia1@beaconstalk.com -a '09DYPCV-YB44YDF-JMAZ4MM-9BM61F0'