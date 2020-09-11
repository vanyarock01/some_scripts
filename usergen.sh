#!/bin/bash

usernames=(
    "user1"
    "user2"
    "user3"
)

for USER in "${usernames[@]}"
do
    PASS=$(< /dev/urandom tr -dc 0-9 | head -c6)
    useradd -p $(openssl passwd -crypt $PASS) -m -s /bin/bash $USER
    echo -e "$USER\t$PASS" >> user.csv
done
