# Toggle SOCKS proxy on macOS

### Pre-request

You have to set up a tunnel first.

```bash
ssh anyone@anyplace.com -D 9999
```

### Usage

```bash
# simply toggle
./toggle_socks_proxy.sh

# turn on PORT, e.g. 1234
./toggle_socks_proxy.sh [PORT]

# see help message
./toggle_socks_proxy.sh -h
```

