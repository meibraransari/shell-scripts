#!/bin/bash
# Perform Nginx configuration test
sudo nginx -t > /dev/null 2>&1
# Check if the Nginx test failed
if [ $? -ne 0 ]; then
    echo "Nginx test failed. Exiting script."
    exit 1
fi
echo "Nginx test Passed."
# If the test passed, reload Nginx
sudo service nginx reload
# Check if Nginx reload was successful
if [ $? -eq 0 ]; then
    echo "Nginx service reloaded successfully."
else
    echo "Failed to reload Nginx service."
fi
