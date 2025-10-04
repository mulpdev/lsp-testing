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
  split_awk_res=$(awk -v str="$1" -v sep="$2" -v idx="$3" 'BEGIN {split(str, myarr, sep); print myarr[idx]}')
}
device=unset
output=$(xrandr)
# echo "${output}" | while IFS= read -r singleline
# this is run a subshell, use "here string" instead
while IFS= read -r singleline;
do
  echo "device = '$device'"
  contains "$singleline" " connected "
  result=$?
  if [ $result -eq 0 ]; then
    split_awk "$singleline" " " 1
    echo "awk: $split_awk_res"
    device="$split_awk_res"
    echo "connected device is: $device"
    break
    echo "after break"
  fi
done << EOF
$output
EOF

echo "connected device is: $device"

