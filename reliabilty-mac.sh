#!/bin/bash

# Number of times to start and stop the machine
REPEAT_COUNT=5

# Podman machine name
MACHINE_NAME="podman-machine-default"

# Start and stop the machine
for i in $(seq 1 $REPEAT_COUNT); do
    echo "Attempt $i: Starting Podman machine..."
    podman machine start "$MACHINE_NAME"

    if [ $? -ne 0 ]; then
        echo "Failed to start Podman machine on attempt $i."
        exit 1
    fi

    echo "Podman machine started successfully."

    echo "Stopping Podman machine..."
    podman machine stop "$MACHINE_NAME"

    if [ $? -ne 0 ]; then
        echo "Failed to stop Podman machine on attempt $i."
        exit 1
    fi

    echo "Podman machine stopped successfully."
done

# Run a test container
echo "Running a test container to verify Podman functionality..."
podman run --rm hello-world

if [ $? -eq 0 ]; then
    echo "Test container ran successfully. Podman is working."
else
    echo "Failed to run the test container. There may be an issue with Podman."
    exit 1
fi

echo "Reliability test completed."
