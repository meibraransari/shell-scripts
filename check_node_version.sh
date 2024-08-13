#!/bin/bash

# Print header
cat << 'EOF'
###############################################################################
# SCRIPT:      check_node_version.sh
# -----------------------------------------------------------------------------
# DESCRIPTION: This script checks if Node.js version 20.x.x is installed.
#              It reports the current version of Node.js or if it is not
#              installed.
# -----------------------------------------------------------------------------
# USAGE:       ./check_node_version.sh
# -----------------------------------------------------------------------------
# AUTHOR:      Ibrar Ansari
# DATE:        13-08-2024
# -----------------------------------------------------------------------------
# LICENSE:     MIT License (or other license)
###############################################################################
EOF

# Function to check if Node.js version 20.x.x is installed
check_node_version() {
    # Check if node is installed
    if command -v node >/dev/null 2>&1; then
        # Get the version of node
        local NODE_VERSION
        NODE_VERSION=$(node -v)

        # Check if the version starts with v20
        if [[ $NODE_VERSION == v20* ]]; then
            echo "Node.js version $NODE_VERSION is installed."
        else
            echo "Node.js is installed but the version is not 20.x.x (current version is $NODE_VERSION)."
        fi
    else
        echo "Node.js is not installed."
    fi
}

# Call the function
check_node_version
