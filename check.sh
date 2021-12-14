#!/bin/bash
find / -type f -name "*log4j-core-2*" -exec md5sum {} \; >  l4j.txt
sed -i 's/ /,/g' l4j.txt

while read p; do
  md5=$(echo "$p" | awk '{print $1}' | sed 's/ //g')
  for i in $(cat l4j.txt)
  do
        if [[ $i =~ $md5 ]]
        then
                echo $md5 , $i | sed 's/,,/,/g' 
        fi
  done
done < md5sum.txt
