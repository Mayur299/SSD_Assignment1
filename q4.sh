#! /usr/bin/bash



func () {
local ans=""
val=$1
while [ $val -gt 0 ]
do
	if [ $val -ge 1000 ]
        then            
        	ans+="M"
                val=$(($val - 1000))
                
            
        elif [ $val -ge 900 ]
        then
                ans+="C"
                ans+="M"
                val=$(($val - 900))
            
        elif [ $val -ge 500 ]
        then
                ans+="D"
                val=$(($val - 500))
            
        elif [ $val -ge 400 ]
        then
                ans+="C"
                ans+="D"
                val=$(($val - 400))
            
        elif [ $val -ge 100 ]
        then
                ans+="C"
                
                val=$(($val - 100))
            
        elif [ $val -ge 90 ]
        then
                ans+="X"
                ans+="C"
                val=$(($val - 90))
            
        elif [ $val -ge 50 ]
        then
                ans+="L"
                val=$(($val - 50))
            
        elif [ $val -ge 40 ]
        then
                ans+="X"
                ans+="L"
                val=$(($val - 40))
            
        elif [ $val -ge 10 ]
            then
                ans+="X"
                val=$(($val - 10))
                
        elif [ $val -ge 9 ]
        then
                ans+="I"
                ans+="X"
                val=$(($val - 9))
            
        elif [ $val -ge 5 ]
        then
                ans+="V"
                 
                val=$(($val - 5))
            
        elif [ $val -ge 4 ]
        then
                ans+="I"
                ans+="V"
                 
                 val=$(($val - 4))
            
        else
            
                 ans+="I"
                 val=$(($val - 1))
        fi
done
echo "$ans"

}






func2() {

        declare -A map
        map["I"]=1
        #map+=( ["V"]=5 ["X"]=10 ["L"]=50 ["C"]=100 ["D"]=500 ["M"]=1000 )
        #map["L"]=50
        #map["C"]=100
        #map["D"]=500
        #map["M"]=1000 )
        map["V"]=5 
        map["X"]=10
        map["L"]=50
        map["C"]=100
        map["D"]=500
        map["M"]=1000
        str=$1
        prev=-1
        result=0
      for (( i=0; i<${#str}; i++ )) 
      do
          curr=${map[${str:$i:1}]}
     
          if [[ $prev -ne -1 ]] && [[ $curr -gt $prev ]]
          then
              result=$((result - prev))
              result=$((result + curr - prev))
          else
              result=$((result + curr))
          fi
          prev=$curr
      done
      
      }

            






if [[ $# -eq 1 ]]
then
	func $1
	echo "$getval"
elif [[ $# -eq 2 ]]
then 
   #if [[ "$1" =~ "^[0-9]+$" ]] && [[ "$2" =~ "^[0-9]+$" ]]
   if [[ $1 =~ ^-?[0-9]+$ ]] && [[ $2 =~ ^-?[0-9]+$ ]]
   
   then
       sum=$(($1 + $2))
   	func $sum
   else
         func2 $1 
         var1=$result
   	func2 $2
   	var2=$result
   	answer=$((var1 + var2))
   	echo "$answer"
   	
   fi
else
	echo "wrong argumnets"
fi



            
       
   
