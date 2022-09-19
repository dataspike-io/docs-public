# Screening API v2

## Search

> To search for name:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X POST "https://api.dataspike.io/api/v2/sealed/universal/search" \
 --data '{"name": "Angela merkel"}' 
```
> Response:

```json
{
  "requested_name": "Angela merkel",
  "search_uuid": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
  "data": [
    {
      "uuid": "34e270e5-1306-3197-bf70-4d8eedf60c98",
      "category": "person",
      "main_name": "Angela Merkel",
      "lookup_name": "Angela Merkel",
      "fields": {
        "Alias": {
          "type": "StringField",
          "title": "Alias",
          "values": [
            "Angela Merkel",
            "Меркель, Ангела"
          ]
        },
        "Links": {
          "type": "URLField",
          "title": "Links",
          "values": [
            {
              "name": "Presidente at Bundestag",
              "url": "https://linkedin.com/in/angela-merkel-7a049613"
            }
          ]
        },
        "Politician role": {
          "type": "StringField",
          "title": "Politician role",
          "values": [
            "Participant of 'bundestag' (germany)",
            "Federal chancellor of germany since 2005-11-22",
            "Minister for the environment",
            "Da, cdud, cdu"
          ]
        },
        "Sanctions": {
          "type": "URLField",
          "title": "Sanctions",
          "values": []
        },
        "Legal Cases": {
          "type": "URLField",
          "title": "Legal Cases",
          "values": []
        },
        "Tags": {
          "type": "StringField",
          "title": "Tags",
          "values": [
            "PEP",
            "Media",
            "Social"
          ]
        },
        "Citizenship": {
          "type": "StringField",
          "title": "Citizenship",
          "values": [
            "Germany"
          ]
        },
        "Gender": {
          "type": "StringField",
          "title": "Gender",
          "values": [
            "female"
          ]
        },
        "Occupations": {
          "type": "StringField",
          "title": "Occupations",
          "values": [
            "Presidente at Bundestag",
            "Politician at leader of the European Union"
          ]
        },
        "Related news": {
          "type": "URLField",
          "title": "Related news",
          "values": [
            {
              "name": "German lawmaker resigns over face mask scandal",
              "url": "https://www.dw.com/en/german-lawmaker-resigns-over-face-mask-scandal/a-56798497"
            }
          ]
        },
        "Primary date of birth": {
          "type": "StringField",
          "title": "Primary date of birth",
          "values": [
            "1954-07-17"
          ]
        },
        "Possible dates of birth": {
          "type": "StringField",
          "title": "Possible dates of birth",
          "values": [
            "1954-07-17"
          ]
        }
      },
      "similarity": 0.9230769230769231
    }
  ],
  "current_page": 0,
  "has_next": false
}
```

Performs person or organization search in Sanctions and PEPs lists

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/universal/search`

### JSON Request Fields

Field | Type | Optional | Description
------|----| ------- | -----------
name | string | false | Full name you want to lookup in Sanctions, e.g. `Angela Merkel`
category | string | true | Type of Entity you are looking for, one of [`Person`, `Organization`]
country | string | true | Two-letter ISO 3166-1 ALPHA-2 code, e.g. `DE`, reference [https://www.iban.com/country-codes](https://www.iban.com/country-codes)
exact_birth_day | string | true | Allowed formats `yyyy`, `yyyy-MM`, `yyyy-MM-dd`, if not sure about the exact date consider to use range fields `min_date_of_birth` and `max_date_of_birth`
min_date_of_birth | string | true | Allowed formats `yyyy`, `yyyy-MM`, `yyyy-MM-dd`
max_date_of_birth | string | true | Allowed formats `yyyy`, `yyyy-MM`, `yyyy-MM-dd`
tags | string or array | true | Allowed tags Sanctions | Finance | Leaks | Media | PEP | Legal | Terrorism
sources | string or array | true | More international information here [Link names](https://www.dataspike.io/developer-api/#sources_link)


### JSON Response Fields

Field | Optional | Type | Description
--------- | ------- | ----------- | ------------
requested_name | false | string | Requested name
search_uuid | false | string | Id of your search request in the system
data | false | Array of [Entity Object](#entityobject) | Array of found entities


## Multi Search


> To search for name:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X POST "https://api.dataspike.io/api/v2/sealed/universal/multisearch" \
 --data '[{"name": "Angela merkel"}]' 
```
> Response:

```json
[{
  "requested_name": "Angela merkel",
  "search_uuid": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
  "data": [
    {
      "uuid": "34e270e5-1306-3197-bf70-4d8eedf60c98",
      "category": "person",
      "main_name": "Angela Merkel",
      "lookup_name": "Angela Merkel",
      "fields": {
        "Alias": {
          "type": "StringField",
          "title": "Alias",
          "values": [
            "Angela Merkel",
            "Меркель, Ангела"
          ]
        },
        "Links": {
          "type": "URLField",
          "title": "Links",
          "values": [
            {
              "name": "Presidente at Bundestag",
              "url": "https://linkedin.com/in/angela-merkel-7a049613"
            }
          ]
        },
        "Politician role": {
          "type": "StringField",
          "title": "Politician role",
          "values": [
            "Participant of 'bundestag' (germany)",
            "Federal chancellor of germany since 2005-11-22",
            "Minister for the environment",
            "Da, cdud, cdu"
          ]
        },
        "Sanctions": {
          "type": "URLField",
          "title": "Sanctions",
          "values": []
        },
        "Legal Cases": {
          "type": "URLField",
          "title": "Legal Cases",
          "values": []
        },
        "Tags": {
          "type": "StringField",
          "title": "Tags",
          "values": [
            "PEP",
            "Media",
            "Social"
          ]
        },
        "Citizenship": {
          "type": "StringField",
          "title": "Citizenship",
          "values": [
            "Germany"
          ]
        },
        "Gender": {
          "type": "StringField",
          "title": "Gender",
          "values": [
            "female"
          ]
        },
        "Occupations": {
          "type": "StringField",
          "title": "Occupations",
          "values": [
            "Presidente at Bundestag",
            "Politician at leader of the European Union"
          ]
        },
        "Related news": {
          "type": "URLField",
          "title": "Related news",
          "values": [
            {
              "name": "German lawmaker resigns over face mask scandal",
              "url": "https://www.dw.com/en/german-lawmaker-resigns-over-face-mask-scandal/a-56798497"
            }
          ]
        },
        "Primary date of birth": {
          "type": "StringField",
          "title": "Primary date of birth",
          "values": [
            "1954-07-17"
          ]
        },
        "Possible dates of birth": {
          "type": "StringField",
          "title": "Possible dates of birth",
          "values": [
            "1954-07-17"
          ]
        }
      },
      "similarity": 0.9230769230769231
    }
  ],
  "current_page": 0,
  "has_next": false
}]
```

Performs search for multiple names, same API as [Search](#search) but accepts and return arrays of values


### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/universal/multisearch`

### JSON Request Fields
Array of [Search](#search) requests

### JSON Response Fields
Array of [Search](#search) responses


## Create Watchlist

> To create watch list:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X POST "https://api.dataspike.io/api/v2/sealed/watch/lists/create" \
 --data '{"name": "My Sanctions Watchlist"}' 
```
> Response:

```json
{
  "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c"
}
```

Creates a watch list, after it is created you will be able to monitor the desired names daily 

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/watch/lists/create`

### JSON Request Fields
Field | Optional | Description
------|----| ------- | -----------
name | false | Name of new Watchlist

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
id | false | ID of created Watchlist, you will need it later

## Delete Watchlist

> To delete watch list:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X POST "https://api.dataspike.io/api/v2/sealed/watch/lists/remove" \
 --data '{"id": "f4f4f528-a010-490e-971d-e53ff8d56f1c"}' 
```
> Response:

```json
{
  "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c"
}
```

Removes a watch list from your account

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/watch/lists/remove`

### JSON Request Fields
Field | Optional | Description
------|----| ------- | -----------
id | false | ID of existing Watchlist

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
id | false | ID of removed Watchlist


## Rename Watchlist

> To rename watch list:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X POST "https://api.dataspike.io/api/v2/sealed/watch/lists/rename" \
 --data '{"id": "f4f4f528-a010-490e-971d-e53ff8d56f1c", "new_name": "My WatchList 2"}' 
```
> Response:

```json
{
  "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c"
}
```

Rename a watchlist

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/watch/lists/rename`

### JSON Request Fields
Field | Optional | Description
------|----| ------- | -----------
id | false | ID of existing Watchlist
new_name | false | New name of watchlist

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
id | false | ID of renamed Watchlist


## List all Watchlists

> To list watchlists:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X GET "https://api.dataspike.io/api/v2/sealed/watch/lists"
```
> Response:

```json
{
  "data": [{
    "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
    "name": "My watchlist",
    "last_viewed": "2011-12-03T10:15:30Z",
    "cretaed_at": "2011-12-03T10:15:30Z",
    "updated_at": "2011-12-03T10:15:30Z"
  }],
  "has_next": false
}
```

Check all watchlists in your account

### HTTP Request

`GET https://api.dataspike.io/api/v2/sealed/watch/lists`

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
data.id | false | ID of existing Watchlist
data.name | false | Name of watchlist
data.last_viewed | false | Last time, user checked changes, UTC, such as `2011-12-03T10:15:30Z`
data.created_at | false | UTC, such as `2011-12-03T10:15:30Z`
data.updated_at | false | Last time, watch list was updated by system, UTC, such as `2011-12-03T10:15:30Z`
has_next | true | Equals true if you can get next page of founded items list

## Get Watchlist Info

> To get watchlist info:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X GET "https://api.dataspike.io/api/v2/sealed/watch/list/<id>/info"
```
> Response:

```json
{
    "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
    "user_id": 2234,
    "name": "Angela Merkel",
    "last_viewed": "2011-12-03T10:15:30Z",
    "cretaed_at": "2011-12-03T10:15:30Z",
    "updated_at": "2011-12-03T10:15:30Z"
}
```

Returns info about existing watch list

### HTTP Request

`GET https://api.dataspike.io/api/v2/sealed/watch/list/<id>/info`

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
data.id | false | ID of existing Watchlist
data.user_id | false | Belongs to account
data.name | false | Name of watchlist
data.last_viewed | false | Last time, user checked changes, UTC, such as `2011-12-03T10:15:30Z`
data.created_at | false | UTC, such as `2011-12-03T10:15:30Z`
data.updated_at | false | Last time, watch list was updated by system, UTC, such as `2011-12-03T10:15:30Z`

## Get Watchlist Items

> To get watchlist:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json"  -X GET "https://api.dataspike.io/api/v2/sealed/watch/list/<id>"
```
> Response:

```json
{
  "data": [{
    "row_id" : 1,
    "id": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
    "uuid": "f4f4f528-a010-490e-971d-e53ff8d56f1c",
    "name": "Angela Merkel",
    "item": {
       // ... Check example from Search
    }
    "cretaed_at": "2011-12-03T10:15:30Z",
    "updated_at": "2011-12-03T10:15:30Z"
  }],
  "has_next": false
}
```

Returns watchlist items

### HTTP Request

`GET https://api.dataspike.io/api/v2/sealed/watch/list/<id>`

### JSON Response Fields
Field | Optional | Description
------|----| ------- | -----------
data.row_id | false | row id in database
data.id | false | ID of existing Watchlist
data.uuid | false | ID of existing Entity
data.name | false | Name of watchlist
data.item | false | [Entity Object](#entityobject)

## Add Item to Watchlist

> To add item to watchlist:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json" \
 -X POST "https://api.dataspike.io/api/v2/sealed/watch/list/<id>/add" \
 --data '{"uuid": "<uuid>", "name": "Angela Merkel"}' 
```

Add new item to watchlist

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/watch/list/<id>/add`

### JSON Request Fields
Field | Optional | Description
------|----| ------- | -----------
uuid | true | ID of existing record in the system
name | true | Name to monitor

## Remove Item from Watchlist

> To remove item from watchlist:

```shell
curl -H "ds-api-token: <api_key>" -H "Content-Type: application/json" \
 -X POST "https://api.dataspike.io/api/v2/sealed/watch/list/<id>/remove" \
 --data '{"row_id": 1}' 
```

Remove existing item from watchlist

### HTTP Request

`POST https://api.dataspike.io/api/v2/sealed/watch/list/<id>/remove`

### JSON Request Fields
Field | Optional | Description
------|----| ------- | -----------
row_id | false | Row ID of existing record in watchlist


## EntityObject

> Example:

```json
{
    "uuid": "34e270e5-1306-3197-bf70-4d8eedf60c98",
    "category": "person",
    "main_name": "Angela Merkel",
    "fields": {
        "Alias": {
            "type": "StringField",
            "title": "Alias",
            "values": [
            "Angela Merkel",
            "Меркель, Ангела"
            ]
        },
        "Links": {
            "type": "URLField",
            "title": "Links",
            "values": [
            {
                "name": "Presidente at Bundestag",
                "url": "https://linkedin.com/in/angela-merkel-7a049613"
            }
            ]
        },
        "Politician role": {
            "type": "StringField",
            "title": "Politician role",
            "values": [
            "Participant of 'bundestag' (germany)",
            "Federal chancellor of germany since 2005-11-22",
            "Minister for the environment",
            "Da, cdud, cdu"
            ]
        },
        "Sanctions": {
            "type": "URLField",
            "title": "Sanctions",
            "values": []
        },
        "Legal Cases": {
            "type": "URLField",
            "title": "Legal Cases",
            "values": []
        },
        "Tags": {
            "type": "StringField",
            "title": "Tags",
            "values": [
            "PEP",
            "Media",
            "Social"
            ]
        },
        "Citizenship": {
            "type": "StringField",
            "title": "Citizenship",
            "values": [
            "Germany"
            ]
        },
        "Gender": {
            "type": "StringField",
            "title": "Gender",
            "values": [
            "female"
            ]
        },
        "Occupations": {
            "type": "StringField",
            "title": "Occupations",
            "values": [
            "Presidente at Bundestag",
            "Politician at leader of the European Union"
            ]
        },
        "Related news": {
            "type": "URLField",
            "title": "Related news",
            "values": [
            {
                "name": "German lawmaker resigns over face mask scandal",
                "url": "https://www.dw.com/en/german-lawmaker-resigns-over-face-mask-scandal/a-56798497"
            }
            ]
        },
        "Primary date of birth": {
            "type": "StringField",
            "title": "Primary date of birth",
            "values": [
            "1954-07-17"
            ]
        },
        "Possible dates of birth": {
            "type": "StringField",
            "title": "Possible dates of birth",
            "values": [
            "1954-07-17"
            ]
        }
    }
}
```

Field | Optional | Type | Description
--------- | ------- | ----------- | ------------
category | false | string | Entity Type, on of [`person`, `organization`]
main_name | false | string | Main entity name
lookup_name | true | string | Requested name, used for search
fields.Alias | false | `StringField` | Known entity aliases, check Field Object reference below [StringField](#stringfield)
fields.Links | false | `URLField` | Known entity links, check Field Object reference below [URLField](#urlfield)
fields."Politician role" | false | `StringField` | Known entity politician roles, check Field Object reference below [StringField](#stringfield)
fields.Sanctions | false | `StringField` | Known entity snactions, check Field Object reference below [URLField](#urlfield)
fields."Legal Cases" | false | `StringField` | Known entity legal cases, check Field Object reference below [URLField](#urlfield)
fields.Tags | false | `StringField` | Known entity tags, check Field Object reference below [StringField](#stringfield)
fields.Citizenship | false | `StringField` | Known entity citizenship, check Field Object reference below [StringField](#stringfield)
fields.Gender | false | `StringField` | Known entity gender, check Field Object reference below [StringField](#stringfield)
fields."Primary date of birth" | false | `StringField` | Known entity primary date of birth, check Field Object reference below [StringField](#stringfield)
fields."Possible dates of birth" | false | `StringField` | Known entity possbile dates of birth, check Field Object reference below [StringField](#stringfield)
fields."Related News" | false | `StringField` | Known entity related news, check Field Object reference below [URLField](#urlfield)
similarity | true | string | The distance between requested name and found entity

### StringField
Field | Optional | Description
--------- | ------- | -----------
title | false | Name of the field
type | false | `StringField`
values | false | Array of string

### URLField
Field | Optional | Description
--------- | ------- | -----------
title | false | Name of the field
type | false | `URLField`
values.name | false | URL description
values.url | false | URL path


