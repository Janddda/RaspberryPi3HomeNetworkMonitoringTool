README File for Raspberry Pi Network Scanner! 
1) Configure netscan.sh to enter the correct network IP address, E-mail address, and rescan time.
2) Open terminal and chmod the entire network scanner tool directory to be executible. Command: chmod -R 777 NetScan (or whatever you name your directory)
3) Type: 
bash netscan.sh &
bash revoke_add_missing.sh & 
in the terminal when you are in the network scanner tool directory to start the tool to start the tool. You may also run ./prog.sh and it will start them. 
4) For revoking the devices, you will need to configure your router to accept ssh command
and also configure the revokemissing_php.sh to put your routers credentials. 
5) Access the interface by entering your ip of the raspberry pi and going to the network.php file. 

*****Important 3rd party software configurations settings to make sure NetScan2000 runs correctly******
1) Make sure nmap is installed. 
2) Make sure SSTMP Mail Server is configured.
	EX for Kali Terminal commands:
		apt-get install ssmtp
		apt-get install mailutils
	** configuration file to edit: /etc/ssmtp/ssmtp.conf**
3) Make sure Apache2 is installed and configured
4) Make sure MySQL is installed and configured
5) Make sure PHP is installed and configured