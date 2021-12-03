#!/bin/bash

print_usage() {
  printf "\n\nUsage: ./generate.sh <github-template-name> <template-organization-name> <repository-name-to-be-created> <repository-organization-name> <repo-type> <dns-name> <infra-type>\n"
  printf "Accepted values for repo-type: public, private or internal\n"
  printf "Accepted values for infra-type: dev, staging or prod"
  printf "Example: ./generate.sh genny-project genny-project-template prj_newproject OutcomeLife private newproject-dev dev\n\n\n"
}

if [ "$#" -ne 7 ]; then
  printf "Wrong number of arguments passed.\n"
  print_usage
  exit 1
fi

TEMPLATE_ORG_NAME=$1
TEMPLATE_NAME=$2
REPO_ORG_NAME=$3
REPO_NAME=$4
REPO_TYPE=$5
DNS_NAME=$6
INFRA_TYPE=$7

if [ "$REPO_TYPE" != "public" ] && [ "$REPO_TYPE" != "private" ] && [ "$REPO_TYPE" != "internal" ]; then
  print_usage
  exit 1
fi

if [ "$INFRA_TYPE" != "dev" ] && [ "$INFRA_TYPE" != "staging" ] && [ "$INFRA_TYPE" != "prod" ]; then
  print_usage
  exit 1
fi

function generate_github_repo() {
  if github/generate_github_repo.sh $TEMPLATE_ORG_NAME $TEMPLATE_NAME $REPO_ORG_NAME $REPO_NAME $REPO_TYPE; then
    return 0
  else
    return 1
  fi
}

function generate_infra() {
  if infra/generate_infra.sh $DNS_NAME $INFRA_TYPE; then
    return 0
  else
    return 1
  fi
}

echo "Generating Github repository..."
if ! generate_github_repo $ORG_NAME $TEMPLATE_NAME $REPO_NAME $REPO_TYPE; then
  echo "Github repository generation failed. Exiting."
  exit 1
fi
echo "Github repository created successfully."
echo "Creating infrastructure..."
if ! generate_infra $ORG_NAME $TEMPLATE_NAME $REPO_NAME $REPO_TYPE; then
  echo "Infrastructure creation failed. Exiting."
  exit 1
fi
echo "Infrastructure created successfully."
echo "Successfully completed."
exit 0
