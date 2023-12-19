# remove any previously downloaded installer
rm -v podman-installer*.pkg
# remove previous installation config (only do for fresh install)
# https://stackoverflow.com/questions/72562644/podman-on-mac-throws-error-when-running-podman-machine-init/72571826#72571826
rm -rfv ~/.config/containers/
rm -rfv ~/.local/share/containers
rm -v ~/.ssh/podman*

# Download the Podman version for macOS arm64/amd64
PODMAN_VERSION=4.8.2

# Check if the macOS system is running on arm64 architecture
arch=arm64
if [[ $(uname -m) == "arm64" ]]; then
  echo "Downloading arm64 Podman"
else
  echo "Downloading x86_64 Podman"
  arch=amd64
fi

pkg_name=podman-installer-macos-${arch}.pkg
url=https://github.com/containers/podman/releases/download/v$PODMAN_VERSION/$pkg_name
echo downloading pkg from $url ...
# Download the pkg
curl -LO $url

# Install Podman (installs at /opt/podman)
# sudo installer -pkg podman-installer-macos*.pkg -target / -verbose
echo installing...
sudo installer -pkg $pkg_name -target / -verbose

