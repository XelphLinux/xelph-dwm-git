#!/usr/bin/env bash
interval=0
cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c#3b414d^ ^b#A3BE8C^ CPU"
  printf "^c#abb2bf^ ^b#414753^ $cpu_val"
}

update_icon() {
  printf "^c#94af7d^ "
}

pkg_updates() {
	updates=$(checkupdates | wc -l)

  if [ -z "$updates" ]; then
    printf "^c#94af7d^ Fully Updated"
  else
    printf "^c#94af7d^ $updates"" updates"
  fi
}

# battery
batt() {
  printf "^c#81A1C1^  "
  printf "^c#81A1C1^ $(acpi | sed "s/,//g" | awk '{if ($3 == "Discharging"){print $4; exit} else {print $4""}}' | tr -d "\n")%"
}

brightness() {

  backlight() {
    backlight="$(brightnessctl info| grep "Current" |awk '{print $NF}'| sed 's/(\(.*\))/\1/g')"
    echo -e "$backlight"
  }

  printf "^c#BF616A^   "
  printf "^c#BF616A^%.0f\n" $(backlight)
}

mem() {
  printf "^c#7797b7^^b#2E3440^  "
  printf "^c#7797b7^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}
clock() {
  printf "^c#2E3440^ ^b#828dd1^  "
  printf "^c#2E3440^^b#6c77bb^ $(date '+%A, %D %I:%M:%S %p') "
}

while true; do

  [ $interval == 0 ] || [ $(($interval % 3600)) == 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))
  sleep 1 && xsetroot -name "$(update_icon) $updates $(batt) $(brightness) $(cpu) $(mem) $(clock)"
done
