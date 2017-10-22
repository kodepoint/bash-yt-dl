#!/bin/bash
loc=$2
#cd "$loc"

echo "The file will be saved to $loc"
echo 
echo -n "Forward? y/n: "
read yourinput
if [ "$yourinput" == 'n' ] 
then 
    echo "Exiting..."
    exit 1
fi

for lines in $(cat "$1")
do  
    echo "Downloading: $lines"
    #>/dev/null 2>&1
    youtube-dl -f best -o "$loc%(title)s" $lines 
    if [ $? -ne 0 ]
    then
        echo "There is something wrong when downloading!!! Exiting..."
        exit 1
    fi
        
done

echo

echo "Download Finished! The Files saved to $loc"
echo 
