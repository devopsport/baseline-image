#!/bin/bash

aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query Account --output text).dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
docker build -t $(aws sts get-caller-identity --query Account --output text).dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${REPOSITORY_NAME}:${GIT_TAG} .
docker push $(aws sts get-caller-identity --query Account --output text).dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${REPOSITORY_NAME}:${GIT_TAG}
