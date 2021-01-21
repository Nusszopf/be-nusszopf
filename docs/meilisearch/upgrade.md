# Upgrade Meilisearch

- [meili-docs](https://docs.meilisearch.com/guides/advanced_guides/installation.html#updating-meilisearch)

## Dev

- update `docker-compose`
- delete `data.ms`
- Reindex

## Stage/Prod

[meili-guide](https://github.com/meilisearch/MeiliSearch/discussions/1187)

1. [Create a Dump via Postman](https://docs.meilisearch.com/guides/advanced_guides/snapshots_and_dumps.html#creating-a-dump)
2. `systemctl stop meilisearch`
3. `rm -rf ../data.ms`
4. `curl -L https://install.meilisearch.com | sh`
5. `mv ./meilisearch /usr/bin/`
6. [Importing previously created Dump](https://docs.meilisearch.com/guides/advanced_guides/snapshots_and_dumps.html#import-a-dump) (`/usr/bin/meilisearch --db-path /data.ms --import-dump /dumps/<id>.dump`)
7. `systemctl restart meilisearch`
8. check via Postman: `https://search.nusszopf.org/version`
9. check via website `https://nusszopf.org/search`

## Delete Case

1. Delete `data.ms` folder
2. Create `index`
3. Update `ranking_rules`
4. Upload all data to meilisearch again (todo: write script)
