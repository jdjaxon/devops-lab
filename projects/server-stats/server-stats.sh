#!/usr/bin/env bash

set -euo pipefail

main() {
    get_cpu_usage
    get_memory_usage
    get_disk_usage
    get_top_proc_by_cpu
    get_top_proc_by_mem
    get_os_version
    get_uptime
    get_logged_in_users
    get_auth_failures
}


print_section() {
    echo "### $1 ###"
    shift 1
    for arg in "$@"; do
        echo "$arg"
    done
    echo
    echo
}


get_cpu_usage() {
    cpu_usage=$(top -bn1 | awk '/%Cpu/ {usage=100 - $8; printf("%.2f", usage)}')
    print_section "CPU Usage" "$cpu_usage%"
}


get_memory_usage() {
    mem_used_perc=$(free | awk '/Mem/ {printf("%.2f", $3/$2*100)}')
    mem_stats=$(free -h | \
        awk '/Mem/ {print "Total: " $2 "\nUsed: " $3 "\nFree: " $4}')
    print_section "Memory Usage" "$mem_stats" "Memory Used: $mem_used_perc%"
}


get_disk_usage() {
    disk_usage=$(df -h --total)
    print_section "Disk Usage" "$disk_usage"
}


get_top_proc_by_cpu() {
    procs=$(ps -eo comm,pid,user,uid,pcpu,pmem --sort=-pcpu | head -n6)
    print_section "Top 5 Processes by CPU Usage" "$procs"
}


get_top_proc_by_mem() {
    procs=$(ps -eo comm,pid,user,uid,pcpu,pmem --sort=-pmem | head -n6)
    print_section "Top 5 Processes by Memory Usage" "$procs"
}


get_os_version() {
    os=$(uname -rsv)
    print_section "OS Version" "$os"
}


get_uptime() {
    uptime=$(uptime)
    print_section "Uptime" "$uptime"
}


get_logged_in_users() {
    users=$(w)
    print_section "Active Users" "$users"
}


get_auth_failures() {
    fails=""
    deb_logfile="/var/log/auth.log"
    rh_logfile="/var/log/secure"

    if [ -f $deb_logfile ]; then
        fails="$(grep -i 'fail' $deb_logfile)"
    elif [ -f /var/log/secure ]; then
        fails="$(grep -i 'fail' $rh_logfile)"
    fi

    print_section "Failed Login Attempts" "$fails"
}


main
