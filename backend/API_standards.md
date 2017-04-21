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

### JSON object response
Every endpoint should return a JSON object with the appropriate `payload key`, rather than  collection or plain values.

Example:

```json
{
  "questions": [{"id": 1, "description": "desc 1"},
                {"id": 2, "description": "desc 2"}]
}
```

### Pagination
Pagination details would be sent as part of the same JSON object.
Suggested query string inputs, `page_size` and `page_number`.

Example `GET /questions?page_size=8&page_number=4`

Response Example:
```json
{
  "meta": {
            "total_pages": 5,
            "current_page": 1
          },
  "questions": [
                 {"id": 1, "description": "desc 1"},
                 {"id": 2, "description": "desc 2"}
               ]
}
```

### Error Handling
All errors should follow the same `key: value` structure, each key represent the specific attribute with error.

Input validation example:
```json
{ "email": "Invalid email format",
  "password": "Invalid length, it should be at least 8 characters"}
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
TODO

## Integration with 3rd party API's
TODO

## OAuth
TODO

## Logging
TODO

## Other topics

### Date/time timezones handling
TODO

## Multilanguages

### Barista Framework
There is a set of components that are spread and/or duplicated across several projects, but can be tied up as a `clojar` package in order to be reused seamless on all API's.

- CORS ruler
- Schema errors humanizer
- Authorization middleware
- API integrations (S3, Sendgrid, OneSignal)
- Error humanizer
- Current set of utils helpers (validators, dates, parsers, paginator, etc)
- Luminus template with the Registration/Authentication workflow
