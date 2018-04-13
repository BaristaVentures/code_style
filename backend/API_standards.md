# API Standards

## Naming conventions

### PATH/Routes naming conventions
All URL will follow `lisp-case` convention,

### API input/output naming conventions
All JSON objects and parameters sent and received from the API will follow the `snake_case` convention.

Example:
```json
{
  "first_name": "Jon",
  "last_name": "Doe",
  "age": 45
}
```

Query string parameters will follow the same convention, example: `GET /api/questions?page_size=8&page_number=4`

## API Requests

### CRUD, Verbs, and Actions
A resourceful route provides a mapping between HTTP verbs and URLs to
controller actions. By convention, each action also maps to a specific CRUD
operation in a database.

Example for a `Question` resource:

| HTTP Verb | Path             | Service#Function     | Used for                                     |
| --------- | ---------------- | -------------------- | -------------------------------------------- |
| GET       | /questions       | questions#index      | list all questions (filterable query string) |
| POST      | /questions       | questions#create     | create a new question                        |
| GET       | /questions/:id   | questions#show       | display a specific question                  |
| PUT       | /questions/:id   | questions#update     | update a specific question                   |
| DELETE    | /questions/:id   | questions#delete     | delete a specific question                   |

Non CRUD operation will follow the same pattern, example:

| HTTP Verb | Path              | Service#Function     | Used for                                     |
| --------- | ----------------  | -------------------- | -------------------------------------------- |
| GET       | /questions/search | questions#search     | search questions (filterable query string)   |

Nested resources will follow the same pattern:

| HTTP Verb | Path                 | Service#Function     | Used for                                     |
| --------- | -------------------  | -------------------- | -------------------------------------------- |
| GET       | /company/:id/members | members#index        | list all members for a specific company      |

## API Responses

All endpoints should return a seamless response, independent of the endpoint action or expected result values.

### Sessions

To perform Login should be `POST /sessions` with email and password and it will returns an object with the auth information (token, expire date, etc) and the user information, being same User entity as in the others endpoints, everything inside of the payload key `data`.

Response example:

```json
{
    "data": {
      "auth_token": "qwerty123456",
      "user": {
        "name": "Jhon Doe",
        "email": "Jhon.Doe@example.com"
      }
    }
}
```

### JSON object response
Every endpoint should return a JSON object inside of the payload key `data` , rather than  collection or plain values.

Example:

```json
{
  "data": [{"id": 1, "description": "desc 1"},
                {"id": 2, "description": "desc 2"}]
}
```

### Pagination
Pagination details would be sent in the `meta` attribute, as part of the same JSON object.

The backend currently support 2 kinds of pagination, index-based and scoped.

- Index-based pagination allows the API client to get all resources greater than a given index identifier (i.e. infinite scrolls)
- Scoped pagination allows the API client to know how many pages are remaining, and jump to an specific page forward or backwards

When possible, index-based pagination would be preferred, mostly because it haves a much lower cost at the database level.

Index-based pagination
----------------------

Suggested query string inputs, `page_size` and `lower_index`.

Example `GET /questions?page_size=8&lower_index=4`

Response Example:
```json
{
  "meta": {
            "current_index": 1
          },
  "data": [
                 {"id": 1, "description": "desc 1"},
                 {"id": 2, "description": "desc 2"}
               ]
}
```

Scoped pagination
-----------------

Suggested query string inputs, `page_size` and `page_number`.

Example `GET /questions?page_size=8&page_number=4`

Response Example:
```json
{
  "meta": {
            "total_pages": 5,
            "current_page": 1
          },
  "data": [
                 {"id": 1, "description": "desc 1"},
                 {"id": 2, "description": "desc 2"}
               ]
}
```

### Error messages policies

Each project should have a common shared error list, this will ensure every team member use the same wording and the code and reason are the same across frontend and backend.

The structure for such file is simple: `Code, Title, Message`

### Error Handling

All errors should follow the same structure, each error object in the collection represent one single error.

The error object will always respond to the following attributes:
- message
- title
- timestamp with `yyyy-MM-ddTHH:mm:ss.SSSZ`

But other (optional) attributes could be added when needed
- attribute
- position
- code
- url

In general a `412 Precondition failed` will be used, please refer to the [Status Codes](status_codes) section for other scenarios references.

Not Found example:
```json
{
  "errors": [
    {
      "title": "Resource not found",
      "message": "User not found, please check your identifier",
      "timestamp": "2018-03-12T18:30:00.SSSZ"
    }
  ]
}
```

Validation error example:
```json
{
  "errors": [
    {
      "title": "Invalid format",
      "message": "The email haves an invalid format",
      "timestamp": "2018-03-12T18:30:00.SSSZ"
      "attribute": "email"
    },
    {
      "title": "Invalid format",
      "message": "The password length should be at least 8 characters",
      "timestamp": "2018-03-12T18:30:01.SSSZ"
      "attribute": "password"
    }
  ]
}
```

For those fields accepting collections, the error should point to the specific index with errors, example:
```json
{
  "errors": [
    {
      "title": "Record not found",
      "message": "User not found, invalid identifier",
      "attribute": "user_ids",
      "timestamp": "2018-03-12T18:30:00.SSSZ",
      "position": 1
    },
    {
      "title": "Duplicated record",
      "message": "The user was already associated with the book",
      "attribute": "user_ids",
      "timestamp": "2018-03-12T18:30:00.SSSZ",
      "position": 2
    }
  ]
}
```

Validations will return status code `412` (precondition failed)

### Force updates
Check [Backend document](readme.md) for more details about force updates handling.

### Uploads
Multipart and binary block uploads should be avoided at all cost.
Instead we encourage the API consumer to upload file to S3 and provide the resulting URL/resource to the API.

### Endpoint contracts and entities
Each endpoint should have a shared [schema](https://github.com/plumatic/schema), entities reduction is encouraged so we all schemas can be match with entities on both backend and frontend.

## API Versioning
In general the API would be versioned via URL, we're aware of another mechanisms involving header parameters and other stuff, but we consider the URL versioning to be just easier to debug.

## Integration with 3rd party API's
All 3rd party integrations should be performed in the Barista Framework (when possible), to avoid repeated code across projects.

## OAuth
TODO

## Logging
All logs should be use the standard Clojure logging, so far log4j is being used but others may be considered.
Servers have to be configured to centralize logs on Papertrail.

- `info` would  be used for general notifications, such as successful responses from 3rd party API's
- `debug` would be used for unhandled errors and other exceptions

## Other topics

### Date/time timezones handling
`Date` data types should be avoided, all data should be persisted along with the timezone, to avoid possible issues with the API consumers timezone conversions.

## Internationalization
Internationalization would be handled by the API, all messages should be sent in the appropriates language for the authenticated user.

## Seed data
TODO
