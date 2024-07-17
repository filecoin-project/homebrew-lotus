#! /usr/bin/env bash
set -e
set -o pipefail
set -o nounset
set -o errexit

REPO="filecoin-project/lotus"
RELEASES_TAGS=$(curl -s "https://api.github.com/repos/${REPO}/releases" | jq -r '.[] | select(.prerelease == false) | .tag_name')

get_latest_release() {
    local TAG_PREFIX=$1
    local RELEASES_TAGS_WITH_PREFIX=$(echo "$RELEASES_TAGS" | grep "${TAG_PREFIX}")

    if [ -z "$RELEASES_TAGS_WITH_PREFIX" ]; then
        exit 1
    fi

    local LATEST_RELEASE=$(echo "$RELEASES_TAGS_WITH_PREFIX" | sort -V | tail -n 1)
    if [ -z "$LATEST_RELEASE" ]; then
        exit 1
    fi

    echo "${LATEST_RELEASE}"
}

node_tag=$(get_latest_release "v")
node_version=${node_tag#"v"}

miner_tag=$(get_latest_release "miner/v")
miner_version=${miner_tag#"miner/v"}

# Node URLS
node_macos_url="https://github.com/${REPO}/releases/download/${node_tag}/lotus_${node_tag}_darwin_all.tar.gz"
node_macos_sha_url="https://github.com/${REPO}/releases/download/${node_tag}/lotus_${node_tag}_darwin_all.tar.gz.sha512"
node_linux_intel_url="https://github.com/${REPO}/releases/download/${node_tag}/lotus_${node_tag}_linux_amd64_v1.tar.gz"
node_linux_intel_sha_url="https://github.com/${REPO}/releases/download/${node_tag}/lotus_${node_tag}_linux_amd64_v1.tar.gz.sha512"

# Miner URLS
miner_macos_url="https://github.com/${REPO}/releases/download/${miner_tag}/lotus-miner_v${miner_version}_darwin_all.tar.gz"
miner_macos_sha_url="https://github.com/${REPO}/releases/download/${miner_tag}/lotus-miner_v${miner_version}_darwin_all.tar.gz.sha512"
miner_linux_intel_url="https://github.com/${REPO}/releases/download/${miner_tag}/lotus-miner_v${miner_version}_linux_amd64_v1.tar.gz"
miner_linux_intel_sha_url="https://github.com/${REPO}/releases/download/${miner_tag}/lotus-miner_v${miner_version}_linux_amd64_v1.tar.gz.sha512"

# Download the SHA files and extract the hashes
node_macos_sha=$(curl -sL $node_macos_sha_url | awk '{print $1}')
node_linux_intel_sha=$(curl -sL $node_linux_intel_sha_url | awk '{print $1}')
miner_macos_sha=$(curl -sL $miner_macos_sha_url | awk '{print $1}')
miner_linux_intel_sha=$(curl -sL $miner_linux_intel_sha_url | awk '{print $1}')

# Homebrew support sha256 only.
# So download the files in /tmp/ check their sha512 (for safety) then compute their sha256
get_release_sha256() {
    local URL=$1
    local SHA=$2
    local FILENAME=$(basename $URL)
    local TMP_FILE="/tmp/${FILENAME}"
    curl -sL $URL -o $TMP_FILE
    local SHA512=$(shasum -a 512 $TMP_FILE | awk '{print $1}')
    if [ "$SHA" != "$SHA512" ]; then
        echo "SHA512 mismatch for $URL"
        exit 1
    fi
    local SHA256=$(shasum -a 256 $TMP_FILE | awk '{print $1}')
    echo $SHA256
}

node_macos_sha256=$(get_release_sha256 $node_macos_url $node_macos_sha)
node_linux_intel_sha256=$(get_release_sha256 $node_linux_intel_url $node_linux_intel_sha)
miner_macos_sha256=$(get_release_sha256 $miner_macos_url $miner_macos_sha)
miner_linux_intel_sha256=$(get_release_sha256 $miner_linux_intel_url $miner_linux_intel_sha)

# Prepare environment variables for envsubst
export NODE_VERSION=$node_version
export NODE_MACOS_URL=$node_macos_url
export NODE_MACOS_SHA=$node_macos_sha256
export NODE_LINUX_INTEL_URL=$node_linux_intel_url
export NODE_LINUX_INTEL_SHA=$node_linux_intel_sha256

export MINER_VERSION=$miner_version
export MINER_MACOS_URL=$miner_macos_url
export MINER_MACOS_SHA=$miner_macos_sha256
export MINER_LINUX_INTEL_URL=$miner_linux_intel_url
export MINER_LINUX_INTEL_SHA=$miner_linux_intel_sha256

export HEADER="# This file was generated - DO NOT EDIT"
mkdir -p Formula

envsubst < Templates/lotus-node.rb > Formula/lotus-node.rb
envsubst < Templates/lotus-miner.rb > Formula/lotus-miner.rb
envsubst < Templates/lotus.rb > Formula/lotus.rb

echo "Generated Homebrew formulas for the latest release (node=${node_tag}, miner=${miner_tag})"
