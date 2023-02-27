#!/bin/bash

set -euo pipefail

# Check base url
BASEURL_OPTION=""
if [ "${INPUT_BASE-URL}" != "." ]; then
    BASEURL_OPTION="--base-url ${INPUT_BASE-URL}"
fi

# Check base url
DRAFTS_FLAG=""
if [ "${INPUT_DRAFTS}" = true ]; then
    DRAFTS_FLAG="--drafts"
fi

# Build
eval zola --root "${INPUT_ROOT}" build "${DRAFTS_FLAG}" "${BASEURL_OPTION}" --output-dir "${INPUT_OUTPUT}"
