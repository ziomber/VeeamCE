# VeeamCE
Zabbix2 monitoring of VeeamCE. Tested on Zabbix 7.4.0 and Veeam Backup & Replication 11 Community Edition build 11.0.0.837.

## How it works
Zabbix template has one discovery rule connected via agent to veeam_discovery.ps1 script. Script lists all configured and enabled backup jobs.
Discovery rule takes all backup jobs and using item template and trigger template creates items as a backup job status [veeam job name]. Job status is taken via agent from veeam_job_status.ps1 script.
I'm interesting in only 3 statuses:
* Success = 0
* Warning = 1
* Failed = 2
Discovery rule create also one trigger for failed jobs as a High importance.

## Step 1
Copy .ps1 files to c:\Zabbix directory
If you choose to move them to different location just adjust the path in next step.

## Step2
Configure you zabbix2 agent. Just add content of file zabbix_agentd.conf at the end of configuration file of the zabbix2 agent.
In typical installations it will be c:\program files\zabbix agent 2\zabbix_agent2.conf. 
If you have user parameters in separate file or like to using zabbix_dagent2.d directory configuration just adjust it.
You car restart zabbix agent service at the end to be sure, that config is reloaded.

## Step3
Import template from file zbx_veeam_ce_template.yaml into the zabbix and adjust parameters (timings, timeouts, etc.).
Assign the template to Veeam Backup host.
And it should be done.
