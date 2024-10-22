#!/bin/bash

# Fetch the latest entry from cliphist
latest_clip=$(cliphist list)

# Process the latest clip as needed
# For example, truncate if too long
processed_clip=$(echo $latest_clip | cut -c 1-50)

# Output the processed clip for Waybar
echo $processed_clip
