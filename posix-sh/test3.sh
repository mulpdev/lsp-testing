#!/bin/sh

contains()
{
  # https://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_02
  # ${parameter#word}
  #   Remove Smallest Prefix Pattern. The word shall be expanded to produce a pattern. The parameter 
  #   expansion shall then result in parameter, with the smallest portion of the prefix matched by the pattern deleted.
  string="$1"
  substring="$2"
  if [ "${string#*"$substring"}" != "$string" ]; then
    return 0 # substring contained in string
  else
    return 1 # substring NOT contained in string
  fi
}

split_awk_res=unset
split_awk()
{
  str="$1"
  sep="$2"
  idx="$3"
  echo "$str"
  echo "'$sep'"
  echo "$idx"
  #echo "$str" | awk -v idx="$idx" -F$sep 'BEGIN {print idx}'
  echo "----"
  awk -v str="$str" -v sep="$sep" -v idx="$idx" 'BEGIN {split(str, myarr, sep); print myarr[idx]}'
  #split_awk_res="$(echo "$str" | awk -F'$sep' '{print $idx}')"
  #split_awk_res=$(awk '{split("$str", myarr, "$sep"); {print a["$idx"]}')
  #split_awk_res=$(awk '{split("$str", myarr, "$sep"); {print a["$idx"]}')
}

output=$(xrandr)
echo "${output}" | while IFS= read -r singleline
do
  contains "$singleline" " connected "
  result=$?
  if [ $result -eq 0 ]; then
    split_awk "$singleline" " " 1
    echo "$split_awk_res"
  fi
done
