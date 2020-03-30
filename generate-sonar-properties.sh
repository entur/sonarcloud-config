#!/usr/bin/env bash
# Exit script if you try to use an uninitialized variable.
set -o nounset
set -o pipefail

cat > ./sonar-project.properties <<EOL
sonar.projectName=$(echo ${CIRCLE_PROJECT_REPONAME})
sonar.projectKey=enturas_$(echo ${CIRCLE_PROJECT_REPONAME})
sonar.organization=$(echo ${SONAR_ORG})
sonar.host.url=https://sonarcloud.io
sonar.login=$(echo ${ENTUR_SONAR_PASSWORD})
sonar.sources=.
sonar.sourceEncoding=UTF-8
sonar.branch.name=$(echo ${CIRCLE_BRANCH})
sonar.java.binaries=$(echo ${JAVA_HOME})/bin
EOL
