# remove any previously downloaded installer
rm podman-installer*.pkg

# Check if the macOS system is running on arm64 architecture
if [[ $(uname -m) == "arm64" ]]; then
  # Download the latest Podman release for macOS arm64
  curl -LO https://github.com/containers/podman/releases/download/v4.4.1/podman-installer-macos-arm64.pkg
else
  # Download the latest Podman release for macOS x86_64
  curl -LO https://github.com/containers/podman/releases/download/v4.4.1/podman-installer-macos-amd64.pkg
fi

# Install Podman
sudo installer -pkg podman-installer-macos*.pkg -target / -verbose

# Cleanup
rm podman-installer*.pkg