# Local Development

## Docker-Compose

- Basic docker-compose file: [react-meiliserach example](https://github.com/riccardogiorato/meili_react_demo/tree/master/backend)
- Env vars [meilisearch/docs](https://docs.meilisearch.com/guides/advanced_guides/configuration.html#options)

## CORS

- [nginx-cors-proxy with docker-compose](https://gist.github.com/iki/1247cd182acd1aa3ee4876acb7263def)
- [enable-cors.org](https://enable-cors.org/server_nginx.html)
- additional header to enable-cors: `Access-Control-Allow-Headers X-Meili-Api-Key,Access-Control-Allow-Origin,...`
- additional header to enable-cors: `Access-Control-Allow-Credentials true;`

## Usage

1. Run `yarn docker:up` to start server
2. HTTP-Request against `http:127.0.0.1:8000`
