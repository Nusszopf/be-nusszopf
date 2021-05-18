FROM hasura/graphql-engine:v1.3.3.cli-migrations-v2

RUN echo '$HOME='
RUN echo $HOME

COPY ./hasura/migrations /hasura-migrations
COPY ./hasura/metadata /hasura-metadata

CMD bash heroku-exec.sh && graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT
