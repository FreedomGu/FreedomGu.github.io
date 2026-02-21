#!/bin/bash

# Script to generate thumbnails from video files
# Requires ffmpeg: brew install ffmpeg

echo "Generating video thumbnails..."

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it with: brew install ffmpeg"
    exit 1
fi

# Generate thumbnail for ENVISION video
if [ -f "./ENVISION/env/demos/Envision_demo.mp4" ]; then
    echo "Generating thumbnail for Envision_demo.mp4..."
    ffmpeg -i ./ENVISION/env/demos/Envision_demo.mp4 -vframes 1 -q:v 2 ./ENVISION/env/demos/Envision_demo_thumb.jpg -y
fi

# Generate thumbnail for BalanceHead video
if [ -f "./ICLR2026/balancehead_after.mp4" ]; then
    echo "Generating thumbnail for balancehead_after.mp4..."
    ffmpeg -i ./ICLR2026/balancehead_after.mp4 -vframes 1 -q:v 2 ./ICLR2026/balancehead_after_thumb.jpg -y
fi

# Generate thumbnail for DiffPortrait360 video
if [ -f "./DiffPortrait360/Diff360/Teaser_video.mp4" ]; then
    echo "Generating thumbnail for Teaser_video.mp4..."
    ffmpeg -i ./DiffPortrait360/Diff360/Teaser_video.mp4 -vframes 1 -q:v 2 ./DiffPortrait360/Diff360/Teaser_video_thumb.jpg -y
fi

echo "Done! All thumbnails generated."
