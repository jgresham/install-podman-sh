# remove any previously downloaded installer

# Download
# URL="https://github.com/containers/podman/releases/download/v4.4.1/podman-v4.4.1.msi"
Invoke-WebRequest -Uri https://github.com/containers/podman/releases/download/v4.4.1/podman-v4.4.1.msi -OutFile .\podman-v4.4.1.msi

# Install Podman (installs at /opt/podman)
msiexec /a .\podman-v4.4.1.msi /qn /lv .\log.txt
bash -c "cat log.txt"

# Cleanup
# rm podman-installer*.pkg