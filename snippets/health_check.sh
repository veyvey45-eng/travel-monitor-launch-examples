#!/usr/bin/env bash
set -euo pipefail

if [ -z "${APIFY_TOKEN:-}" ]; then
  echo 'Please export APIFY_TOKEN before running this script.' >&2
  exit 1
fi

curl "https://travelmonitorlab--travel-monitor-launch.apify.actor/health?token=${APIFY_TOKEN}"
