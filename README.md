# fly-tor-bridge-obfs4

Launch an obsf4 Tor bridge on fly.io in no time!

# Setup

1. [Install Flyctl](https://fly.io/docs/getting-started/installing-flyctl/).
2. Create an account with `flyctl auth signup` or log in with `flyctl auth login`.

# Launch the obsf4 Tor bridge

```console
$ flyctl launch --generate-name --region fra --image thetorproject/obfs4-bridge:latest
$ ./write-config-json >config.json
# MANUAL STEP: Edit the "email" field in config.json
$ 3-write-fly-toml >fly.toml
$ flytctl deploy
$ 4-get-bridge-line
```
