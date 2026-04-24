# Enterprise LogQL Query Reference

## 1. The JSON Parser
*Converts raw text into searchable JSON fields dynamically.*
`{app="json-logger"} | json`

## 2. The Error Catcher
*Parses the JSON, then strictly filters for critical database errors.*
`{app="json-logger"} | json | level="critical" and module="database"`

## 3. Logs-to-Metrics (The Dashboard Query)
*Counts the per-second rate of database errors over a 1-minute rolling window. You graph this in Grafana!*
`rate({app="json-logger"} | json | level="critical" [1m])`

## 4. The Metal Layer (Syslog/Messages)
*Bypass the containers and read the actual Linux host kernel logs to debug underlying node failures.*
`{filename="/var/log/syslog"}`  (Ubuntu/Debian nodes)
`{filename="/var/log/messages"}` (CentOS/RHEL nodes)