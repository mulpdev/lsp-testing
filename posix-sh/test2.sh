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

split_cut_res=unset
split_cut()
{
  str="$1"
  sep="$2"
  idx="$3"
  #split_cut_res="$(cut -d"$sep" -f"$idx" <<<"$str")"
  echo "'$sep'"
  split_cut_res="$(echo "$str" | cut -d"$sep" -f"$idx")"
}

output=$(xrandr)
echo "${output}" | while IFS= read -r singleline
do
  contains "$singleline" " connected "
  result=$?
  if [ $result -eq 0 ]; then
    charsep=" "
    split_cut "$singleline" "$charsep" 1
    echo "$split_cut_res"
  fi
done
