#! /bin/sh
set -u

source .pythonpath

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
  exit 1
fi

if [ ! -d "$(pwd)/examples/$@" ]; then
  echo "Path does not exist: $(pwd)/examples/$@"
  exit 1
fi

export ELASTICSEARCH_INDEX=$@

export ELASTICSEARCH_URL=http://localhost:9200

cd ./demo

adev runserver -p 8000 server.py
