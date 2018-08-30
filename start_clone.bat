mode con: cols=150 lines=50

set APP_PORT=8099
set APP_CONTEXT_PATH=zookeeper-explorer
set CONNECTION_HOST=srv2-gf-app01
set CONNECTION_PORT=2181

start cmd.exe @cmd /k "java -jar zookeeper-explorer-1.0.2-RELEASE-exec.jar --server.port=%APP_PORT% --server.context-path=/%APP_CONTEXT_PATH% --zookeeper.connectionString=%CONNECTION_HOST%:%CONNECTION_PORT%"

:start
@ netstat -an | find "%APP_PORT%"
@if %errorlevel% == 0 goto :start_browser
@echo "Waiting for app to start ..."
@ timeout 5 
@ goto start

:start_browser
start http://localhost:%APP_PORT%/%APP_CONTEXT_PATH%