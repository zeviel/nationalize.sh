#!/bin/bash

api="https://api.nationalize.io"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_nationality() {
  # 1 - name: (string): <name - required>
  curl --request GET \
    --url "$api?name=$1" \
    --user-agent "$user_agent" \
    --header "accept: application/json"
}

function get_batch_nationalities() {
  # 1 - names: (array): <names - required>
  names=$(printf ",%s" "${1[@]}")
  names=${names:1}
  curl --request GET \
    --url "$api?name[]=$names" \
    --user-agent "$user_agent" \
    --header "accept: application/json"
}
