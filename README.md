# install-podman-sh

The primary purpose of this repo is to performance test different versions of Podman on demand on Mac. It also provides shell scripts to quickly install a specific version of Podman.

## Possible additional work

### Reliability testing:

1. Start/stop podman multiple times
2. Interrupt "podman run" commands with "podman stop" or machine stop commands
3. Simulate "bad" user behavior to try and "break" Podman

### More timing

### Test more machine types (Podman 5)

1. Assign different resources to machine
2. Default is 2 cores and 2GB, but GitHub Runner has 4 cpus and 14 GB memory

## Install scripts

### Mac

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jgresham/install-podman-sh/main/install-mac.sh)"
```
