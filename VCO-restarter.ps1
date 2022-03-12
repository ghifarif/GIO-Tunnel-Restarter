# RestAPI URL & Credential
$raw='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.asdasdasdasdzxczxczxczxczxczxc'

## Values modified in this script
$header1="application/json"

### Build our JSON payload and send it as a POST request to RestAPI
VCOv3 = @{uri = 'https://vco150-usca1.velocloud.net/$TENANT/portal/rest/enterprise/resetNonVelocloudTunnel';
           Method = 'POST';Headers = @{Authorization = 'Token ' + $raw; Accept = $header1}}
Invoke-restmethod #@VCOv3
