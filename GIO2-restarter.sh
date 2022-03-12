#!/bin/bash

shopt -s extglob
# RestAPI URL & Credential
post_data=$(cat < <EOF {"password": "$PASS","username": "$USER"})

## Values modified in this script
header0="application/vnd.vmware.vcloud.session+xml;version=30.0"
header1="bS5naGlmZmFyaUBBRjAwasdasdzxczxc==" #Base64-encoded-user@tenant:pass
header2="application/*+xml;version=30.0"
header3="application/json"

### Build our JSON payload and send it as a POST request to RestAPI
while IFS=': ' read key value; do
value=${value##+([[:space:]])}; value=${value%%+([[:space:]])}
   case "$key" in
      X-VMWARE-VCLOUD-ACCESS-TOKEN) a="$value"
      ;;
      x-vcloud-authorization) b="$value"
      ;;
   esac
done < <(curl -IsS -H "Authorization: Basic "$header1 -H "Accept: "$header2 -H "Content-Type: "$header3 https://vcloud.biznetgiocloud.com/api/sessions | grep -E '(X-VMWARE-VCLOUD-ACCESS|x-vcloud)')
DISABLE=$(curl -sS -H "Authorization: Bearer $a" -H "Accept: "$header2 https://vcloud.biznetgiocloud.com/network/edges/$VID/ipsec/config | xmlstarlet edit -L -u "/ipsec/sites/site[name='tunnel-name']/enabled" -v 'false')
sleep 5
curl -sS -H "Authorization: Bearer $a" -H "Accept: "$header2 -H "Content-Type: "$header3 -X PUT https://vcloud.biznetgiocloud.com/network/edges/$VID/ipsec/config -d '${DISABLE}'
sleep 5
ENABLE=$(curl -sS -H "Authorization: Bearer $a" -H "Accept: "$header2 https://vcloud.biznetgiocloud.com/network/edges/$VID/ipsec/config | xmlstarlet edit -L -u "/ipsec/sites/site[name='tunnel-name']/enabled" -v 'true')
sleep 5
curl -sS -H "Authorization: Bearer $a" -H "Accept: "$header2 -H "Content-Type: "$header3 -X PUT https://vcloud.biznetgiocloud.com/network/edges/$VID/ipsec/config -d '${ENABLE}'
