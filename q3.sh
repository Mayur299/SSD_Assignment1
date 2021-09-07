#1 /usr/bin/bash

array=( $(compgen -c) )

function in_array {
  ARRAY=$2
  for e in ${ARRAY[*]}
  do
    if [[ "$e" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}


perm() {
  local items="$1"
  local out="$2"
  local i
  [[ "$items" == "" ]] && echo "$out" && return
  for (( i=0; i<${#items}; i++ )) ; 
  do
    perm "${items:0:i}${items:i+1}" "$out${items:i:1}"
  done
  }


permu=( $(perm $1
perm $1 > tmp) )




new=( $(echo "${permu[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ') )




function in_array {
  ARRAY=$2
  for e in ${ARRAY[*]}
  do
    if [[ "$e" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}

declare -a ans=()


for i in "${new[@]}"
do
    if in_array "$i" "${array[*]}"
  then
       ans+=("$i")
  fi

done




if [[ ${#ans[@]} -eq 0 ]]
then
	echo "NO $1"
else 
	echo -n $'YES ' 
	printf '%s\t' "${ans[@]}"
fi
	



