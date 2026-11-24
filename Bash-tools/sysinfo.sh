#!/bin/bash 



Systeminfo(){
echo  "## ============================== ##"
echo  "## Willcome to System information ##"
echo  "## ============================== ##"
echo ''
echo ''	

	hs=$(hostname) 
	echo "Your host name is $hs ";
	osv=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2) 	
	echo "Your OS name and version is $osv";
	arc=$(uname -m)	
	echo "Your Architecture is $arc  "
	uptime=$(uptime -p)
	echo "Your system was $uptime time "
	Currend_date=$(date)
	echo "The Current date is $Currend_date "
}

CPUinfo(){
echo "## ============================== ##"
echo "## Willcome to CPU information ##"
echo "## ============================== ##"
echo ''
echo ''
	Model_Name=$(lscpu | grep "Model name" | awk -F':[[:space:]]*' '{print $2}')
       echo "Your Model name is $Model_Name"
	Nproc=$(nproc)	
       echo "Number of Proccessor that your system have $Nproc"
	Loadavg=$(head -n 3 /proc/loadavg)
	echo "Your load Avrage is : $Loadavg"	

}

Memory(){
echo "## ============================== ##"
echo "## Willcome to Memory information ##"
echo "## ============================== ##"
echo ''
echo ''
	echo Your general information about you memory is : 
	free -h 
	Mem_usage=$(free | awk '/Mem:/ {printf"%.0f%%",$3/$2*100}')
	echo "Your Memory Usage is $Mem_usage " 
	swap=$(free -h |grep Swap )
	echo "Your swap memory is : $swap"
} 

 
Disk(){
echo "## ============================== ##"
echo "## Willcome to Disk information ##"
echo "## ============================== ##"
echo ''
echo ''	
	df -h 
	echo "Warning must be set in here "
}
 
Network(){
echo "## ============================== ##"
echo "## Willcome to Networking information ##"
echo "## ============================== ##"
echo ''
echo ''

	IP_Mac=$(hostname -I )
	echo "Your IP and Mac >>  $IP_Mac"
	gateway=$(ip route | grep default)
	echo "Your $gateway "
	echo "Your DNS is : "
	cat /etc/resolv.conf | grep nameserver
}

Users(){
echo "## ============================== ##"
echo "## Willcome to User information ##"
echo "## ============================== ##"
echo ''
echo ''


	wh=$(whoami)
	echo "Your are Loged with User >>$wh <<  "
	Curren=$(who)
	echo "Your Currently Login User is : $Curren"
}


Help(){

echo "## ============================== ##"
echo "##   Willcome to Helping Page     ##"
echo "## ============================== ##"
echo ''
echo ''

	echo "This tool is just for showing your computer "
	echo "Charactristics and can not do anything else  "


	echo "For ever that you want to chack in you computer you can use "
	echo "from given charachters ."
	echo ""
	echo "Warninig !!!!"
	echo ""
	echo "When you use from these characters you must use from small litter "
	echo "if say 'h' for helping you must type 'h' do not type 'H' "
	echo "Becarifull when you type you characters ...."


}


while true; do

	tput setaf 1 
	echo "## ==================================== ##"
	echo "## Willcome to System information Tool  ##"
	echo "## ==================================== ##"
	echo ''
	echo ''
	tput sgr0

	echo "h    Need helping "
	echo "s    System Information"
	echo "c    CPU Information "
	echo "m    Memory Information"
	echo "d    Disk Information "
	echo "n    Networking Information"
	echo "u    User Information "
	echo "x    Exit"



	echo "What Informatin do you need???"
	read info


	tput reset 
	case $info in h) 
		Help ;;
		s)
			Systeminfo;;
		c)
			CPUinfo;;
		m)
			Memory;;
		d)
			Disk;;
		n)
			Network;;
		u)
			Users;;
		x)
			break;; 
		*)
			echo "You Choose the wrog Char"
	esac
done	
