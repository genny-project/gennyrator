#!/bin/bash

print_usage() {
  printf "\n\nUsage: generate_infra.sh <dns-name> <infra-type>\n"
  printf "Accepted values for infra-type: dev, staging or prod"
  printf "Example: ./generate_infra.sh newproject-dev dev\n\n\n"
}

if [ "$#" -ne 2 ]; then
  printf "Wrong number of arguments passed.\n"
  print_usage
  exit 1
fi

DNS_NAME=$1
INFRA_TYPE=$2

if [ "$INFRA_TYPE" != "dev" ] && [ "$INFRA_TYPE" != "staging" ] && [ "$INFRA_TYPE" != "prod" ]; then
  print_usage
  exit 1
fi

echo "Creating infrastructure with the following details:"
echo "DNS Name: $DNS_NAME.gada.io"
echo "Infrastructure type to be generated: $INFRA_TYPE"

echo "A '$INFRA_TYPE' infrastructure generated successfully. Click to access: $DNS_NAME.gada.io"

exit 0
