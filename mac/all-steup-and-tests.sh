#!/bin/bash

#   - name: install.sh Podman
time ./mac/install-mac.sh
# echo "/opt/podman/bin" >> $GITHUB_PATH

# On macOS, podman machine init is required before version and info work
#   - name: Podman machine init
./mac/machine-init.sh

#   - name: Podman machine start
time podman machine start

#   - name: Podman version
podman version

#   - name: Podman info
podman info

#   - name: Pull BenchBuddy
time podman pull ghcr.io/nicenode/benchbuddy

# The performance test
#   - name: Run BenchBuddy eth-node test
time podman run ghcr.io/nicenode/benchbuddy -r eth-node -f json

#   - name: Podman machine stop
time podman machine stop

# The reliability test
#   - name: Run Podman reliability test
time ./mac/reliabilty-mac.sh