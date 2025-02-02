#!/bin/bash

set -euo pipefail

cd "$(dirname $0)"

./update-dev.sh

java -cp zatikon-dev-latest.jar -Dserver.port=8374 leo.client.Client
