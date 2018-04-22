#!/usr/bin/env python3
import subprocess
import time

while True:
    time.sleep(5)
    try:
        subprocess.Popen(["xrandr"])
    except:
        pass
    else:
        break


# function to get the output of xrandr
def get(cmd): return subprocess.check_output(cmd).decode("utf-8")
# - to count the occurrenc of " connected "
def count_screens(xr): return xr.count(" connected ")
# - to run the connect / disconnect command(s)
def run_command(cmd): subprocess.Popen(["/bin/bash", "-c", cmd])

# first count
xr1 = None

while True:
    time.sleep(5)
    # second count
    xr2 = count_screens(get(["xrandr"]))
    # check if there is a change in the screen state
    if xr2 != xr1:
        run_command("~/.i3/script/set-monitor.sh")
        
    # set the second count as initial state for the next loop
    xr1 = xr2