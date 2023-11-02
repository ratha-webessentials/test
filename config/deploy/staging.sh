#!/bin/bash

FILE_NAME=$(basename "$0")
STAGE="${FILE_NAME%.*}"

ansible-playbook config/ansible/playbook.yml -vv \
    -t deploy \
    -l ${STAGE} \
    -e stage=${STAGE} \
    -e version=${SHORT_SHA} \
    --vault-pass-file /root/ansible-vault