# Verification

## Create verification
> To create verification:

```shell
# With shell, you can just pass the correct header with each request
curl -X POST "https://api.dataspike.io/api/v3/verifications" \
 --data {"applicant_id": "01827ed4-c928-7a3c-9a30-7ab7cc169d11", "checks_required": ["passport"]} 
```
> Response:

```json
{
    "id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11",
    "applicant_id":"01827ed4-c928-7adc-ea30-7ab7cc169d11",
    "status": "in_progress",
    "checks": {
        "document_mrz": {
            "errors": [],
            "warnings": [],
            "status": "in_progress",
            "data": null
        },
        "face_comparison": {
          "errors": [],
          "warnings": [],
          "status": "in_progress",
          "data": null  
        }
    },
    "created_at": "2022-08-31T11:51:04.661Z",
    "updated_at": "2022-08-31T11:51:04.661Z",

}
```

Create new verification

### HTTP Request

`POST https://api.dataspike.io/api/v3/verifications`

### JSON Request Fields

Field | Type | Optional | Description
------|----| ------- | -----------
applicant_id | string | false | ID of applicant
checks_required | array of check enum | false | enum of: "passport", "selfie"
checks_report_only | array of check enum | true | Checks will not participate in result. Only for report. enum of: "passport", "selfie" 

### VerificationInfo

Field | Optional | Description
--------- | ------- | -----------
id | false | Id of verification, uuid
applicant_id | false | Id of applicant, uuid
status | false | status of verification, enum of: "initial", "pending", "in_progress", "verified", "failed"
document_ids | true | list of document ids participating in verification
checks | true | list of checks statuses, see [CheckEntity](#checkentity)
created_at | false | Date of creation
updated_at | false | Date of modification

### CheckEntity

Field | Optional | Description
--------- | ------- | -----------
warnings | true | list of warnings
errors | true | list of errors
status | false | enum of: "verified", "failed", "in_progress"
data | true | detail information with results of check. enum of: [MRZ](#MRZ)

### MRZ

Recognized MRZ data of document.

All fields are mandatory and have string type.

Can have misdetected data.

Field | Description
---------  | -----------
documentType | MRZ document type
country | country of document
name | detected name
surname | detected surname
docNumber | document number
nationality | nationality from document
birthDate | birth date of document, format YYMMDD
sex | usually M or F
expiryDate | expiration date of document, format YYMMDD


## Get verification
> Get Verification

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/verifications/$VERIFICATION_ID"
```
> Response:

```json
{
    "id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11",
    "applicant_id":"01827ed4-c928-7adc-ea30-7ab7cc169d11",
    "status": "in_progress",
    "checks": {
        "document_mrz": {
            "errors": [],
            "warnings": [],
            "status": "in_progress",
            "data": null
        },
        "face_comparison": {
          "errors": [],
          "warnings": [],
          "status": "in_progress",
          "data": null  
        }
    },
    "document_ids": ["01827ed4-c928-7a3c-9a30-7ab7cc169d11"],
    "created_at": "2022-08-31T11:51:04.661Z",
    "updated_at": "2022-08-31T11:51:04.661Z",

}
```

### HTTP Request

`GET https://api.dataspike.io/api/v3/verifications/$verification_id`

### Applicant Response

[Verification info](#verificationinfo)


## List verifications
> List verifications

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/verifications?page=0&limit=10"
```
> Response:

```json
{"data": [{
    "id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11",
    "applicant_id":"01827ed4-c928-7adc-ea30-7ab7cc169d11",
    "status": "in_progress",
    "checks": {
        "document_mrz": {
            "errors": [],
            "warnings": [],
            "status": "in_progress",
            "data": null
        },
        "face_comparison": {
          "errors": [],
          "warnings": [],
          "status": "in_progress",
          "data": null  
        }
    },
    "document_ids": ["01827ed4-c928-7a3c-9a30-7ab7cc169d11"],
    "created_at": "2022-08-31T11:51:04.661Z",
    "updated_at": "2022-08-31T11:51:04.661Z",

}],
"has_next": false
```
### HTTP Request

`GET https://api.dataspike.io/api/v3/verifications`

### Query Parameters

Field | Optional | Default | Description
--------- | ------- | -------- | -----------
page | true | 0 | Page number, starts from 0
limit | true | 10 | Limit per page


### JSON Response

Paged Response of [Verification Info](#verificationinfo)


## Get verifications for applicant
> Get verifications for applicant

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/applicant/$APPLICANT_ID/verifications?page=0&limit=10"
```
> Response:

```json
{"data": [{
    "id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11",
    "applicant_id":"01827ed4-c928-7adc-ea30-7ab7cc169d11",
    "status": "passed",
    "checks": {
        "document_mrz": {
            "errors": [],
            "warnings": [],
            "status": "in_progress",
            "data": null
        },
        "face_comparison": {
          "errors": [],
          "warnings": [],
          "status": "in_progress",
          "data": null  
        }
    },
    "document_ids": ["01827ed4-c928-7a3c-9a30-7ab7cc169d11"],
    "details": {},
    "created_at": "2022-08-31T11:51:04.661Z",
    "updated_at": "2022-08-31T11:51:04.661Z",

}],
"has_next": false
```
### HTTP Request

`GET https://api.dataspike.io/api/v3/applicant/$APPLICANT_ID/verifications?page=0&limit=10`

### Query Parameters

Field | Optional | Default | Description
--------- | ------- | -------- | -----------
page | true | 0 | Page number, starts from 0
limit | true | 10 | Limit per page


### JSON Response

Paged Response of [Verification Info](#verificationinfo)