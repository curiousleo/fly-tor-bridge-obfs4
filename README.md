# fly-tor-bridge-obfs4

__Launch an [obsf4 Tor bridge](https://tb-manual.torproject.org/circumvention/) on [Fly](https://fly.io) in *under a minute!*__

> obfs4 makes Tor traffic look random, and also prevents censors from finding bridges by Internet scanning.

# Setup

1. [Install `flyctl`](https://fly.io/docs/getting-started/installing-flyctl/).
2. Create an account with `flyctl auth signup` or log in with `flyctl auth login`.

You will also need [`jq`](https://stedolan.github.io/jq/).

# Deploy the obsf4 Tor bridge

```console
$ make deploy
```

This will create a new Fly app with a randomised name, generate a `fly.toml` file, and deploy the [obsf4 Tor bridge](https://gitlab.torproject.org/tpo/anti-censorship/docker-obfs4-bridge).

# Get the client configuration

```console
$ make bridge-line
```

Outputs the client configuration (aka "bridge line").
If you have [`qrencode`](https://fukuchi.org/works/qrencode/) installed, then the configuration will be displayed as a QR code.

Test your new bridge by following the instructions for the [desktop version](https://tb-manual.torproject.org/bridges/#entering-bridge-addresses) or the [mobile version](https://tb-manual.torproject.org/mobile-tor/#circumvention) of the Tor browser.
