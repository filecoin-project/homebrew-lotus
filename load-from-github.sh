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

export NODE_VERSION=$node_version
export NODE_MACOS_URL=$node_macos_url
export NODE_MACOS_SHA=$node_macos_sha
export NODE_LINUX_INTEL_URL=$node_linux_intel_url
export NODE_LINUX_INTEL_SHA=$node_linux_intel_sha

export MINER_VERSION=$miner_version
export MINER_MACOS_URL=$miner_macos_url
export MINER_MACOS_SHA=$miner_macos_sha
export MINER_LINUX_INTEL_URL=$miner_linux_intel_url
export MINER_LINUX_INTEL_SHA=$miner_linux_intel_sha

export HEADER="This file was generated - DO NOT EDIT"
mkdir -p Formula

envsubst < Templates/lotus-node.rb > Formula/lotus-node.rb
envsubst < Templates/lotus-miner.rb > Formula/lotus-miner.rb
envsubst < Templates/lotus.rb > Formula/lotus.rb

echo "Generated Homebrew formulas for the latest release (node=${node_tag}, miner=${miner_tag})"
