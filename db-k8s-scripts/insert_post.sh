#!/bin/bash
set -e

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
kubectl exec -it deployment/postgres-deployment -- psql -U postgres < ${__dir}/../db-scripts/insert_post.sql
