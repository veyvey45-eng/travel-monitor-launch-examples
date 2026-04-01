#!/usr/bin/env bash
set -euo pipefail

if [ -z "${APIFY_TOKEN:-}" ]; then
  echo 'Please export APIFY_TOKEN before running this script.' >&2
  exit 1
fi

CURL_HEADERS=(-H "Authorization: Bearer ${APIFY_TOKEN}")
if [ -n "${TRAVEL_API_KEY:-}" ]; then
  CURL_HEADERS+=( -H "x-api-key: ${TRAVEL_API_KEY}" )
fi

curl "${CURL_HEADERS[@]}" "https://travelmonitorlab--travel-monitor-launch.apify.actor/travel/delivery/bundle"
