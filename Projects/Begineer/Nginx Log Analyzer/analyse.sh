# // #!/bin/bash
# COUNTS=5


# echo -e "\nTop ${COUNTS} IP addresses with the most requests:"
# awk '{print $1}' logfile.txt | sort | uniq -c | sort -nr |awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

# echo -e "\nTop ${COUNTS} most requested paths:"
# awk '{print $7}' logfile.txt | sort | uniq -c | sort -nr |awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

# echo -e "\nTop ${COUNTS} response status codes:"
# grep -oE ' [1-5][0-9]{2} ' logfile.txt | sort | uniq -c | sort -rn | awk '{print $2 " - " $1 " requests"}' |  head -n $COUNTS 

# echo -e "\nTop ${COUNTS} user agents:"
# awk -F'"' '{print $6}' logfile.txt | sort | uniq -c | sort -nr | awk '{for(i=2;i<=NF;i++) printf "%s ", $i; print "-",$1,"requests"}' | head -n $COUNTS




#!/bin/bash
# nginx-log-analyst.sh
# This script analyzes Nginx access logs and provides insights such as:
# - Total number of requests
# - Top 5 IP addresses with the most requests
# - Top 5 most requested paths
# - Top 5 HTTP status codes
# - Top 5 user agents
# Usage: ./nginx-log-analyst.sh /path/to/nginx/access.log
LOG_FILE="$1"
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Usage: $0 /path/to/nginx/access.log"
    exit 1
fi
echo "=== Analyzing Nginx access log: $LOG_FILE ==="
echo "======================================================================"
# Total number of requests
TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")
echo "--- Total number of requests: $TOTAL_REQUESTS ---"
# Top 5 IP addresses with the most requests
echo "--- Top 5 IP addresses with the most requests: ---"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
# Top 5 most requested paths
echo "--- Top 5 most requested paths: ---"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
# Top 5 HTTP status codes
echo "--- Top 5 HTTP status codes: ---"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
# Top 5 user agents
echo "--- Top 5 user agents: ---"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'