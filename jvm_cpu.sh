#!/bin/bash
IID=$1
if [ "${1}" = "" ];then
        echo "Instance should not be empty" ;
        echo "Please check the instance name and try again";
        exit 99 ;
fi

#Check if the instance is already running

echo "Checking if the instance is running..."

CATALINA_PID=`ps -aef| grep -w ${IID} | grep -w [j]ava | awk '{print \$2}'`

if [ "$?" != "0" ]; then
        echo "ps Command failed."
        exit 99
elif [ ${CATALINA_PID} ];then
        echo "PID available to proceed further"

             echo "JBOSS: ${IID} instance already running with the process ID: "${CATALINA_PID}"."

        cpu_usage=$(top -b -n 1 |grep "${CATALINA_PID}" | grep -v grep | awk '{print $9}'| cut -d. -f1)

echo "${IID}_`hostname | cut -d"-" -f2`_cpu_usage ${cpu_usage}"  


else
         echo "No process is running for the instance. ${IID}, please check the instance exists or running in the $(hostname)"
        exit 99
fi
