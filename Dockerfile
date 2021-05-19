FROM hasura/graphql-engine:v1.3.4.cli-migrations-v2

# Add our migrations and metadata
COPY ./hasura/migrations /hasura-migrations
COPY ./hasura/metadata /hasura-metadata
WORKDIR /

ENV HOME=/root
RUN echo $HOME
RUN whoami
RUN ls -la

# Run the image as a non-root user
RUN adduser -D nzuser
USER nzuser

# Run the app. CMD is required to run on heroku
CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT
