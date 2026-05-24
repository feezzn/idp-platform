#!/bin/bash

set -euo pipefail

# MongoDB Setup Script - Popula coleções iniciais

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEED_FILE="$SCRIPT_DIR/setup-mongodb.js"
MONGO_URI="${MONGO_URI:-mongodb://idp-user:idp-password@localhost:27017/idp-catalog}"
MONGO_URI_IN_CLUSTER="${MONGO_URI_IN_CLUSTER:-mongodb://idp-user:idp-password@localhost:27017/idp-catalog}"

echo "Seeding MongoDB catalog..."
echo ""

if command -v mongosh >/dev/null 2>&1; then
  echo "Using local mongosh: $MONGO_URI"
  mongosh --quiet "$MONGO_URI" "$SEED_FILE"
elif command -v kubectl >/dev/null 2>&1 && kubectl get deploy mongodb -n mongodb >/dev/null 2>&1; then
  echo "Local mongosh not found. Using mongosh inside the mongodb pod."
  POD_NAME="$(kubectl get pod -n mongodb -l app.kubernetes.io/name=mongodb -o jsonpath='{.items[0].metadata.name}')"
  kubectl cp -n mongodb "$SEED_FILE" "$POD_NAME:/tmp/setup-mongodb.js" -c mongodb
  kubectl exec -n mongodb "$POD_NAME" -c mongodb -- mongosh --quiet "$MONGO_URI_IN_CLUSTER" /tmp/setup-mongodb.js
else
  echo "Could not find local mongosh or a mongodb deployment in Kubernetes." >&2
  echo "Install mongosh or run: helm install mongodb bitnami/mongodb --namespace mongodb --create-namespace -f terraform/2-mongodb/values.yaml" >&2
  exit 1
fi

echo ""
echo "Setup complete!"
