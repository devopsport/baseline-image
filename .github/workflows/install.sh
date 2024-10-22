#!/bin/bash

ecrStatus=$(aws ecr describe-repositories --region "${AWS_DEFAULT_REGION}" | jq -r .repositories[].repositoryName | grep "${REPOSITORY_NAME}" | wc -l)

# creando repositorio
if [ "${ecrStatus}" = "0" ]
then
    aws ecr create-repository --repository-name "${REPOSITORY_NAME}" --region "${AWS_DEFAULT_REGION}" --image-scanning-configuration scanOnPush=true --image-tag-mutability IMMUTABLE --encryption-configuration encryptionType=AES256
else
    echo "No es necesario crear repositorio"    
fi
