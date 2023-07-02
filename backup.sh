#!/usr/bin/env bash

source /Users/nik/.env_vars.sh && /usr/local/bin/restic -r b2:bak-dotnik backup /Users/nik/Nik
