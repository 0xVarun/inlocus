# inLocus

> A smart location based notifcation as a service.

## Registration

### Device Registration 

#### Device Registration Endpoint
> __/api/device/register__

![method](https://img.shields.io/badge/method-POST-blue.svg) 

#### Device Registration Body
```json
{
 	"IMEI": "<DEVICE-IMEI-NUMBER>",
 	"GAID": "<USER-GOOGLE-AD-ID>",
 	"deviceId": "<UNIQUE-DEVICE-ID>"
}
```

#### Device Registration Header
```
X-APP-API-KEY: <YOUR-API-KEY>
X-APP-API-SECRET: <YOUR-API-SECRET>
```

### App User Registration

#### App User Registration Endpoint
> __/api/user/register__

![method](https://img.shields.io/badge/method-POST-blue.svg)

#### App User Registration Body
```json
{
 	"userId": "<UNIQUE-USER-ID>",
 	"mobileNo": "<USER-MOBILE-NUMBER>",
 	"emailId": "<USER-EMAIL-ID>"
}
```

#### App User Registration Header
```
X-APP-API-KEY: <YOUR-API-KEY>
X-APP-API-SECRET: <YOUR-API-SECRET>
```