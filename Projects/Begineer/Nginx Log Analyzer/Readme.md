# Nginx Log Analyser
#### Write a simple tool to analyze logs from the command line.

The goal of this project is to help you practice some basic shell scripting skills. You will write a simple tool to analyze logs from the command line.

# Requirements
#### Download the sample nginx access log file from here. The log file contains the following fields:

* IP address
* Date and time
* Request method and path
* Response status code
* Response size
* Referrer
* User agent

You are required to create a shell script that reads the log file and provides the following information:

1. Top 5 IP addresses with the most requests
2. Top 5 most requested paths
3. Top 5 response status codes
4. Top 5 user agents

Here is an example of what the output should look like:

text
```
Top 5 IP addresses with the most requests:

45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests
43.224.43.187 - 30 requests
178.128.94.113 - 20 requests

Top 5 most requested paths:

/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests
/api/v1/payments - 30 requests
/api/v1/reviews - 20 requests

Top 5 response status codes:

200 - 1000 requests
404 - 600 requests
500 - 50 requests
401 - 30 requests
304 - 20 requests
```

There are multiple ways to solve this challenge. Do some research on `awk`, `sort`, `uniq`, `head`, `grep`, and `sed` commands. Stretch goal is to come up with multiple solutions for the above problem. For example, instead of using `awk`, you can use `grep` and `sed` to filter and count the requests.



# ======== Knowledge Block ===========  

AWK is a powerful, data-driven [programming language](https://en.wikipedia.org/wiki/AWK) designed for [text processing](https://linuxize.com/post/awk-command/), data extraction, and report generation in Unix-like environments. [1, 2] 
## Core Functionality

* Record and Field Processing: AWK reads input line by line (as records) and automatically splits each line into individual fields based on whitespace by default.
* Pattern-Action Structure: Programs consist of pairs: pattern { action }. If the input line matches the pattern, the action is executed.
* Special Patterns:
* BEGIN: Actions performed before any input is read.
   * END: Actions performed after all input has been processed. [3, 4, 5, 6, 7, 8, 9, 10] 

## Built-in Variables

* $0: Refers to the entire line.
* $1, $2, ...: Refer to specific columns (first, second, etc.).
* NF: The Number of Fields in the current line.
* NR: The Number of Records (line count) processed so far.
* FS: The Field Separator character (default is space or tab). [4, 10, 11, 12, 13, 14] 

## Common Use Cases

* Data Extraction: Quickly pulling specific columns from logs or CSV files (e.g., awk '{print $1}').
* Filtering: Printing lines that match a regular expression or condition (e.g., awk '/error/').
* Calculations: Performing math on columns, such as summing values (e.g., sum += $3).
* Report Generation: Formatting raw text into clean tables using printf. [2, 15, 16, 17, 18, 19] 

## Major Implementations

* gawk (GNU AWK): The standard version on Linux with modern extensions.
* mawk: Focused on high-speed execution.
* nawk (New AWK): A revised version often called the "One True AWK". [1, 6, 11, 20] 
