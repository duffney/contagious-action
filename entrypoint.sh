#!/bin/sh -l

set -ex;

registry=$1
next_patch_version=$2

if $next_patch_version == "true"; then
    images=$(contagious list "$registry" -n -o json)
else
    images=$(contagious list "$registry" -o json)
fi

escaped_images=$(echo "$images" | jq -c -r @json)

echo "images=$escaped_images" >> $GITHUB_OUTPUT
# echo "images=$images" >> $GITHUB_OUTPUT
