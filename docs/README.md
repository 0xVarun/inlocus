# inLocus

> A smart location based notifcation as a service.

## REGISTRATION

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
x-app-api-key: <YOUR-API-KEY>
x-app-api-secret: <YOUR-API-SECRET>
```

#### Device Registration Response
```json
{
    "id": "<UNIQUE-DB-DEVICE-ID>",
    "deviceId": "<DEVICE-ID>"
}
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
 	"emailId": "<USER-EMAIL-ID>",
 	"deviceId": "<DEVICE-ID-RECEIVED>"
}
```

#### App User Registration Header
```
x-app-api-key: <YOUR-API-KEY>
x-app-api-secret: <YOUR-API-SECRET>
```

#### App User Registration Response

```json
{
    "appUserId": "<UNIQUE-DB-USER-ID>"
}
```

### App User Login

#### App User Registration Endpoint
> __/api/user/login__

![method](https://img.shields.io/badge/method-POST-blue.svg)

#### App User Registration Body
```json
{
 	"userId": "<UNIQUE-USER-ID-DB>",
 	"deviceId": "<DEVICE-ID>"
}
```

#### App User Registration Header
```
x-app-api-key: <YOUR-API-KEY>
x-app-api-secret: <YOUR-API-SECRET>
```

#### App User Registration Response

```json
{
    "token": "<JWT>"
}
```

##### Example

> Request
```json
	{
		"userId": 4,
		"deviceId": "faw4-vf66-t5rs-2wrg"
	}
```

> Response
```json
{
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwidXNlcklkIjoiVEVTVElORyIsIm1vYmlsZU5vIjoiVEVTVElORyIsImRldmljZUlkIjoiVEVTVElORyIsImFwcElkIjoyMiwiZW1haWxJZCI6IlRFU1RJTkciLCJpYXQiOjE1NTAyMjgzOTAsImV4cCI6MTU1MDIyODQ1MH0.S3GexIjIocQx_YF9D-Kzm47AVPYbiRMLHAf7uCHzo0k"
}
```