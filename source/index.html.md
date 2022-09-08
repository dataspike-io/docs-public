---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='dataspike.io'>Sign Up for a Developer Key</a>

includes:
  - aml_deprecated
  - verification
  - webhooks
  
search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Dataspike API
---

# Introduction

> To authorize request with api key use next pattern:

```shell
curl -H "ds-api-token: <api_key>" "https://<endpoint>/<api_path>"
```

Welcome to the Dataspike API! You can use our API to access Dataspike API endpoints.

Production API endpoint: [api.dataspike.io](api.dataspike.io)

Sandbox API endpoint: [sandboxapi.dataspike.io](sandboxapi.dataspike.io)

1. All API requests must contain header `Content-Type: application/json`

2. For both endpoints `API Key` is required and can be generated at [dataspike.io](dataspike.io) Developer section

3. You have to include `API Key` in each request using `ds-api-token` Header name
