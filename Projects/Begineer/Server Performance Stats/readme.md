Goal of this project is to write a script to analyse server performance stats.

# Requirements

You are required to write a script 'server-stats.sh' that can analyse basic server performance stats. You should be able to run the script on any Linux server and it should give you the following stats:

1. Total CPU usage
2. Total memory usage (Free vs Used including percentage)
3. Total disk usage (Free vs Used including percentage)
4. Top 5 processes by CPU usage
5. Top 5 processes by memory usage

Stretch goal: Feel free to optionally add more stats such as os version, uptime, load average, logged in users, failed login attempts etc.


## Knowledge Block

1. What is the Shell?
Ans:- A shell is just a program that lets you talk to the OS.
   for example:- Bash

commands like:- 
```
ls 
cd /var
top
```

#### Create File
```
touch server-stats.sh
chmod +x server-stats.sh  ## this chmod +x help us to make file executable
```


#!/bin/bash → tells system to use Bash

Explanation:
```
top -bn1 → run once (no UI)
grep → filter line
awk → extract + calculate values
```


```
main() {
    get_cpu
    get_memory
    get_disk
    top_processes
}
```

free → gives memory stats
awk → processes columns



## Column meaning (important)
```
Field	          Meaning
$1	            "Mem:" (label)
$2	            total memory
$3	            used memory
$4	            free memory

```

## Part	Meaning
```
/Mem/	        pick only the "Mem" row
$3	            used memory
$2	            total memory
print	        output result
```