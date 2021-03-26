#!/bin/bash
function_g(){
files=$(yad --width 100 --height 100 --title "Choose the Shell Script" \
      --text="  Choose appropriate option:" \
      --button="-t:1" \
      --button="-p:2" \
      --button="-r:3" \
      --button="-u:4" \
      --button="-h:5" \
      --button="-m:6" \
      --button="-s:7" \
      --button="-v:8" \
      --button="-o:9" \
      --button="-f:10" \
      --on-top \
      --center \
  )
  ret=$?
  case $ret in
    1)
    exec ./KhalilChettaoui.sh -t
    ;;
    2)
    exit 0
    ;;
    *)
    echo "error"
    exit 1
    ;;
  esac
}
