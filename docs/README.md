# Project Name

Project description

## Prerequisites

List all dependencies needed to run the project, example:

- [Leiningen][1] 2.0 or above
- PostgreSQL 9.5.x
- [SASS Compiler][2]

[1]: https://github.com/technomancy/leiningen
[2]: https://instructions-to-install-sass-compiler

## Configuration

List all the ENV variables or configuration needed in order to run the project locally

Example:

The first time you need to run all database migrations via `lein migratus migrate`

Update your local database url on `profiles.clj`, also the following ENV variales are needed:

- ONESIGNAL_APPID
- ONESIGNAL_APIKEY

## Running

List all instructions needed to run the project

- Start local web server by typing `lein run`

Web server will listen on `localhost:3000`
API docs can be accessed via `/swagger-ui`

## Deployment/Build

Put all instructions needed to perform an actual deploy:

1. Add dokku remote `git remote add staging dokku@dev.barista-v.com:vinder-staging`
2. Deploy by running `git push staging master`
3. In case you want to deploy an specific branch use `git push staging yourfancybranch:master`

Keep in mind the following ENV variables are needed:
- SOME_KEY
- ANOTHER_KEY

Staging server is deployed at `http://vinder-staging.dev.barista-v.com`

## License

Copyright © 2016 Barista Ventures
