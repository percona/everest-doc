#!/usr/bin/env bash

set -e

backup_storage_names=($(kubectl get backupstorage -n everest-system --no-headers -o=jsonpath='{.items[*].metadata.name}'))

if ! command -v kubectl &> /dev/null; then
  echo "Error: kubectl is not installed. Please install it first."
  exit 1
fi

get_value() {
  local map="$1"
  local key="$2"
  local value=$(echo "$map"| grep "$key" | cut -d"=" -f2)
  echo $value
}

echo "Backup storages which share the same bucket, region, endpointURL:"
found=0
buckets=""

for name in "${backup_storage_names[@]}"; do
  storage_info=$(kubectl get backupstorage "$name" -n everest-system -o go-template='{{printf "%s %s %s %s" .metadata.name .spec.bucket .spec.endpointURL .spec.region}}')
  storage_name=$(echo "$storage_info" | awk '{print $1}')
  bucket=$(echo "$storage_info" | awk '{print $2}')
  endpointURL=$(echo "$storage_info" | awk '{print $3}')
  region=$(echo "$storage_info" | awk '{print $4}')

  key="$bucket$endpointURL$region"
  existing_value=$(get_value "$buckets" "$key")

  if [[ ${#existing_value} -gt 0  ]]; then
    found=1
    echo "- $existing_value and $storage_name"
  else
    buckets+="$key=$storage_name\n"
  fi
done

if [[ ${found} -eq 0  ]]; then
  echo "not found"
fi
