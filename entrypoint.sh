#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /matsuken_quiz/tmp/pids/server.pid

# 曲のプレビューURLをキャッシュする
echo "Caching song preview URLs..."
bundle exec rake precache:cache_songs

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
