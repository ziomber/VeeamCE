# VeeamCE
Zabbix2 monitoring of VeeamCE. Tested on Zabbix 7.4.0 and Veeam Backup & Replication 11 Community Edition build 11.0.0.837.

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
