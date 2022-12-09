#!/bin/bash
SECRET_LOC="${HOME}/location/of/secret"
SSL_PASS="YOUR_DECRYPT_PSWD"

TOKEN=`cat ${SECRET_LOC} | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 \
-salt -pass pass:${SSL_PASS} | base64`

curl -s --header "Authorization: Basic ${TOKEN}"  https://wakatime.com/api/v1/users/current/status_bar/today  | jq -r '.data.grand_total.text';

TOKEN="$(echo '0ce7d1ce-2b18-4fe3-934c-aa8977475c10' | base64)"

curl -s --header "Authorization: Basic ${TOKEN}"  https://wakatime.com/api/v1/users/current/status_bar/today  | jq -r '.data.grand_total.text'