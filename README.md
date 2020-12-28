<p align="center">
  <a href="https://nusszopf.org">
    <img src="./docs/images/1200x630.png" alt="Nusszopf logo" height="165">
  </a>
</p>

# Nusszopf Backend

The repository contains all the logic for search-api, graphql-api and auth0-rules. It also provides scripts to start `meilisearch` and `hasura` via docker locally.

## Cloud & Services

### Hosting

- Heroku: Hasura environmen (stage/prod)
- DigitalOceans: Meilisearch environment (stage/prod)
- Vercel: Frontend environment, serverless functions and domain `nusszopf.org`

### Services

- Auth0: Authentication
- SendGrid: E-Mails
- MailBox: Provider for `nusszopf.org` mails

### Analytics

- VisitorAnalytics
- Logging/Monitoring (wip)

## Docs

### Hasura

- [Environments](./docs/hasura/environments.md)
- [Export GraphQL Schema](./docs/hasura/schema.md)
- [101](./docs/hasura/101.md)

### Meilisearch

- [Environments](./docs/meilisearch/environments.md)
- [Setup](./docs/meilisearch/setup.md)
- [Considerations](./docs/meilisearch/considerations.md)

### Auth0

- [Rules](./docs/auth0/rules.md)
