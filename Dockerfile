FROM hasura/graphql-engine:v1.3.3.cli-migrations-v2

COPY ./develop/migrations /hasura-migrations
COPY ./develop/metadata /hasura-metadata

CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT
