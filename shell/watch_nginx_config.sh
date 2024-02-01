#!/bin/sh

# Define the directory to watch
watch_directory="/etc/nginx/sites-available/"

# Monitor the directory for changes and reload NGINX when they occur
while inotifywait -r -e modify,create,delete "$watch_directory"; do
    echo "Detected changes in NGINX configuration. Reloading..."
    nginx -t && nginx -s reload
done