# remove any previously downloaded installer
rm -v podman-installer*.pkg
# remove previous installation config (only do for fresh install)
# https://stackoverflow.com/questions/72562644/podman-on-mac-throws-error-when-running-podman-machine-init/72571826#72571826
rm -rfv ~/.config/containers/
rm -rfv ~/.local/share/containers
rm -v ~/.ssh/podman*

PODMAN_VERSION=4.8.2

# Check if the macOS system is running on arm64 architecture
if [[ $(uname -m) == "arm64" ]]; then
  echo "Downloading arm64 Podman"
  # Download the latest Podman release for macOS arm64
  curl -LO https://github.com/containers/podman/releases/download/"$PODMAN_VERSION"/podman-installer-macos-arm64.pkg
else
  echo "Downloading x86_64 Podman"
  # Download the latest Podman release for macOS x86_64
  curl -LO https://github.com/containers/podman/releases/download/"$PODMAN_VERSION"/podman-installer-macos-amd64.pkg
fi

# Install Podman (installs at /opt/podman)
sudo installer -pkg podman-installer-macos*.pkg -target / -verbose

