#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex \
    --regex '\s+image: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/jxl:(.*)' \
    --version ${VERSION} \
    --files "jenkins-x-*.yml" \
    --repo https://github.com/rajattyagipvr/jenkins-x-versions.git

jx step create pr regex \
    --regex 'version: (.*)' \
    --version ${VERSION} \
    --files docker/702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/jxl.yml \
    --files packages/jxl.yml \
#    --files charts/jx-labs/jxl-boot.yml \
    --files charts/jxrajat/jxl-boot.yml \
    --repo https://github.com/rajattyagipvr/jenkins-x-versions.git

jx step create pr regex \
    --regex 'JX_DEFAULT_IMAGE: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/jxl:(.*)' \
    --version ${VERSION} \
    --files apps/jenkins-x/lighthouse/values.yaml.gotmpl \
    --repo https://github.com/rajattyagipvr/jenkins-x-versions.git
