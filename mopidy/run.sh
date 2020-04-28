#!/bin/bash
#this is mine
set -e

#mods so mopidy will accept requests from HA tts

certfile=$(cat /data/options.json | jq -r '.certfile')
if [ -f /ssl/"$certfile" ]; then
   cp /ssl/$certfile /usr/local/share/ca-certificates/$certfile.crt
   update-ca-certificates -v
fi

local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

if  [ "$local_scan" == "true" ]; then
    mopidy --config $config $options local scan
fi

mopidy --config $config $options
