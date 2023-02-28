#!/bin/bash

back=$back +  1

#Variables
#enable = "y"
#echo "$enable"

#building of dependncy 
FILE1=scan.txt
FILE2=fullscan.txt

directory (){
	if [ -d "/home/administrator/scans"]
	then 
			backup
	else
			cd 
			mkdir scans
			backup 
	fi 	
}

#back up old files before generating new
backup (){
	if [-d "/home/administrator/scans/backup"]
	then
		MV_files
	else
		cd /home/administrator/scans
		mkdir backup
		MV_files
	fi
}

MV_files (){
	cd /home/administrator/scans 
	mv scan.txt > /home/administrator/scans/backup/scan.txt 
	mv fullscan.txt > /home/administrator/scans/backup/fullscan.txt 
	back_files	
}	


back_files (){
		mv scan.txt scan_backup1$RANDOM.txt
		mv fullscan.txt fullscan_backup1$RANDOM.txt
		change 
}


#back_files (){
#	cd /home/administrator/scans/backup
#	if [ -f "scan_backup$back.txt" ]
# 	then 
#		back=back+1
#		bounce 
#	else
#		mv scan.txt scan_backup$back.txt
#		mv fullscan.txt fullscan_backup$back.txt
#		echo "$back"
#		change
#	fi
#}
bounce (){
	back_files
}
r_name (){
	mv scan.txt scan_backup$back.txt
	mv fullscan.txt fullscan_backup$back.txt
	change 
}

change (){
	cd /scans
	start
#	scan_file
}

#Save files 
#scan_file (){
#	if [ -f "$FILE1"] && [ -w "$FILE1"]
#	then
#			touch $FILE1
#			fullscan_file
#	else
		#	touch $FILE1
#		
#			fullscan_file
#	fi
#}
#fullscan_file(){
#	if [-f "$FILE2"] && [-w "$FILE2"]
#	then
#			start
#	else
#			
#			touch $FILE2
#		+
#			start
#	fi
#}

#start + information gathering 
echo "Weclome to joshs tryhackme nmap helper"
start () {
	#gather ip
	echo "Please enter ip address"
	read ip 
	#pinging 
	echo "Would you like to avoid ping 1 for yes 2 for no"
	read ping
       	control 	
}


#statment 
control () {
	if [ $ping -eq 1 ]
		then
			echo "mapped"
			+
			f1
		else
			echo"Ping not enabled"
			+
			f2
fi
}

#nmap scans 
f1 (){
	nmap -vv $ip > /home/administrator/scans/scan.txt
       +
	nmap -vv -p- $ip > /home/administrator/scans/fullscan.txt
}

f2 (){
	nmap -vv $ip > /home/administrator/scans/scan.txt
	+
	nmap -vv -p- $ip > /home/administrator/scans/fullscan.txt
}


#begin function
directory
