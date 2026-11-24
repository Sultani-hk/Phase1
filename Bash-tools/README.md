# Tool Name : Sysinfo Bash Tool (sysinfo.sh)

### Objective 
The objective of this tool is to provide a quick , automated overview of critical system information on a Linux machine. It gather dta such as OS details , Kernel version , CPU usage, Memory status , and disk space allow or addministrators to quickly assess the health and configuration of a system 

### Features 

-*** Os Information :** Displays the operating system name and version.
-*** Kernel Details : ** shows the current Linux kernel version. 
-*** Network info : *** display the local IP address and hostname .
-*** Resource Usage: ** Report current CPU load, RAM usage , and disk space .
-*** User Friendly :** Formats output clearly using text separation for easy readin.


### Requirements 
-*** Bash Shell ** (Standard on Kali Linux and most Linux distributions).
- Core utilities ('uname','df','free','whoami','hostname','IP')


### How to Run 

1.Clone the repository and navigate into the 'sysinfo-tool' folder:
    '''bash 
    cd Bash-tools
    chmod +x sysinfo.sh
    ./sysinfo.sh


