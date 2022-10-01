# Applicant

## Create applicant
> To create applicant:

```shell
# With shell, you can just pass the correct header with each request
curl -X POST "https://api.dataspike.io/api/v3/applicants" \
 --data {"external_id": "12345678"} 
```
> Response:

```json
{
    "id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11"
}
```

Create new applicant

### HTTP Request

`POST https://api.dataspike.io/api/v3/applicants`

### JSON Request Fields

Field | Type | Optional | Description
------|----| ------- | -----------
external_id | string | false | Unique external id of applicant
email | string | true | Applicant email
phone | string | true | Applicant phone
info | ApplicantExternalInfo | true | Applicant info

### ApplicantExternalInfo

Field | Type | Optional | Description
------|----| ------- | -----------
first_name | string | true | first name of applicant
last_name | string | true | first name of applicant
dob | date | true | date of birth ISO-8601 
gender | Gender |  true | Male or Female
citizenship | string | true | citizenship


### JSON Response Fields

Field | Optional | Description
--------- | ------- | -----------
id | false | Id of applicant, uuid


## Get applicant
> Get Applicant

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/applicants/$APPLICANT_ID"
```
> Response:

```json
{
    "applicant_id":"01827edd-bd37-77c8-93ea-8bf62830d1a9",
    "external_id":"2",
    "provided_info":{"gender":"Male"},
    "verification_status":"Initial"
}
```
### HTTP Request

`GET https://api.dataspike.io/api/v3/applicants/$applicant_id`

### Applicant Response

Field | Optional | Description
--------- | ------- | -----------
applicant_id | false | Id of applicant, uuid
external_id | string | false | Unique external id of applicant
email | string | true | Applicant email
phone | string | true | Applicant phone
provided_info | [ApplicantExternalInfo](#applicantexternalinfo) | External data provided in applicant creation
verification_status | VerificationStatus | oneOf Initial or Passed or Queued or Failed


## List applicants
> List applicants

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/applicants"
```
> Response:

```json
{
    "data": [{
        "applicant_id":"01827edd-bd37-77c8-93ea-8bf62830d1a9",
        "external_id":"2",
        "provided_info":{"gender":"Male"},
        "verification_status":"Initial"
    }],
    "has_next": false
}

```
### HTTP Request

`GET https://api.dataspike.io/api/v3/applicants/`

### Query Parameters

Field | Optional | Default | Description
--------- | ------- | -------- | -----------
page | true | 0 | Page number, starts from 0
limit | true | 10 | Limit per page


### JSON Response

Paged Response of [ApplicantResponse](#applicant-response)

## Delete applicant
> To delete applicant:

```shell
# With shell, you can just pass the correct header with each request
curl -X DELETE "https://api.dataspike.io/api/v3/applicants/$APPLICANT_ID"
```
> Response:

```shell
HTTP/1.1 200 OK
```

Delete applicant

### HTTP Request

`DELETE https://api.dataspike.io/api/v3/applicants/$applicant_id`


### Delete response

Http status code 200 OK or 404 Not Found

