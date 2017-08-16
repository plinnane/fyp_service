#!/bin/bash

appWAR="${1}/target/dywa-app/app-presentation/target/app.war"
dywaData="${HOME}/opt/wildfly-10.1.0.Final/standalone/data/"
targetSystem="dennis@ls5vs005.cs.tu-dortmund.de:opt"

if [ "x${1}" == "x" ] || [ "${1}" == "help" ] ; then
   echo "Use this script as follows:"
   echo "   ${0} [projectPath] [targetSystem]"
   echo "   projectPath  - specify the project that holds the generated target/dywa-app/app-presentation/target/app.war file"
   echo "   targetSystem - (optional) the remote wildfly location. Default: ${targetSystem}"
   exit 0
else
   if [ "x${2}" == "x" ]; then
      echo "Using LS5 test machine account: ${targetSystem}"
   else
      echo "Using specified target system: ${2}"
      targetSystem=${2}
   fi
   if [ -f ${appWAR} ]; then
      if [ -d ${dywaData} ]; then
         echo "Deploying ${appWAR} to ${targetSystem} ..."
         scp ${appWAR} ${targetSystem}/wildfly-10.1.0.Final/standalone/deployments/
         echo "Overwriting DyWA data on ${targetSystem} ..."
         scp ${dywaData}/*dywa* ${targetSystem}/wildfly-10.1.0.Final/standalone/data/
         echo "... done!"
      else
         echo "DyWA data cannot be read from expected location: ${dywaData}"
         exit 0
      fi
   else
      echo "No app.war found in expected location: ${appWAR}"
      exit 0
   fi
fi
