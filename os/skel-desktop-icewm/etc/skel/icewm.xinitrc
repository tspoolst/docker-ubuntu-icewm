#!/bin/bash

# run profile to set $PATH and other env vars correctly
. $HOME/.bash_profile
# setup background
#xsetroot -gray #056
# setup mouse acceleration
# xset m 7 2
# run initial programs
# xterm
# start icewm, and run xterm if it crashes (just to be safe)

# the system must be loaded in this order
# rox,gkrellm,fbpanel,icewm
# however disk delays and overall load processes affects the final startup time

#(sleep 20;while true;do x2x -west -to 10.1.1.11:0;sleep 1;done) &
#if grep -q horizontal /etc/xorg.conf ; then
#  rox -l=leftbar -p=desktop3
#else
  rox -l=leftbar -p=desktop0
#fi
fbpanel &
#gkrellm -g +35+0 &
#nedit /etc/xorg.conf
#(sleep 20 ; gkrellm -g +35+0) &
icewm || exec xterm -fg red
killall fbpanel
killall rox
