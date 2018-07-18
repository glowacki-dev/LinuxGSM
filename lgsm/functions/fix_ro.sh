#!/bin/bash
# LinuxGSM fix_ro.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Resolves various issues with Red Orchestra.

commandname="FIX"
commandaction="Fix"
function_selfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

echo "Applying WebAdmin ROOst.css fix."
echo "http://forums.tripwireinteractive.com/showpost.php?p=585435&postcount=13"
sed -i 's/none}/none;/g' "${serverfiles}/Web/ServerAdmin/ROOst.css"
sed -i 's/underline}/underline;/g' "${serverfiles}/Web/ServerAdmin/ROOst.css"
sleep 0.5
echo "Applying WebAdmin CharSet fix."
echo "http://forums.tripwireinteractive.com/showpost.php?p=442340&postcount=1"
sed -i 's/CharSet="iso-8859-1"/CharSet="utf-8"/g' "${systemdir}/uweb.int"
sleep 0.5
echo "Applying Steam AppID fix."
sed -i 's/1210/1200/g' "${systemdir}/steam_appid.txt"
sleep 0.5
echo "applying server name fix."
sleep 0.5
echo "forcing server restart..."
sleep 0.5
command_start.sh
sleep 5
command_stop.sh
command_start.sh
sleep 5
command_stop.sh
