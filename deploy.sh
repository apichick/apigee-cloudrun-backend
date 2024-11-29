#!/bin/bash 
 
if [ $# -lt 4 ]; then
  echo "Usage: $0 PROJECT_ID REGION RELEASE_NAME COMMIT_SHA"
  exit 1
fi 

PROJECT_ID=$1
REGION=$2
RELEASE_NAME=$3
COMMIT_SHA=$4

gcloud deploy releases create ${RELEASE_NAME} \
--project=${PROJECT_ID} \
--region=${REGION} \
--delivery-pipeline=pipeline \
--images=app=${REGION}-docker.pkg.dev/${PROJECT_ID}/registry/app@${COMMIT_SHA},collector=${REGION}-docker.pkg.dev/${PROJECT_ID}/registry/collector@${COMMIT_SHA}
