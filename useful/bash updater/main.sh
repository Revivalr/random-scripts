md5local=$(md5sum main.sh | cut -d ' ' -f 1)
md5localcheck=$(md5sum main.sh | cut -d ' ' -f 1)
rm md5server.sh
#example
#curl https://raw.githubusercontent.com/Revivalr/random-scripts/main/useful/bash%20updater/main.sh --output main.sh
curl (ENTER RAW VERSION OF SCRIPT HERE) --output (output).sh
md5server=md5sum | cut -d ' ' -f 1
rm md5servercheck.sh
curl (ENTER RAW VERSION OF SCRIPT HERE) --output (output).sh
md5servercheck=md5sum | cut -d ' ' -f 1
if [ $md5local == $md5localcheck ]
then
  
else
    echo 'Error'
fi

echo "Do you need to update

Yes or No"
 
read update

if [ $update == yes ]
then
  md5update() {
      echo "
Redownloading the script.
  "
    echo
    echo 'Deleting old update scripts.'
    echo
    rm updatescript.sh
    rm updatescript1.sh
    rm updatescript2.sh
    rm updatescript3.sh
    rm updatescript4.sh
    rm md5server.sh
    rm md5servercheck.sh
    echo
    echo
    echo 'Finished deleting old update scripts.'
    echo
    echo
    echo 'Generating md5 checksum for installed script.'
    echo
    md5local=$(md5sum main.sh | cut -d ' ' -f 1)
    md5localcheck=$(md5sum main.sh | cut -d ' ' -f 1)
    echo
    echo 'Verifying the md5 checksum for the installed script.'
    echo
    if [ $md5local == $md5localcheck ]
    then
      echo
      echo 'The checksum for the installed script has been verified.'
      echo
    else
      errorblank='There was a problem with the md5 checksum generated to tell ig there was an update.'
      functionpass=md5update
      error
    echo
    echo 'Generating md5 checksum for the script on Bitbucket.'
    echo
    curl (ENTER RAW VERSION OF SCRIPT HERE) --output (output).sh
    md5server=md5sum | cut -d ' ' -f 1
    curl (ENTER RAW VERSION OF SCRIPT HERE) --output (output).sh
    md5servercheck=md5sum | cut -d ' ' -f 1
    echo 'Verifying the md5 checksum for the script on Bitbucket.'
    if [ $md5server == $md5servercheck ]
    then
      echo
      echo 'The checksum for the Bitbucket script has been verified.'
      echo
    else
      errorblank='The checksum for the Bitbucket script has not been verified.'
      functionpass=md5update
      error
    fi
    updatescript() {
    echo 'Downloading update script'
   #example
   #curl https://raw.githubusercontent.com/Revivalr/random-scripts/main/useful/bash%20updater/scriptupdater.sh --output updatescript.sh
   #curl https://raw.githubusercontent.com/Revivalr/random-scripts/main/useful/bash%20updater/scriptupdater.sh --output updatescript1.sh
   #curl https://raw.githubusercontent.com/Revivalr/random-scripts/main/useful/bash%20updater/scriptupdater.sh --output updatescript2.sh
    curl (ENTER RAW UPDATE SCRIPT LINK HERE) --output (OUTPUT).sh
    curl (ENTER RAW UPDATE SCRIPT LINK HERE) --output (OUTPUT).sh
    curl (ENTER RAW UPDATE SCRIPT LINK HERE) --output (OUTPUT).sh
    echo 'Verifying updater'
    md5update1=$(md5sum updatescript.sh | cut -d ' ' -f 1)
    md5update2=$(md5sum updatescript1.sh | cut -d ' ' -f 1)
    md5update3=$(md5sum updatescript2.sh | cut -d ' ' -f 1)
    echo $md5update5
    if [ $md5update1 == $md5update2 ]
    then
      if [ $md5update2 == $md5update3 ]
      then
        echo 'Updater verified'
       else
       errorblank='The md5 hashes do not match'
       functionpass=updatescript
       error
       fi
    else
      errorblank='The md5 hashes do not match'
      functionpass=updatescript
      error
    fi
}
updatescript
}


error() {
      echo
      echo '$errorblank'
      echo
      echo "


!!!READ!!! There has been an error somewhere in the program."
      echo "Would you like to retry or skip updating?
0) Retry
1) Skip"
      read servermd5error
      if [ $servermd5error == 0 ] || [ $servermd5error == retry ]
      then
        echo 'Retrying the update'
        $functionpass
      else
        echo 'Skipping update'
      fi
    return [n]
}
md5update
  echo "
Opening update script
"
  bash updatescript.sh
  exit
  echo '!!!You should never see this!!! If you do press ctrl+c to exit the program and then retry. If this is your third time seeing this please submit a bug report to the Bitbucket.'
fi
echo
