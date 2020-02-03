#!/bin/bash
curl http://yoko.ukrtux.com:8899/versions.txt --output versions.txt
cat versions.txt | sort -V > result.txt

