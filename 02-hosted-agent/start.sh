#!/bin/bash
set -e

# URL y Token del servidor de Azure DevOps, se deben proporcionar como variables de entorno
if [ -z "$AZP_URL" ]; then
  echo 1>&2 "error: missing AZP_URL environment variable"
  exit 1
fi

if [ -z "$AZP_TOKEN" ]; then
  echo 1>&2 "error: missing AZP_TOKEN environment variable"
  exit 1
fi

if [ -z "$AZP_AGENT_NAME" ]; then
  AZP_AGENT_NAME=$(hostname)
fi

cleanup() {
  if [ -e config.sh ]; then
    ./svc.sh stop
    ./config.sh remove --unattended --auth pat --token "$AZP_TOKEN"
  fi
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./config.sh --unattended \
  --agent "$AZP_AGENT_NAME" \
  --url "$AZP_URL" \
  --auth pat \
  --token "$AZP_TOKEN" \
  --pool "$AZP_POOL" \
  --work "_work" \
  --replace

./svc.sh install
./svc.sh start

wait $!