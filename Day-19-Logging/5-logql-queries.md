# Advanced LogQL Cheatsheet

## 1. The Grep Filter (Finding the Needle)
Searches all logs from the noisy-app, but ONLY shows lines containing the word "error".
`{app="noisy-logger"} |= "error"`

## 2. JSON Parsing (Extracting Variables)
Tells Loki to parse the JSON, allowing us to filter by specific JSON keys (like HTTP status codes).
`{app="noisy-logger"} | json | status >= 500`

## 3. Metric Extraction (Logs to Math)
Converts a raw log stream into a mathematical rate. This calculates "How many errors per second are we getting over a 1-minute window?"
`rate({app="noisy-logger"} |= "error" [1m])`