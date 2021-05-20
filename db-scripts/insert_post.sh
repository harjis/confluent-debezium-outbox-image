#!/bin/bash
set -e

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker-compose exec -T postgres psql -U postgres < ${__dir}/insert_post.sql
