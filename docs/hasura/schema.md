# Hasura – GraphQL-Schema

Instructions to share, introspect or export the GraphQL schema: [hasura documentation](https://hasura.io/docs/1.0/graphql/manual/schema/export-graphql-schema.html).

## Export `schema.graphql`

```zsh
npm install -g graphqurl
gq http://localhost:8080/v1/graphql -H 'X-Hasura-Admin-Secret: adminsecretkey' --introspect > schema.graphql
```

## Export `schema.json`

```zsh
npx apollo schema:download --endpoint http://localhost:8080/v1/graphql --header 'X-Hasura-Admin-Secret: adminsecretkey'
```
