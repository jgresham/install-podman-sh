# remove any previously downloaded installer
rm podman-installer*.pkg

echo $PATH

# Check if the macOS system is running on arm64 architecture
if [[ $(uname -m) == "arm64" ]]; then
  # Download the latest Podman release for macOS arm64
  curl -LO https://github.com/containers/podman/releases/download/v4.4.1/podman-installer-macos-arm64.pkg
else
  # Download the latest Podman release for macOS x86_64
  curl -LO https://github.com/containers/podman/releases/download/v4.4.1/podman-installer-macos-amd64.pkg
fi

# Install Podman (installs at /opt/podman)
sudo installer -pkg podman-installer-macos*.pkg -target / -verbose
ls /opt/podman/bin
export PATH="/opt/podman/bin:$PATH"
echo $PATH

source ~/.bash_profile
# echo $PATH

# Cleanup
# rm podman-installer*.pkg