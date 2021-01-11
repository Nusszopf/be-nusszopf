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
- DigitalOcean: Meilisearch environment (stage/prod)
- Vercel: Frontend environment, serverless functions and domain `nusszopf.org`

### Services

- Auth0: Authentication
- SendGrid: E-Mails
- MailBox: Provider for `nusszopf.org` mails

### Analytics

- VisitorAnalytics
- Logging/Monitoring (wip)

## Docs

- [Auth0](./docs/auth0/rules.md)
- [Hasura](./docs/hasura)
- [Meilisearch](./docs/meilisearch)
