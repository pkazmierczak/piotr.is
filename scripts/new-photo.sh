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

# Generate a random 8-character slug
SLUG=$(LC_ALL=C tr -dc 'a-z0-9' < /dev/urandom | head -c 8 || true)
PHOTO_DIR="$SITE_ROOT/content/photo/$SLUG"

mkdir -p "$PHOTO_DIR"
mv "$PHOTO_PATH" "$PHOTO_DIR/photo.jpg"

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
