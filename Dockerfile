FROM hasura/graphql-engine:v1.3.2.cli-migrations-v2


COPY hasura/migrations ./hasura-migrations
COPY hasura/metadata ./hasura-metadata

#CMD ["echo", "$HOME"]
CMD bash heroku-exec.sh && graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT
