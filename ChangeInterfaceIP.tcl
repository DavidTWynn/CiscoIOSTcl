# How to take a command, paste it into a router, and then run it. You will need to copy your tclsh script between the brackets of the puts command.
# get into priv exec
enable
# get into the tcl shell
tclsh
# We are goig to create a new file and put it in flash, rather than copying from a tftp server
puts [open "flash:changeip.tcl" w+] {
ios_config "int g0/0" "no ip address 10.1.2.3 255.255.255.0 secondary" ; 
ios_config "int g0/0" "ip address 10.1.2.3 255.255.255.0" ; 
ios_config "int g0/0" "ip address 1.2.3.4 255.255.255.0 secondary"
}
# get out of the tcl shell, back into priv exec
exit
# Run the script from flash
tclsh flash:changeip.tcl
# Verify changes
show ip interface brief
!
