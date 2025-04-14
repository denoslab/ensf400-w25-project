#!/bin/bash
set -e

# Configuration
DOCKER_REGISTRY="ghcr.io"  # GitHub Container Registry

# Get GitHub username manually for simplicity
REPO_OWNER="hamzaikhurram"  # Lowercase is required for Docker tags
REPO_NAME="ensf400-w25-project"  # Removed trailing dash for better formatting
IMAGE_NAME="${DOCKER_REGISTRY}/${REPO_OWNER}/${REPO_NAME}"

# Get Git metadata for tagging
BRANCH_NAME=$(git symbolic-ref --short HEAD)
COMMIT_HASH=$(git rev-parse --short HEAD)
BUILD_TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Clean branch name for Docker tag - lowercase and replace invalid chars
CLEAN_BRANCH_NAME=$(echo ${BRANCH_NAME} | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-*$//' | sed 's/^-*//')

# Set tags
TAG_BRANCH="${CLEAN_BRANCH_NAME}"
TAG_COMMIT="${COMMIT_HASH}"
TAG_TIMESTAMP="${BUILD_TIMESTAMP}"
TAG_LATEST="latest"

echo "🔨 Building Docker image..."
echo "Image: ${IMAGE_NAME}"
echo "Tags: ${TAG_BRANCH}, ${TAG_COMMIT}, ${TAG_TIMESTAMP}, ${TAG_LATEST}"

docker build -t ${IMAGE_NAME}:${TAG_BRANCH} \
             -t ${IMAGE_NAME}:${TAG_COMMIT} \
             -t ${IMAGE_NAME}:${TAG_TIMESTAMP} \
             -t ${IMAGE_NAME}:${TAG_LATEST} .

# If this is a GitHub Actions environment, authenticate and push
if [ -n "${GITHUB_TOKEN}" ]; then
    echo "🔑 Logging in to GitHub Container Registry..."
    echo ${GITHUB_TOKEN} | docker login ${DOCKER_REGISTRY} -u ${GITHUB_ACTOR} --password-stdin

    echo "📤 Pushing Docker image with tags..."
    docker push ${IMAGE_NAME}:${TAG_BRANCH}
    docker push ${IMAGE_NAME}:${TAG_COMMIT}
    docker push ${IMAGE_NAME}:${TAG_TIMESTAMP}
    docker push ${IMAGE_NAME}:${TAG_LATEST}
else
    echo "⚠️ GITHUB_TOKEN not set. Skipping container push."
    echo "👉 To push manually:"
    echo "  docker login ${DOCKER_REGISTRY}"
    echo "  docker push ${IMAGE_NAME}:${TAG_BRANCH}"
    echo "  docker push ${IMAGE_NAME}:${TAG_COMMIT}"
    echo "  docker push ${IMAGE_NAME}:${TAG_TIMESTAMP}"
    echo "  docker push ${IMAGE_NAME}:${TAG_LATEST}"
fi

echo "✅ Image built successfully!"
echo "Image: ${IMAGE_NAME}"
echo "Tags: ${TAG_BRANCH}, ${TAG_COMMIT}, ${TAG_TIMESTAMP}, ${TAG_LATEST}"