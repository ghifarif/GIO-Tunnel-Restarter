This script automatically resets IPSec/SSL tunnel between environments in GIO (& VCO) cloud.
Combine with orchestration such as Jenkins/Azure DevOps/AWS Pipeline (Zabbix in my case) to fetch DOWN verdict as trigger for execution.
![image](https://user-images.githubusercontent.com/101460772/158055371-2794a4b7-0aed-4c1a-8529-3ea977593bdd.png)
Can be used literally/conceptually for similiar use case to other cloud VPN tunnel where tunnel uptime is mission-critical or other IaaC case.

Refference used/related in this repo:
- [GIO1 API](http://docs.cloudstack.apache.org/projects/archived-cloudstack-getting-started/en/latest/dev.html)
- [GIO2 API](https://vdc-download.vmware.com/vmwb-repository/dcr-public/eb72431f-9e96-4afe-9e64-bc5616595949/9f2ff04e-d2ec-4dbf-8142-2d48c53b6091/vcloud_nsx_api_guide_33_0.pdf)
- [VCO3 API](https://developer.vmware.com/apis/1037/velocloud-sdwan-vco-api)
