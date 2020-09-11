#! /bin/bash

catpoint="https://http.cat"
catcodes=("100" "101" "200" "201" "202" "204" "206" "207" "300" "301" "302" "303" "304" "305" "307" "400" "401" "402" "403" "404" "405" "406" "408" "409" "410" "411" "412" "413" "414" "415" "416" "417" "418" "420" "421" "422" "423" "424" "425" "426" "429" "431" "444" "450" "451" "499" "500" "501" "502" "503" "504" "506" "507" "508" "509" "510" "511" "599")
target_dirs="./*/"
catnum=${#catcodes[@]}
echo $catnum

for dir in $target_dirs
do
    catid=${catcodes[RANDOM%${catnum}]}
    curl --fail --silent --show-error "${catpoint}/${catid}" --create-dirs -o "${dir}/cat/${catid}.jpg"
    if [ $? -eq 0 ]; then
        echo "OK: ${dir}/cat/${catid}.jpg"
    fi
done
