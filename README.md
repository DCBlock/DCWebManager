## 개발 환경
-   Spring Boot
-   JDK 1.8

## start_webmanager
JAVA_HOME=/usr/bin
APP_PATH=/opt/webadmin/DCWebManager-0.0.1-SNAPSHOT.jar
CONFIG_PATH=/opt/webadmin/application.properties

nohup $JAVA_HOME/java -javaagent:$AGENT_PATH/pinpoint-bootstrap-1.8.1.jar -Dpinpoint.agentId=1 -Dpinpoint.applicationName=DCCAFEWEBMANAGER -jar $APP_PATH --spring.config.location=$CONFIG_PATH 1>/var/log/webadmin/stdout.log 2>/var/log/webadmin/stderr.log &

## stop_webmanager
PID=`ps -ef | grep 'DCWebManager-0.0.1-SNAPSHOT' | grep -v 'grep' | awk '{ print $2 }'`
if [ -n "$PID" ]; then
	echo $PID
	kill $PID
	sleep 1
	PID=`ps -ef | grep 'DCWebManager-0.0.1-SNAPSHOT' | grep -v 'grep' | awk '{ print $2 }'`

	if [ -n "$PID" ]; then
	        echo "$PID is not kill yet."
	else
        	echo "kill done!"
	fi

else
	echo "Can't find running process."
fi
