#!/usr/bin/env bash
docker-compose build || true
docker-compose push || true
docker stack deploy --compose-file docker-compose.yml mqtt
