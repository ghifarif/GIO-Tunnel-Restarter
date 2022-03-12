#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib
import hashlib
import hmac
import base64
import json
import requests

# RestAPI URL & Credential
secretkey='bNCPDJwfKXhdr2QA9Nyl-wZsR7KzyaCJ7-peUbqL4IVIxIasdasdasdasd'
apikey='21AwLeLIpL7puyMUif77aGxlXKd15z5Y83E8o-zxczxczxczxczxczxc'

## Values modified in this script:
request={"apikey": apikey,
"command": "resetVpnConnections",
"tunnel": "tunnel-name",
"response": "json"}

### Build our JSON payload and send it as a POST request to RestAPI
command='&'.join(['='.join([k,urllib.quote_plus(request[k])]) for k in request.keys()])
signature='&'.join(['='.join([k.lower(),urllib.quote_plus(request[k].lower().replace('+','%20'))])for k in sorted(request.iterkeys())])
sigenc=urllib.quote_plus(base64.encodestring(hmac.new(secretkey,signature,hashlib.sha1).digest()).strip())
giov1='https://cloud.biznetgiocloud.com/portal/client/apis/cloudapi?'+command+'&signature='+sigenc
print requests.post(giov1).text
