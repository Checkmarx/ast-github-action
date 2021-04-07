#!/bin/sh
printenv
/app/bin/cx scan create -v --project-type ${PROJECT_TYPE} --project-name ${PROJECT_NAME} -d "." --filter ${FILTER} --format json
/app/bin/cx version
#ls -la /tmp/
#cp /tmp/*.zip ./cx.zip
#chmod 777 ./cx.zip
pwd
find .