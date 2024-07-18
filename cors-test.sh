#!/usr/bin/env bash
set -euo pipefail
TARGET_URL="https://www.google.com"   # for sample only
ORIGIN_HOST="https://www.example.com" # for sample only
echo "Calling:    ${TARGET_URL}"
echo "From:       ${ORIGIN_HOST}"
echo "----"
curl -I ${TARGET_URL} -X OPTIONS \
  -H "Access-Control-Request-Method: OPTIONS" \
  -H "Origin: ${ORIGIN_HOST}"
# CHECK for the "access-control-allow-" headers in the response
