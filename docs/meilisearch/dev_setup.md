# Local Development

## Docker-Compose

- Basic docker-compose file: [react-meiliserach example](https://github.com/riccardogiorato/meili_react_demo/tree/master/backend)
- Env vars [meilisearch/docs](https://docs.meilisearch.com/guides/advanced_guides/configuration.html#options)

## CORS

- Allow CORS on server side via nginx-cors-proxy: [code example](https://gist.github.com/iki/1247cd182acd1aa3ee4876acb7263def)
- Disable cors in safari/firefox/chrome
  - safari: via menu: "Develop/Disable Cross-Origin Restrictions"
  - chrome: add extension: [allow-cors-access-control](https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf)
  - firefox: add extension: [cors-everywhere](https://addons.mozilla.org/en-US/firefox/addon/cors-everywhere/)

## Usage

1. Run `yarn docker:up` to start server
2. Enable CORS in the browser (maybe reload needed)
3. HTTP-Request against `http:127.0.0.1:8000`
