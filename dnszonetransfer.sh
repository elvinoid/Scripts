#!/bin/bash

# Zone transfer Script

if [ -z "$1" ]; then
  echo "[*] Simple zone transfer script by m1n1"
  echo "[*] Usage: $0 <domain name>"
  exit 0
fi

# if argument was given, identify the dns servers

for i in $(host -t ns $1 | cut -d " " -f4); do
  #For each server attemt zone transfer
 host -l $1 $i | grep "has address"
done
