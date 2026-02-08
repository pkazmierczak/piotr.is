#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/new-photo.sh <photo.jpg> [location]
# Creates a Hugo page bundle in content/photo/<name>/ with EXIF date.

SITE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <photo.jpg> [location]"
    echo "  photo.jpg  - path to the JPEG file"
    echo "  location   - optional location string (e.g., 'Amsterdam, Netherlands')"
    exit 1
fi

PHOTO_PATH="$1"
LOCATION="${2:-}"

if [ ! -f "$PHOTO_PATH" ]; then
    echo "Error: File not found: $PHOTO_PATH"
    exit 1
fi

if ! command -v exiftool &> /dev/null; then
    echo "Error: exiftool is not installed."
    echo "Install with: brew install exiftool"
    exit 1
fi

# Extract EXIF date
EXIF_DATE_RAW=$(exiftool -s3 -DateTimeOriginal "$PHOTO_PATH" 2>/dev/null || true)

if [ -z "$EXIF_DATE_RAW" ]; then
    echo "Warning: No EXIF DateTimeOriginal found. Using file modification date."
    EXIF_DATE_RAW=$(date -r "$PHOTO_PATH" "+%Y:%m:%d %H:%M:%S")
fi

# Convert "2024:03:15 14:30:00" to "2024-03-15T14:30:00"
HUGO_DATE=$(echo "$EXIF_DATE_RAW" | sed 's/\([0-9]\{4\}\):\([0-9]\{2\}\):\([0-9]\{2\}\) /\1-\2-\3T/')

# Derive directory name from EXIF date (YYYY-MM-DD)
DIR_DATE=$(echo "$HUGO_DATE" | cut -dT -f1)

# Create page bundle (append suffix if date directory already exists)
PHOTO_DIR="$SITE_ROOT/content/photo/$DIR_DATE"
if [ -d "$PHOTO_DIR" ]; then
    COUNTER=2
    while [ -d "${PHOTO_DIR}-${COUNTER}" ]; do
        COUNTER=$((COUNTER + 1))
    done
    PHOTO_DIR="${PHOTO_DIR}-${COUNTER}"
fi

mkdir -p "$PHOTO_DIR"
cp "$PHOTO_PATH" "$PHOTO_DIR/photo.jpg"

cat > "$PHOTO_DIR/index.md" << EOF
---
date: ${HUGO_DATE}
photo: photo.jpg
location: "${LOCATION}"
title: "$(basename "$PHOTO_DIR")"
---
EOF

echo "Created: $PHOTO_DIR"
echo "  date:     $HUGO_DATE"
echo "  location: ${LOCATION:-'(not set - edit index.md to add)'}"
echo ""
echo "Edit $PHOTO_DIR/index.md to adjust title and location."
