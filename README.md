# fly-tor-bridge-obfs4

Launch an [obsf4 Tor bridge](https://tb-manual.torproject.org/circumvention/) on [Fly](https://fly.io) **for free** and in **under a minute!**

> obfs4 makes Tor traffic look random, and also prevents censors from finding bridges by Internet scanning.

Fly lets you run up to three small VMs, 3 GB persistent volumes and 100 GB outbound data for free.
This setup uses 1 VM, a 1 GB persistent volume and 33 GB outbound data, allowing you to launch up to three bridges while staying within Fly's free tier.

# Set up `flyctl` and `jq`

1. [Install `flyctl`](https://fly.io/docs/getting-started/installing-flyctl/).
2. Create an account with `flyctl auth signup` or log in with `flyctl auth login`.

You will also need [`jq`](https://stedolan.github.io/jq/).

# Deploy the obsf4 Tor bridge

```
$ EMAIL=your@email.com ./deploy

[...]
Run 'CONFIG=bridge-[...]-fly.toml ./show-bridge-line' to display the client configuration.
```

This will create a new Fly app with a randomised name, generate a `fly.toml` file, and deploy the [obsf4 Tor bridge](https://gitlab.torproject.org/tpo/anti-censorship/docker-obfs4-bridge).

# Get the client configuration

If the deployment succeeded, then a configuration file will have been created. The last line of the output of the `deploy` script shows you the full path to the configuration file.

<pre>
$ CONFIG=bridge-[...]-fly.toml ./show-bridge-line

[...]
obfs4 213.188.207.9:6562 27BA119DCCD788BA880280706A844AA8768E8957 cert=BNBPLYgi35O0adzllTRHF06dR4bb1KppWdZM/3NlhAU5pVap0bX6qDxTNZatGNGy/WcKDA iat-mode=0
<div style="line-height=1.2">
█████████████████████████████████████████████████████
█████████████████████████████████████████████████████
████ ▄▄▄▄▄ █▀▄█▀███▀ ▄ █ ▀██▀▀  █ ▄▄█ █▀▄█ ▄▄▄▄▄ ████
████ █   █ █▀  ███▄█ ▄ ▄ ▄ █▀▀▀ ▄▀█▄█ █ ▀█ █   █ ████
████ █▄▄▄█ █▀ ▀ ▄▄▄ ▄███ ▄▄▄ ▀ █▄▀▄▀▀▀▄▄▄█ █▄▄▄█ ████
████▄▄▄▄▄▄▄█▄█ ▀ ▀▄▀▄█ ▀ █▄█ ▀ ▀ █ █▄█▄▀ █▄▄▄▄▄▄▄████
████  ▄  ▀▄▄  ▄██▀█▀██  ▄   ▄█▄█▀█ █ ▀▄▀█▄▀ █▄█ ▀████
████▀▀▀▀▀▀▄██▀▀▀  ▄▀██▀▄▀▀▄█     ▄██▀ ██ ▄▄█ █▀▄▀████
████▀▀▄ ▄▀▄ ▀▄▀█▀▀▀▀▄█▄█▄▀▄█▄█▀▄ █▄▀█ ▀▄▀█▄▄ ▄▀ █████
█████▄▀▄█▄▄▀█▄█ █▄  ▀█ █▄ ▀▀ ▄▀ █▀█▀█▄ ▀▀█  ▄▄▀▀█████
████▄  ▄▀█▄▄▄  █▀▄▄▄▀█ ▄█▀▄▀  █ ▀▄▀█▀█ ▄ ▀█▄▄▄▀█ ████
████▄▀  ▄█▄ █▀█  ▄▀▄ ▄▄▄▄▀▀█▀▀█▀▀█▀▀  ▀▀█  ▀ ▄ ▄▀████
████ ▄█  ▄▄▄ ▀▄ ▄▀▀▀▀█▄▀ ▄▄▄ ▄  ▀█▀██    ▄▄▄  ▀█▀████
████ █▀▄ █▄█ ████▀██▄▄██ █▄█ ▀▄ ▄ ▀█▄▀██ █▄█ █ █▀████
████▄██ ▄ ▄▄  ▀▀▄▀█▀█▄▀▀▄▄ ▄ ▄█▀▀ ▄█▄▀▀ ▄ ▄ ▄█▀█▀████
████▀▄▄▄▀▀▄ █ ▄▀█▄▀▀█▄▀ ▀   ▄█▀█▀▀▄ █ ▀▀██▀ ▀▄  ▀████
████▀▀██ ▀▄  █▀▄ █▀  ▀█ ▄▄█▄ ▄  ▄█ ██    ▄▀▀█▄   ████
████▄ ▀ █▀▄██  ▄▀▄   ▀    ▀█▀ ▄▄▀█▀█▄█▄  ▄█▄▄ ▄▀▀████
████▄▄▄▀▄ ▄ ██▀▄ ▄▄▄▀▀ █▄▄ █▀█▀▀▀█  ▀▄▀▄▀▄▀▀▄███ ████
█████▀▀▀ █▄▀ ▄█▄ █ ▄ ▀▄▀█▀▀▄ ▄▄▄▀█▄▀▀▀ ▄█▀▄ ▀█▄ █████
████▄██▄▄█▄▄ █ █▀█▀▀▀▀█  ▄▄▄ ▄▀▄██▀█▄ █  ▄▄▄ ▀█ █████
████ ▄▄▄▄▄ █▄██▀ ▀█▀▀▄█▄ █▄█ █ ▀▄█▀█▀▄   █▄█ ▀▀██████
████ █   █ █ █▄▀▄▀█▀█▄▀▄    ▄▄▄  ▄ ▄  ▀  ▄▄ ▄  █▄████
████ █▄▄▄█ █ ▀█▀█▀▄▀█▄  ▀▀ ▄▄ █▀▀  ▀▀ ▀▀███ ▀▄▄██████
████▄▄▄▄▄▄▄█▄█▄██████████████▄█▄█▄████▄▄▄████▄█▄█████
█████████████████████████████████████████████████████
█████████████████████████████████████████████████████
</div>
</pre>

This outputs the client configuration (aka "bridge line").
If you have [`qrencode`](https://fukuchi.org/works/qrencode/) installed, then the configuration will be displayed as a QR code.

Test your new bridge by following the instructions for the [desktop version](https://tb-manual.torproject.org/bridges/#entering-bridge-addresses) or the [mobile version](https://tb-manual.torproject.org/mobile-tor/#circumvention) of the Tor browser.
