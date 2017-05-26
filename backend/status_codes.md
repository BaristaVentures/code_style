# Status Codes

Common cases
--------------

Status codes for common scenarios:

- `200 Ok`: If the user exists in the db, should return the session token.
- `201 Created`: The resource was created.
- `202 Accepted`: The request was processed and will be processed asap
- `400 Bad request`: The request could not be understood by the server due to malformed syntax (i.e Invalid schema)
- `401 Unauthorized`: If the social access token is invalid (checked with Facebook or Google SDK).
- `403 Forbidden`: The user might be authenticated but does not have the necessary permissions
- `404 Not Found`: The resource identifier is invalid or not recognized by the server
- `426`: If the client have an incompatible app version that needs to be updated (Force Update)
- `412 Precondition Failed`: There is ho precondition guaranties to process the request (validations)

Authorization
-------------

The `401 Unauthorized` error will follow the same error format and structure as every other endpoint of the API, in such case we will make use of the `reason` attribute in order to specify if the token expired (`token_expired`) or token was not provided (`token_non_provided`).

Error example:
```json
{
  "errors": [
    {
      "reason": "token_expired",
      "title": "Invalid authorization token",
      "message": "Invalid origin, the request has been refused"
    }
  ]
}


Force updates
-------------

Clients should send the next headers on every request to our api:

  * `bv-app-version`: `platform/typeApp/version/build` (**each value separated by `/`**) where:

    - `platform`: platform who make the request in lower case (ej: ios, android)
    - `typeApp`: app profile who make the request in lower case (ej: customer, driver, admin) if there are only one app could be mobile for mobile apps
    - `version`: current app version following semver standard (x.y.z)
    - `build` **(optional)** : current build version, could be number or letters

Force update errors will follow the same errors format and structure as every other endpoint of the API, taking into account the following fields need to be included:
    - error have to include a message to show in the alert
    - error have to include an URL for the app redirect

CORS errors
-----------

The `403 Forbidden` CORS error will follow the same error format and structure as every other endpoint of the API.

Error example:
```json
{
  "errors": [
    {
      "title": "Invalid request origin",
      "message": "Invalid origin, the request has been refused"
    }
  ]
}
```
