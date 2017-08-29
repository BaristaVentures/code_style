# Clojure Code Style

In general the following code style will be used https://github.com/bbatsov/clojure-style-guide

Clojure variables conventions
-----------------------------
All clojure internal code will follow the lower case with `-` as divider like: `first-name`.

API consumer / user facing conventions
--------------------------------------

Every API consumer will follow the `snake_case` convention, that applies for request body, response body and query string parameters.

Common examples
---------------

- URL conventions `GET /users?gender_type=1`
- API input parameters `POST /users` with `{first_name: "Jon Doe"}`
