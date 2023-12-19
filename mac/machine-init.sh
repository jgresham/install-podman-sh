#!/bin/bash

# Print sys info (macOS)
num_cpus=$(sysctl -n hw.ncpu)
total_mem=$(sysctl -n hw.memsize)
total_mem_mb=$((total_mem / 1024 / 1024))
echo "Number of CPUs: $num_cpus"
echo "Total Memory: ${total_mem_mb} MB"

time podman machine init --rootful --cpus "${num_cpus}" --memory "${total_mem_mb}"
