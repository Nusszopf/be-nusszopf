# Meilisearch – Production Setup

All instructions can be found here: [Tutorial](https://docs.meilisearch.com/running-production/#a-quick-introduction).
Good source to start with DigitalOcean: [Tutorial](https://www.youtube.com/watch?v=Q-PaRVFhMXs&list=PLYxzS__5yYQk7h6aoN5_rvvvC8WUMxAaB).

## Notes

- use `../etc/` because `etc` is one level above the `root`
- you can use `vim` to edit files

### Step 0

- setup ssh: config like

```bash
Host droplet-ipv4
 IdentityFile ~/.ssh/digitalocean/id_rsa
```

### Step 2

- replace `enter-your-key` with your key

### Step 3

- because `nusszopf.org` domain is handled by Vercel, you have to edit the DNS-Records there. Add `A` with subdomain e.g. `search.dev` and ipv4 of your Droplet as value.
- answer the question regarding certbot domainname with `search.dev.nusszopf.org`
- choose: always redirect to https

### Step 4

Meilisearch instance is now production-ready! For now you have to add the public-key to each request and the GUI of Meilisearch is now no longer visible, only the API can be used.
Check: `https://search.dev.nusszopf.org/indexes`

### Custom Step

- Add a firewall, as described in the DigitalOcean Tutorial: [Video](https://www.youtube.com/watch?v=gwu313WjquM&list=PLYxzS__5yYQk7h6aoN5_rvvvC8WUMxAaB&index=13)
- Add alert policy (monitoring): cpu above 80% for 5min for all droplets

## Update Meilisearch Instance (cURL)

- [Meilisearch Guide](https://docs.meilisearch.com/guides/advanced_guides/installation.html#updating-meilisearch)

## Links

- [Linux Services](https://www.hostinger.com/tutorials/manage-and-list-services-in-linux/)
- [Manage Systemd Services](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [Nginx Reverse Proxy](https://www.keycdn.com/support/nginx-reverse-proxy)
- [Certbot](https://certbot.eff.org/about/)