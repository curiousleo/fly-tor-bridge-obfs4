# fly-tor-bridge-obfs4

Launch an obsf4 Tor bridge on Fly **for free** and in **under a minute!**

> [obfs4](https://tb-manual.torproject.org/circumvention/) makes Tor traffic look random, and also prevents censors from finding bridges by Internet scanning.

[Fly](https://fly.io/docs/about/pricing/#free-allowances) lets you run up to three small VMs, 3 GB persistent volumes and 100 GB outbound data for free.
This setup uses 1 VM, a 1 GB persistent volume and 33 GB outbound data, allowing you to launch up to three bridges while staying within Fly's free tier.

## Set up `flyctl` and `jq`

1. [Install `flyctl`](https://fly.io/docs/getting-started/installing-flyctl/).
2. Create an account with `flyctl auth signup` or log in with `flyctl auth login`.

You will also need [`jq`](https://stedolan.github.io/jq/).

## Deploy the obsf4 Tor bridge

```
$ EMAIL=your@email.com ./deploy # To specify where in the world to deploy the bridge, see below.
[...]
Run 'CONFIG=bridge-[...]-fly.toml ./show-bridge-line' to display the client configuration.
```

This will create a new Fly app with a randomised name, generate a Fly configuration file, and deploy the [obsf4 Tor bridge](https://gitlab.torproject.org/tpo/anti-censorship/docker-obfs4-bridge).

By default, the bridge will start in Frankfurt, Germany (fra).
To run the bridge somewhere else, pick a region from `flyctl platform regions` and deploy with `REGION=xyz EMAIL=your@email.com ./deploy`.

## Get the client configuration

If the deployment succeeded, then a configuration file will have been created. The last line of the output of the `deploy` script shows you the full path to the configuration file.

```
$ CONFIG=bridge-[...]-fly.toml ./show-bridge-line
[...]
obfs4 213.188.219.143:63132 280C959B47FBF579CC6852993B83549BC61733DE cert=nH0moM+NS5AKvfFaMCEy4xiCkVeY9drilJ/bWH0lHK8kzpSpr75vrRdcGGvUEBcTinMHDg iat-mode=0
```
![QR code](/asset/qrcode.png "QR code")

This outputs the client configuration (aka "bridge line").
If you have [`qrencode`](https://fukuchi.org/works/qrencode/) installed, then the configuration will be displayed as a QR code.

Test your new bridge by following the instructions for the [desktop version](https://tb-manual.torproject.org/bridges/#entering-bridge-addresses) or the [mobile version](https://tb-manual.torproject.org/mobile-tor/#circumvention) of the Tor browser.

## Further info and troubleshooting

Open your [Fly dashboard](https://fly.io/apps/) to view logs and metrics and manage your apps.

Note that it takes a few days for your bridge to be picked up by the Tor network.
There are good reasons for this, see [The lifecycle of a new relay](https://blog.torproject.org/lifecycle-of-a-new-relay/).

This guide is based on the [Docker deployment guide](https://community.torproject.org/relay/setup/bridge/docker/) for obfs4.
