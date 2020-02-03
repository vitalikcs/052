#!/bin/bash
verfile="versions.txt"
if [ -e $verfile ]
then
sort -V $verfile | uniq -c | sort -r -k1 -n | head -n 1
else
curl http://yoko.ukrtux.com:8899/versions.txt --output $verfile
sort -V $verfile | uniq -c | sort -r -k1 -n | head -n 1
fi
