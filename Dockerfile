FROM hasura/graphql-engine:v1.3.3.cli-migrations-v2


COPY hasura/migrations ./hasura-migrations
COPY hasura/metadata ./hasura-metadata

CMD ["echo HOME: $HOME"]