# How to take a command, paste it into a router, and then run it. You will need to copy your tclsh script between the brackets of the puts command.
enable
tclsh
# create the new .tcl file with the commands pasted in
puts [open "flash:changeip.tcl" w+] {
ios_config "int g0/0" "no ip address 10.1.2.3 255.255.255.0 secondary" ; 
ios_config "int g0/0" "ip address 10.1.2.3 255.255.255.0" ; 
ios_config "int g0/0" "ip address 1.2.3.4 255.255.255.0 secondary"
}
exit
# Run the script from flash
tclsh flash:changeip.tcl
