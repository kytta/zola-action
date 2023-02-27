#!/bin/bash

set -euxo pipefail

# Check base url
BASEURL_OPTION=""
if [ "${INPUT_BASE-URL}" != "<NOTSET>" ]; then
    BASEURL_OPTION="--base-url ${INPUT_BASE-URL}"
fi

# Check base url
DRAFTS_OPTION=""
if [ "${INPUT_DRAFTS}" = true ]; then
    DRAFTS_OPTION="--drafts"
fi

# Build
eval zola --root "${INPUT_ROOT}" --config "${INPUT_CONFIG}" build "${BASEURL_OPTION}" --output-dir "${INPUT_OUTPUT-DIR}" "${DRAFTS_OPTION}"
