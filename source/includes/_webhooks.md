# Webhooks

Webhooks configuration right now avilable only on a dashboard 

You can create and test webhooks for both sandbox and production environment at Webhook tab [https://dash.dataspike.io/api](https://dash.dataspike.io/api)


## Webhook Event Common Fields
Field | Optional | Description
------|----| ------- 
id | false | Event ID
webhook_id | false | Triggered webhook Id configuration
event_type | false | Webhook EventType, one of [`DOCVER`, `APPLICANT`, `AML`]
payload | false | Actual payload, all possible Payloads described below
timestamp | false | UTC timestamp of event


## DocVer Notification Event

> DocVer Notification Event:

```json
{
  "id": "1ed2fb46-8271-6a33-a9ef-7553f473af46",
  "webhook_id": "1ed2f903-2d75-6b19-b6a5-29535bc3340e",
  "event_type": "DOCVER",
  "payload": {
    "id": "b86a3cbe-7880-4759-a4f3-9bcabac3cf3c",
    "checks": {
      "passport": {
        "data": [],
        "errors": [],
        "status": "in_progress",
        "warnings": []
      }
    },
    "status": "verified",
    "created_at": "2022-09-08T20:25:40.636471Z",
    "updated_at": "2022-09-08T20:25:40.636480Z",
    "applicant_id": "4da42a83-14db-4f19-9820-19cc10ad21cf",
    "document_ids": [
      "bd59f3da-b89d-4198-be1d-9b65477ddfb1"
    ],
    "document_type": "passport"
  },
  "timestamp": "2022-09-08T20:25:40.636658Z"
}
```

DocVer Notifications are fired when verification has been finished.

It contains the full information about the verification and extracted information for all requested documents.

### DocVer Notification Fields
Field | Optional | Description
------|----| ------- 
id | false | Event ID
webhook_id | false | Triggered webhook Id configuration
event_type | false | `DOCVER`
payload | false | [Verification Object](#verification-object)
timestamp | false | UTC timestamp of event



## Verification Object
Field | Optional | Description
------|----| -------
id | false | Verification ID
applicant_id | false | Applicant ID in the system
document_ids | true | Attached documents to this particular verification
status | false | Verification status, oneof [`verified`, `failed`, `initial`, `in_progress`]
created_at | false | Creation timestamp
updated_at | false | Timestamp of last update
document_type | false | Main document type for current verification
checks | true | Set of required checks, that would be performed and it statuses, one of [`passport`, `id_card`, `residence_permit`, `driver_license`, `selfie`, `visa`], see [Check Object](#check-object)


### Check Object
Field | Optional | Description
------|----| ------- | -----------
data | true | data relevant for current check 
status | false | Current check status, one of [`verified`, `failed`, `in_progress`]
erros | true | List of errors
warnings | true | List of warnings


## Webhook History

> To retrieve webhook history use:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json" \
 -X GET "https://api.dataspike.io/api/v3/notifications/webhook/history?after=<invocation_id>&webhook=<webhook_id>"
```

> Response:

```json
{
  "data": [
    {
      "id": "1ed2fb46-8271-6a33-a9ef-7553f473af46",
      "webhook_id": "1ed2f903-2d75-6b19-b6a5-29535bc3340e",
      "event_type": "DOCVER",
      "payload": {
          // Some payload
      },
      "timestamp": "2022-09-08T20:25:40.636658Z"
    }
  ],
  "has_next": true
}
```

You can paginate over the last webhooks in case you missed any, suing this API

### Http Request

`GET https://api.dataspike.io/api/v3/notifications/webhook/history?after=<invocation_id>&webhook=<webhook_id>`


### Query Parameters
Field | Optional | Description
------|----| -------
after | true | Last webhook event ID, after which you want start to paginate
webhook | true | Filter by webhook ID, in case you want to fetch history for particular configured webhook

### JSON Response Fields
Field | Optional | Description
------|----| ------- 
data | false | List of [Webhook invocation object](#webhook-invocation-object)
has_next | true | When set to `true` you haven't reached the end of history yet

### Webhook Invocation Object
Field | Optional | Description
------|----| ------- 
id | false | Event ID
webhook_id | false | Triggered webhook Id configuration
event_type | false | Webhook EventType, one of [`DOCVER`, `APPLICANT`, `AML`]
payload | false | Payload, depends on `event_type`
timestamp | false | UTC timestamp of event
is_sandbox | false | Environment of configured webhook
attempts | true | number of delivery attempts
response_code | true | Response code of last attempt, if empty, event is `pending`
last_attempt_at | true | timestamp of last delivery attempt

