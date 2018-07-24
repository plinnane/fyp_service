#!/bin/bash
#------------------------------------------------------------------------------------- 
#Author:Patrick Linnane
#Company:XenCloudTech #email.patrick.linnane@xencloudtech.com
#_____________________________________________________________________________________
cd /repos/github/$USER/FYP-Project
old_val1='${WILDFLY_HOME}'
new_val1=/opt/wildfly-10.1.0.Final
old_val2='${eclipse_home}/dart-sdk'
new_val2=/opt/dart-sdk
sed -i s#${old_val1}#${new_val1}#g App_Deploy.launch
sed -i s#${old_val1}#${new_val1}#g DyWA_Clean.launch
sed -i s#${old_val1}#${new_val1}#g DyWA_Start.launch
sed -i s#${old_val1}#${new_val1}#g DyWA_Stop.launch
sed -i s#${old_val1}#${new_val1}#g GUI_Deploy.launch
sed -i s#${old_val2}#${new_val2}#g App_Deploy.launch
sed -i s#${old_val2}#${new_val2}#g GUI_Deploy.launch
cd /repos/github/$USER/FYP-Project
