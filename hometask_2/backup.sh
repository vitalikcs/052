#!/bin/bash
find $1 -type f -mtime -1 -ls | awk '{ print $11 }'| sed 's/'$1'//g' > filelist.txt
rsync -av --files-from=filelist.txt $1/ $2/`date +\%Y\%m\%d`


