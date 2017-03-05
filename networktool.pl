#!/usr/bin/env perl
use strict;
use warnings;

#======================================================================
# File: networktook.pl
# Purpose: Perl script to configure the network scanner
# Author: Garen and Claude
#======================================================================

print_menu();
while(1) {
	print_CLI();
	my $user_input=get_input();

	if ($user_input =~ /^main$/i) {
		print_menu();
	} 
	elsif ($user_input =~ /^allowed/i) {
		allowed($user_input);
	}
	elsif ($user_input =~/^missing/i) {
		missing($user_input);
	}
	elsif ($user_input =~/^revoked/i) {
		revoked($user_input);
	}
	elsif (($user_input =~ /^exit$/i) or ($user_input =~ /^quit$/i)) {
		exit;
	}
	
	else{
		print_error();
	}
}


#====================================================
#Command: main 
#====================================================

sub print_menu { 
my $menu = "
Network Tool Command Line Interface
=====================================================
CMD             Description
=====================================================
main            Show Command Categories.
allowed         Shows allowed devices on your network and allows you to configure the list. 
missing         Shows missing devices on your network and allows you to configure the list.
revoked         Shows the revoked devices from your network.   
exit            Exit CLI.
=====================================================
Command Format: <COMMAND> [Sub-Command] [Parameters].
Note: Use <CMD> -h or -help to get details.\n\n";

	print $menu;	
}

sub print_CLI {
	my $CLI = "CLI> ";
	print $CLI;
}

sub get_input {
        my $input = <STDIN>;
        chomp $input;
        return $input;
}

sub print_error {	
	my $error = "Error Message: Invalid Command.\n\n";
	print $error;
}

#====================================================
#Command: allowed
#====================================================

sub allowed {
	my $input = $_[0];

	if (($input =~ /\-h$/i) or ($input =~ /\-help$/i))
	{
		print_allowed_menu();	
	}
        elsif($input =~ /\s+list$/i)
        {
                list();
        }
        elsif($input =~ /\s+remove$/i)
        {
                remove();
        }
	elsif($input =~ /\s+revoke$/i)
	{
		revoke();
	}
	else 
	{
		print_allowed_menu();	
	}

	return;
}

sub print_allowed_menu {
	print "
Sub-Command & Parameters Of [ network ]
Sub-Command 	Description
================================================================
list		Lists allowed devices.
remove          Remove an allowed device.
revoke          Revoke an allowed device.
================================================================\n\n";	
} 

sub list {
	print "Allowed Devices:\n";
	print `cat master.txt`;
}

sub remove {
	print "Select a device you want to remove from the allowed list:\n";
	print `cat master.txt`;
	my $delete_device=get_input();
	print `bash removeallowed.sh $delete_device`;	
}

sub  revoke {
	print "Select a device you want to revoke from the allowed list:\n";
	print `cat master.txt`;	
	my $revoke_device=get_input();
	print `bash revokeallowed.sh $revoke_device`;
	print `bash removeallowed.sh $revoke_device`;
}

#====================================================
#Command: missing
#====================================================

sub missing {
	my $input = $_[0];

	if (($input =~ /\-h$/i) or ($input =~ /\-help$/i))
	{
		print_missing_menu();	
	}
        elsif($input =~ /\s+list$/i)
        {
                missing_list();
        }
        elsif($input =~ /\s+remove$/i)
        {
                missing_remove();
        }
	elsif($input =~ /\s+revoke$/i)
	{
		missing_revoke();
	}
	else 
	{
		print_missing_menu();	
	}

	return;
}

sub print_missing_menu {
	print "
Sub-Command & Parameters Of [ network ]
Sub-Command 	Description
================================================================
list		Lists devices still not on your allowed list.
remove          Remove a device from the devices still not on your allowed list and add it to the allowed list.
revoke          Revoke a device.
================================================================\n\n";	
} 

sub missing_list {
	print "Devices still not on your allowed list :\n";
	print `cat missing.txt`;
}

sub missing_remove {
	print "Select a device you want to remove from the list of devices still not on the allowed list:\n";
	print `cat missing.txt`;
	my $delete_device=get_input();
	print `bash addmissing.sh $delete_device`;
	print `bash removemissing.sh $delete_device`;	
}

sub missing_revoke {
	print "Select a device you want to revoke from the list of devices still not on the allowed list:\n";
	print `cat missing.txt`;	
	my $revoke_device=get_input();
	print `bash revokemissing.sh $revoke_device`;
	print `bash removemissing.sh $revoke_device`;
}


#====================================================
#Command: revoked
#====================================================

sub revoked {
	my $input = $_[0];

	if (($input =~ /\-h$/i) or ($input =~ /\-help$/i))
	{
		print_revoked_menu();	
	}
        elsif($input =~ /\s+list$/i)
        {
                revoked_list();
        }
        elsif($input =~ /\s+remove$/i)
        {
                revoked_remove();
        }
	else 
	{
		print_revoked_menu();	
	}

	return;
}

sub print_revoked_menu {
	print "
Sub-Command & Parameters Of [ network ]
Sub-Command 	Description
================================================================
list		Lists devices on the revoked list.
remove          Remove a device from the revoked list.
================================================================\n\n";	
} 

sub revoked_list {
	print "Devices on your revoked list:\n";
	print `cat revoked.txt`;
}

sub revoked_remove {
	print "Select a device you want to remove from the revoked list:\n";
	print `cat revoked.txt`;
	my $delete_revoked=get_input();
	print	`bash removerevoked.sh $delete_revoked`;	
}
