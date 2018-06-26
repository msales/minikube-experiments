#!/bin/bash

[ -z "$1" ] && exit 1

app_dir=${1}
action=${2:-create}

IFS="
"
files=$(ls -1 "$app_dir")
(cd "$app_dir"
for f in $(echo "$files" | grep 'service'); do
  ls -la "$f"
  kubectl $action -f "$f"
done

for f in $(echo "$files" | grep -e 'app' -e 'deployment'); do
  ls -la "$f"
  kubectl $action -f "$f"
done
)

