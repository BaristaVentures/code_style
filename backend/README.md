# Backend styles

Http Status Codes
--------------

Status codes for common escenarious:

* Social Login:
	- `424 Failed Dependency`: If the user dont exist on the db.
	- `200`: If the user exists in the db, should return the session token.

* Force update:
    - `412`: If the user have an app version that should be updated.