#!/bin/bash

set -euo pipefail

LATEST_URL=$(curl -LSs https://api.github.com/repos/zatikon/zatikon/releases/197933187/assets | jq -r 'map(select(.name | test("zatikon-dev-linux"))) | max_by(.created_at).browser_download_url')

FILENAME=$(basename "$LATEST_URL")

if [[ ! -f "$FILENAME" ]]; then
    echo "Downloading latest version from: $LATEST_URL"

    curl -Lo "$FILENAME" "$LATEST_URL"

    ln -sf "$FILENAME" zatikon-dev-latest.jar
else
    echo "$FILENAME already exists!"
fi


