#!/bin/bash

set -euo pipefail

# Check base url
BASEURL_OPTION=""
if [ "${INPUT_BASEURL}" != "." ]; then
    BASEURL_OPTION="--base-url ${INPUT_BASEURL}"
fi

# Check base url
DRAFTS_FLAG=""
if [ "${INPUT_DRAFTS}" = true ]; then
    DRAFTS_FLAG="--drafts"
fi

# Build
cd "${INPUT_ROOT}"
eval zola build "${DRAFTS_FLAG}" "${BASEURL_OPTION}" --output-dir "${INPUT_OUTPUT}"
