#!/bin/bash

backup_storage_output=$(kubectl get backupstorage -n everest-system)
backup_storage_names=($(echo "$backup_storage_output" | awk 'NR>1 {print $1}'))

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
  storage=$(kubectl get backupstorage "$name" -n everest-system -o json)

  bucket=$(echo "$storage" | jq -r '.spec.bucket')
  endpointURL=$(echo "$storage" | jq -r '.spec.endpointURL')
  region=$(echo "$storage" | jq -r '.spec.region')

  key="$bucket$endpointURL$region"
  storage_name=$(echo "$storage" | jq -r '.metadata.name')
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
