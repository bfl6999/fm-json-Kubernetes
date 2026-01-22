#!/bin/bash

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "ERROR: You must provide a Kubernetes version (e.g. v1.30.2)"
  exit 1
fi

echo "📥 Downloading _definitions.json for version $VERSION..."

OUT_DIR="../../resources/ci_k8s_schemas/kubernetes-json-$VERSION"
#OUT_DIR="resources/ci_k8s_schemas/kubernetes-json-$VERSION"
mkdir -p "$OUT_DIR"

URL="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/$VERSION/_definitions.json"

curl -sSfL "$URL" -o "$OUT_DIR/_definitions.json"

if [ $? -ne 0 ]; then
  echo "Failed to download the schema. Check that the version exists in the repo."
  exit 1
fi

echo "File saved to $OUT_DIR/_definitions.json"