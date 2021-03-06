#!/bin/bash

#*****************************************************************************
#*                                                                           *
#* Copyright FUJITSU LIMITED 2021                                            *
#*                                                                           *
#*****************************************************************************

# This script defines operations for handling request/response

response_file="output/response.json"

request_api(){
  if [ -z $3 ]; then
    headers=()
  else
    headers=(
      -H "Authorization: Bearer $3"
      -H "Content-Type: application/json"
    )
  fi

  curl -s -o $response_file -w "%{http_code}" -d "$2" "${headers[@]}" -X POST $1
}

request_api_get(){
  if [ -z $2 ]; then
    headers=()
  else
    headers=(
      -H "Authorization: Bearer $2"
      -H "Content-Type: application/json"
    )
  fi

  curl -s -o $response_file -w "%{http_code}" "${headers[@]}" -X GET $1
}

handle_response(){
  if [[ $1 != 2* ]]; then
    error=$(cat $response_file | jq -r ".error.message")
    echo -e "${Red}\n$1: Request failed with error: $error\nPlease check output/response.json for more details."
    return $1
  else
    echo "$1: Request successful" >> output/output.logs
  fi
}

handle_auth_response(){
  if [[ $1 != 2* ]]; then
    error=$(cat $response_file | jq -r ".error")
    echo -e "${Red}\n$1: Request failed with error: $error, please check output/response.json for more details.\n"
    return $1
  else
    echo "$1: Request successful" >> output/output.logs
  fi
}

get_from_response(){
  cat $response_file | jq -r ".$1"
}
