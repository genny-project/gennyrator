#!/bin/bash

print_usage() {
  printf "\n\nUsage: ./generate_github_repo.sh <github-template-name> <template-organization-name> <repository-name-to-be-created> <repository-organization-name> <repo-type>\n"
  printf "Accepted values for repo-type: public, private or internal\n\n"
  printf "Example: ./generate_github_repo.sh genny-project genny-project-template prj_newproject OutcomeLife private\n\n\n"
}

if [ "$#" -ne 5 ]; then
  printf "Wrong number of arguments passed.\n"
  print_usage
  exit 1
fi

TEMPLATE_ORG_NAME=$1
TEMPLATE_NAME=$2
REPO_ORG_NAME=$3
REPO_NAME=$4
REPO_TYPE=$5

printf "Creating Github repository with the following details:\n"
printf "Repository Template Used: $TEMPLATE_ORG_NAME/$TEMPLATE_NAME\n"
printf "Repository to be generated: $REPO_ORG_NAME/$REPO_NAME\n"
printf "Repository type: $REPO_TYPE\n"
gh repo create $REPO_ORG_NAME/$REPO_NAME --template $TEMPLATE_ORG_NAME/$TEMPLATE_NAME -y --$REPO_TYPE

printf "Repository generated successfully: $REPO_ORG_NAME/$REPO_NAME\n"

exit 0
