#!/bin/sh
echo -ne '\033c\033]0;Genre-etude-bullet-hell\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/GEBHell.x86_64" "$@"
