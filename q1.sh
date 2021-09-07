#1 /usr/bin/bash

du -h -d1 | awk '{print substr($2,3) "\t" $1}' |  head -n -1 


