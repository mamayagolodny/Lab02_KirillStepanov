#!/bin/bash

to_bin() {
    IFS='.' read -r -a octets <<< "$1"
    bin=""
    for octet in "${octets[@]}"; do
        bin+="$(printf "%08d" $(echo "obase=2;$octet" | bc))."
    done
    echo "${bin%?}"
}

ipv4_ad=$1
bin_ad=$(to_bin "$ipv4_ad")
echo "$bin_ad"
