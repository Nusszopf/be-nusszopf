# Hasura – Environments

Multipe environments managed via [Heroku Pipelines](https://devcenter.heroku.com/articles/pipelines):

- Development (docker-componse-file)
- Staging (Heroku)
- Production (Heroku)

## Heroku App

Hasura GraphQL Engine can be used as a docker image. The only dependency is a PostgreSQL DB. Therefore an app on Heroku has three main parts:

- Dockerfile with [hasura/graphql-engine](https://hub.docker.com/r/hasura/graphql-engine) (`<version>.cli-migrations-v2`)
- App with stack-type `container` and `heroku.yml` to [building Docker Images on Heroku](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)
- [Heroku Postgres Addon](https://www.heroku.com/postgres)

### Good Starting Points

- [Repo: hasura/graphql-engine-heroku](https://github.com/hasura/graphql-engine-heroku)
- [Repo: ci/cd and devops](https://github.com/joshuarobs/obscure-hamlet-63320)

## Local Development

Use `docker-compose` ([hasura/install-manifests](https://github.com/hasura/graphql-engine/tree/master/install-manifests)) to run Hasura and PostgreSQL locally. [Postico](https://eggerapps.at/postico/) can be used as PostgreSQL Client for Mac. If the image is running, you can start the console via `hasura console --admin-secret=XXXXX` and make requests against the endpoint in `config.yaml`.

## Git Flow (Metadata/Migrations)

Hasura can be managed via [migration & metadata files](https://hasura.io/docs/1.0/graphql/manual/migrations/index.html) execuded by [hasura cli](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/index.html#hasuracli-manual). Hasura ships a special Docker image which can be used to [automatically apply migrations/metadata](https://hasura.io/docs/1.0/graphql/manual/migrations/advanced/auto-apply-migrations.html#auto-apply-migrations) when the server starts, which we use in the heroku-apps.

All changes have to be logged, to be able to migrate the changes to other environments. Therefore always run `hasura console`, which will automatically log metadata and migrations if you work on the hasura backend. You can also `squash` all migrations-files to one, for a better readable history.

### Workflow

1. Create a new branch from develop
2. Log metadata and migrations
3. Squash migrations (only use hasura-cli, if you want to squash)
4. Create a pull-request
5. Review & Testing
6. Merge pull-request into develop -> automatically updates staging environment on heroku

### Releaseflow

You can always merge develop into master to trigger a new release for production.

1. Merge develop via `release/new` branch into master
2. Create a new release on Github
3. Manually deploy to production via heroku-dashboad
4. Merge master back into develop

## Update Hasura Engine

Check latest release version [here](https://github.com/hasura/graphql-engine/releases).
Then, just update the version from the hasura-image in the Dockerfile und merge the changes.
