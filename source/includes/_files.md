# Files management

## Upload document
> To upload document client should use multipart/form-data upload:

```shell
# With shell, you can just pass the correct header with each request
curl -X POST "https://api.dataspike.io/api/v3/upload/$APPLICANT_ID" \
 -H 'Content-Type: multipart/form-data'  -F 'document_type=passport' -F'issued_country=AAA' -F 'side=front' -F 'file=@old_passport.jpeg'
```
> Response:

```json
{
    "document_id":"01827ed4-c928-7a3c-9a30-7ab7cc169d11"
}
```

Upload new document for applicant

### HTTP Request

`POST https://api.dataspike.io/api/v3/upload/$applicant_id`

### Form fields

Field | Type | Optional | Description
------|----| ------- | -----------
file | file | false | image file
document_type | string | false | Enum of: 'passport', 'selfie', 'id_card', 'residence_permit', 'driver_license'
side | string | true | Side of document: 'front' or 'back', may be required for some types of document 
issued_country | string | true | Country issued document in ISO_3166-1_alpha-3 format

## Get Preview of uploaded document
> Get preview of uploaded document

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/documents/$DOCUMENT_ID/preview" 
```
> Response:

```binary
binary-data with document
```

### HTTP Request

`GET https://api.dataspike.io/api/v3/documents/$DOCUMENT_ID/preview`


## Get uploaded document
> Get uploaded document

```shell
# With shell, you can just pass the correct header with each request
curl -X GET "https://api.dataspike.io/api/v3/documents/$DOCUMENT_ID" 
```
> Response:

```binary
binary-data with document
```

### HTTP Request

`GET https://api.dataspike.io/api/v3/documents/$DOCUMENT_ID`


