#!/bin/bash

function mediumValue(){
# Input parameters
# $1 - minimum value 
# $2 - maximum value
# output 
# returnMediumValue - medium value between $1 and $2
if [ $1 -ne $2 ]            
then
    counter=0                   #loop counter
    currentValue=$1            #since we do not want to modify a1 we will use temporary variable
    returnMediumValue=$1           #initial assign
    while [ $currentValue -le $2 ]; do
        let isOdd=counter%2
        if [ $isOdd -eq 1 ]
        then
            let returnMediumValue=returnMediumValue*2
        fi
        # Change loop parameters
        let currentValue=currentValue*2
        let counter=counter+1
    done
    echo ----------------------------------------------------- Medium value between $1 and $2 is $returnMediumValue
else
    returnMediumValue=$1
fi
}

function runSimulationsFor(){
# Run simulations for selected parameters
# Use proper flag to select them.
for (( i=1; $i <= $#; i++ )) ;
do
    if [ "${!i}" = "-a1" ]      #assoc 1
    then
        currentValue=$a1         #we do not want to modify minimum value, so we use temporary variable
        while [ $currentValue -le $a1max ]; do #for every value do
            ./starter_f $currentValue $a2BestValue $s1iBestValue $s1dBestValue $s2BestValue $cBestValue $inst $p $programy & #run simulation

            let currentValue=currentValue*2 #counter
        done
    fi
    if [ "${!i}" = "-a2" ]      #assoc 2
    then
        currentValue=$a2         #we do not want to modify minimum value, so we use temporary variable
        while [ $currentValue -le $a2max ]; do #for every value do
            ./starter_f $a1BestValue $currentValue $s1iBestValue $s1dBestValue $s2BestValue $cBestValue $inst $p $programy  #run simulation

            let currentValue=currentValue*2 #counter
        done
    fi
    if [ "${!i}" = "-s1i" ]         #size 1 instructions
    then
        currentValue=$s1i         #we do not want to modify minimum value, so we use temporary variable
        while [ $currentValue -le $s1imax ]; do #for every value do
            ./starter_f $a1BestValue $a2BestValue $currentValue $s1dBestValue $s2BestValue $cBestValue $inst $p $programy  #run simulation

            let currentValue=currentValue*2 #counter
        done
    fi
    if [ "${!i}" = "-s1d" ]             #size 1 data
    then
        currentValue=$s1d #we do not want to modify minimum value, so we use temporary variable
        while [ $currentValue -le $s1dmax ]; do #for every value do
            ./starter_f $a1BestValue $a2BestValue $s1iBestValue $currentValue $s2BestValue $cBestValue $inst $p $programy  #run simulation

            let currentValue=currentValue*2 #counter
        done
    fi
    if [ "${!i}" = "-s2" ]              #size 2
    then
        currentValue=$s2 #we do not want to modify minimum value, so we use temporary variable
        while [ $currentValue -le $s2max ]; do #for every value do
            ./starter_f $a1BestValue $a2BestValue $s1iBestValue $s1dBestValue $currentValue $cBestValue $inst $p $programy  #run simulation

            let currentValue=currentValue*2 #counter
        done
    fi

done
}
function searchForBest(){
# USE:
# data stored in /wyniki/$folderName/
# OUTPUT:
# best value for selected parameter
# USAGE EXAMPLE:
# searchForBest -a1
# load ipc values from /wyniki/$folderName and search for the most suitable assoc 1 value
for (( i=1; $i <= $#; i++ )) ;
do
    if [ "${!i}" = "-a1" ]
    then
    currentValue=$a1
    oldIPC=0
    echo -------------------------------------------- SEARCHING FOR THE BEST ASSOC 1 VALUE
    while [ $currentValue -le $a1max ]; do #for every value do
        echo ----------------- testing $currentValue / $a1max

        cat wyniki/$folderName/"a1=${currentValue}_a2=${a2BestValue}_L1i=${s1iBestValue}_L1d=${s1dBestValue}_L2=${s2BestValue}_rdzeni=${cBestValue}_instrukcji=${inst}.txt" | awk '/cpu0.ipc_total  / {print $2}' > tmp.txt

        currentIPC=`head --lines 1 tmp.txt` #first line from tmp.txt file contains IPC
        currentIPC=`perl -e "print($maxIpcLength*$currentIPC)";echo`
        echo - oldIPC= $oldIPC
        echo - currentIPC= $currentIPC
        if [ $oldIPC -ge $currentIPC ] #if increase in a1 is not effective enough break loop
        then
            echo ------------------------------- we will not find better value
            break
        fi

        oldIPC=`perl -e "print($parameterIncrease*$currentIPC)";echo` #increase 
        a1BestValue=$currentValue
        let currentValue=currentValue*2 #counter
    done
    echo -------------------------------------------- BEST ASSOC 1 VALUE IS $a1BestValue
    fi
    if [ "${!i}" = "-a2" ]
    then
        currentValue=$a2
        oldIPC=0
        echo -------------------------------------------- SEARCHING FOR THE BEST ASSOC 2 VALUE
        while [ $currentValue -le $a2max ]; do #for every value do
            echo ----------------- testing $currentValue / $a2max

            cat wyniki/$folderName/"a1=${a1BestValue}_a2=${currentValue}_L1i=${s1iBestValue}_L1d=${s1dBestValue}_L2=${s2BestValue}_rdzeni=${cBestValue}_instrukcji=${inst}.txt" | awk '/cpu0.ipc_total  / {print $2}' > tmp.txt

            currentIPC=`head --lines 1 tmp.txt` #first line from tmp.txt file contains IPC
            currentIPC=`perl -e "print($maxIpcLength*$currentIPC)";echo`
            echo - oldIPC= $oldIPC
            echo - currentIPC= $currentIPC
            if [ $oldIPC -ge $currentIPC ] #if increase in a1 is not effective enough break loop
            then
                echo ------------------------------- we will not find better value
                break
            fi

            oldIPC=`perl -e "print($parameterIncrease*$currentIPC)";echo` #increase 
            a2BestValue=$currentValue
            let currentValue=currentValue*2 #counter
        done
        echo -------------------------------------------- BEST ASSOC 2 VALUE IS $a2BestValue
    fi
    if [ "${!i}" = "-s1i" ]
    then
        currentValue=$s1i
        oldIPC=0
        echo -------------------------------------------- SEARCHING FOR THE BEST S1i VALUE
        while [ $currentValue -le $s1imax ]; do #for every value do
            echo ----------------- testing $currentValue / $s1imax

            cat wyniki/$folderName/"a1=${a1BestValue}_a2=${a2BestValue}_L1i=${currentValue}_L1d=${s1dBestValue}_L2=${s2BestValue}_rdzeni=${cBestValue}_instrukcji=${inst}.txt" | awk '/cpu0.ipc_total  / {print $2}' > tmp.txt

            currentIPC=`head --lines 1 tmp.txt` #first line from tmp.txt file contains IPC
            currentIPC=`perl -e "print($maxIpcLength*$currentIPC)";echo`
            echo - oldIPC= $oldIPC
            echo - currentIPC= $currentIPC
            if [ $oldIPC -ge $currentIPC ] #if increase in a1 is not effective enough break loop
            then
                echo ------------------------------- we will not find better value
                break
            fi

            oldIPC=`perl -e "print($parameterIncrease*$currentIPC)";echo` #increase 
            s1iBestValue=$currentValue
            let currentValue=currentValue*2 #counter
        done
        echo -------------------------------------------- BEST s1i VALUE IS $s1iBestValue

    fi

    if [ "${!i}" = "-s1d" ]
    then
        currentValue=$s1d
        oldIPC=0
        echo -------------------------------------------- SEARCHING FOR THE BEST S1d VALUE
        while [ $currentValue -le $s1dmax ]; do #for every value do
            echo ----------------- testing $currentValue / $s1dmax

            cat wyniki/$folderName/"a1=${a1BestValue}_a2=${a2BestValue}_L1i=${s1iBestValue}_L1d=${currentValue}_L2=${s2BestValue}_rdzeni=${cBestValue}_instrukcji=${inst}.txt" | awk '/cpu0.ipc_total  / {print $2}' > tmp.txt

            currentIPC=`head --lines 1 tmp.txt` #first line from tmp.txt file contains IPC
            currentIPC=`perl -e "print($maxIpcLength*$currentIPC)";echo`
            echo - oldIPC= $oldIPC
            echo - currentIPC= $currentIPC
            if [ $oldIPC -ge $currentIPC ] #if increase in a1 is not effective enough break loop
            then
                echo ------------------------------- we will not find better value
                break
            fi

            oldIPC=`perl -e "print($parameterIncrease*$currentIPC)";echo` #increase 
            s1dBestValue=$currentValue
            let currentValue=currentValue*2 #counter
        done
        echo -------------------------------------------- BEST s1d VALUE IS $s1dBestValue

    fi

    if [ "${!i}" = "-s2" ]
    then
        currentValue=$s2
        oldIPC=0
        echo -------------------------------------------- SEARCHING FOR THE BEST S2 VALUE
        while [ $currentValue -le $s2max ]; do #for every value do
            echo ----------------- testing $currentValue / $s2max

            cat wyniki/$folderName/"a1=${a1BestValue}_a2=${a2BestValue}_L1i=${s1iBestValue}_L1d=${s1dBestValue}_L2=${currentValue}_rdzeni=${cBestValue}_instrukcji=${inst}.txt" | awk '/cpu0.ipc_total  / {print $2}' > tmp.txt

            currentIPC=`head --lines 1 tmp.txt` #first line from tmp.txt file contains IPC
            currentIPC=`perl -e "print($maxIpcLength*$currentIPC)";echo`
            echo - oldIPC= $oldIPC
            echo - currentIPC= $currentIPC
            if [ $oldIPC -ge $currentIPC ] #if increase in a1 is not effective enough break loop
            then
                echo ------------------------------- we will not find better value
                break
            fi

            oldIPC=`perl -e "print($parameterIncrease*$currentIPC)";echo` #increase 
            s2BestValue=$currentValue
            let currentValue=currentValue*2 #counter
        done
        echo -------------------------------------------- BEST s2 VALUE IS $s2BestValue

    fi

done

}

# display help
if [ "$1" = "-help" ] ;
then
    cat starterREADME.txt;
fi
# load parameters from file starterconfig.txt
a1=`sed -n 3p starterconfig.txt`	#assoc L1
a1max=`sed -n 18p starterconfig.txt`	#assoc L1max
a2=`sed -n 5p starterconfig.txt` 	#assoc L2
a2max=`sed -n 20p starterconfig.txt` 	#assoc L2max
s1i=`sed -n 7p starterconfig.txt`	#size L1i
s1imax=`sed -n 22p starterconfig.txt`	#size L1i
s1d=`sed -n 9p starterconfig.txt`	#size L1d
s1dmax=`sed -n 24p starterconfig.txt`	#size L1d
s2=`sed -n 11p starterconfig.txt`	#size L2
s2max=`sed -n 26p starterconfig.txt`	#size L2
c=`sed -n 13p starterconfig.txt`	#ilosc rdzeni
cmax=`sed -n 28p starterconfig.txt`	#ilosc rdzeni
inst=`sed -n 15p starterconfig.txt`	#ilosc instrukcji (10^i)
p=0					#ilosc programow
parameterIncrease=`sed -n 31p starterconfig.txt`	#wymagany wzrost
# wczytywanie ewentualnych parametrow
# for wczytuje parametry od pierwszego do
# "$#" co oznacza ilosc parametrow
# i dla kazdego parametru sprawdza ifami czy
# odpowiada parametrom na jakie czeka program.
# W przypadku gdy trafi na taki argument (nr X) to
# bierze argument X+1 i zapisuje jego wartosc do
# odpowiedniej zmiennej (a dokladniej nadpisuje, bo
# wartosc byla poprzednio wczytana z pliku konf)

for (( i=1; $i <= $#; i++ )) ;
do
    if [ "${!i}" = "-a1" ]
    then
        y=$[$i+1]
        a1=${!y}
    fi
    if [ "${!i}" = "-a1max" ]
    then
        y=$[$i+1]
        a1max=${!y}
    fi
    if [ "${!i}" = "-a2" ]
    then
        y=$[$i+1]
        a2=${!y}
    fi
    if [ "${!i}" = "-a2max" ]
    then
        y=$[$i+1]
        a2max=${!y}
    fi
    if [ "${!i}" = "-s1i" ]
    then
        y=$[$i+1]
        s1i=${!y}
    fi
    if [ "${!i}" = "-s1imax" ]
    then
        y=$[$i+1]
        s1imax=${!y}
    fi
    if [ "${!i}" = "-s1d" ]
    then
        y=$[$i+1]
        s1d=${!y}
    fi
    if [ "${!i}" = "-s1dmax" ]
    then
        y=$[$i+1]
        s1dmax=${!y}
    fi
    if [ "${!i}" = "-s2" ]
    then
        y=$[$i+1]
        s2=${!y}
    fi
    if [ "${!i}" = "-s2max" ]
    then
        y=$[$i+1]
        s2max=${!y}
    fi
    if [ "${!i}" = "-c" ]
    then
        y=$[$i+1]
        c=${!y}
    fi
    if [ "${!i}" = "-cmax" ]
    then
        y=$[$i+1]
        cmax=${!y}
    fi
    if [ "${!i}" = "-i" ]
    then
        y=$[$i+1]
        inst=${!y}
    fi
    echo -----------------------------folder $folderName
    # random programs from programList.txt
    if [ "${!i}" = "-r" ]
    then
        programy=""
        folderName="m5_"
        policzIloscProgramow=`wc --lines programList.txt`
        iloscProgramow=`./substr "$policzIloscProgramow" "^" " programList.txt"`
        y=$[$i+1]
        p=${!y}
        for (( z=1; z<=$p; z++ )) ;			
        do
            numerProgramu=$((1+RANDOM%$iloscProgramow))
            nazwaProgramu=`sed -n ${numerProgramu}p programList.txt`
            programy="$programy $nazwaProgramu"
            folderName="$folderName$nazwaProgramu"
        done
        echo folder to $folderName
    fi
    # w przypadku parametru "-p" oznaczajacego programy do uruchomienia
    # brany jest nastepny argument mowiacy ile programow bedzie podanych (X)
    # a nastepnie branych jest X kolejnych argumentow oddzielonych spacja
    # do zmiennej napisowej programy, ktora potem wstawiona bedzie bezposrednio
    # do polecenia run_many.py (ale poprzez skrypt pomocniczy starter_f, ktory
    # zmienia odpowiednio pliki konfiguracyjne dla skryptu run_many.py
    if [ "${!i}" = "-p" ]
    then
        programy=""
        folderName="m5_"
        y=$[$i+1]
        p=${!y}

        for (( z=$[$y+1]; $z <= ($[$y+1+$p]); z++ )) ;			
        do
            programy="$programy ${!z}"
            folderName="$folderName${!z}"
        done
    fi
done

mkdir --parents wyniki/$folderName/

# Compute medium values
########################################
a1MediumValue=$a1
a2MediumValue=$a2
s1iMediumValue=$s1i
s1dMediumValue=$sid
s2MediumValue=$s2
cMediumValue=$c


mediumValue $a1 $a1max
a1MediumValue=$returnMediumValue
mediumValue $a2 $a2max
a2MediumValue=$returnMediumValue
mediumValue $s1i $s1imax
s1iMediumValue=$returnMediumValue
mediumValue $s1d $s1dmax
s1dMediumValue=$returnMediumValue
mediumValue $s2 $s2max
s2MediumValue=$returnMediumValue
mediumValue $c $cmax
cMediumValue=$returnMediumValue

# Search for best values
##################################################

#initial values and constants
a1BestValue=$a1MediumValue
a2BestValue=$a2MediumValue
s1iBestValue=$s1iMediumValue
s1dBestValue=$s1dMediumValue
s2BestValue=$s2MediumValue
cBestValue=$cMediumValue
#magic constant - ipc values are float numbers. If you multiply ipc by maxIpcLength you have integer
maxIpcLength=100000000      


# MAIN PART OF PROGRAM - you can modify this part, and it will not destroy the program :)
runSimulationsFor -a1
wait
searchForBest -a1

runSimulationsFor -a2
wait
searchForBest -a2

runSimulationsFor -s1i
wait
searchForBest -s1i

runSimulationsFor -s1d
wait
searchForBest -s1d

runSimulationsFor -s2
wait
searchForBest -s2
