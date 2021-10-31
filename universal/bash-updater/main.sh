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
  $restartcommand
elif [ $servermd5error == 1 ] || [ $servermd5error == skip ]
then
  echo 'Skipping update'
  exit
else
  echo 'Please enter a valid response.'
  error
fi
}



update() {
echo 'Downloading update script'
curl (UPDATE SCRIPT RAW) --output updatescript.sh &>> updatecheck.txt
curl UPDATE SCRIPT RAW) --output updatescript1.sh &>> updatecheck.txt
curl UPDATE SCRIPT RAW) --output updatescript2.sh &>> updatecheck.txt
echo 'Verifying updater'
md5update1=$(md5sum updatescript.sh | cut -d ' ' -f 1)
md5update2=$(md5sum updatescript1.sh | cut -d ' ' -f 1)
md5update3=$(md5sum updatescript2.sh | cut -d ' ' -f 1)
if [ $md5update1 == $md5update2 ]
then
  if [ $md5update2 == $md5update3 ]
  then
    echo 'Update script verified. Starting installation.'
    bash updatescript.sh
    return [n]
    echo '!!!You should never see this!!! If you do press ctrl+c to exit the program and then retry. If this is your third time seeing this please submit a bug report to the Bitbucket.'
  else
    errorblank='Unable to verify update script. This can normally be fixed by retrying the download.'
    restartcommand=update
    error
  fi
else
  errorblank='Unable to verify update script. This can normally be fixed by retrying the download.'
  restartcommand=update
  error
fi
}




md5update() {
echo "Would you like to install the new update?

Yes or No"
 
read updates

if [ $updates == yes ] || [ $updates == y ]
then
  echo "
Redownloading the script.
  "
  echo
  echo 'Deleting old update scripts.'
  echo
  rm updatescript.sh &>> updateremove.txt
  rm updatescript1.sh &>> updateremove.txt
  rm updatescript2.sh &>> updateremove.txt
  rm updatescript3.sh &>> updateremove.txt
  rm updatescript4.sh &>> updateremove.txt
  rm md5server.sh &>> updateremove.txt
  rm md5servercheck.sh &>> updateremove.txt
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
    echo 'Generating md5 checksum for the script on Bitbucket.'
    echo
    curl (RAW MAIN SCRIPT FILE) --output md5server.sh &>> updatecheck.txt
    md5server=$(md5sum md5server.sh | cut -d ' ' -f 1)
    curl (RAW MAIN SCRIPT FILE) --output md5servercheck.sh &>> updatecheck.txt
    md5servercheck=$(md5sum md5servercheck.sh | cut -d ' ' -f 1)
    echo 'Verifying the md5 checksum for the script on Bitbucket.'
    if [ $md5server == $md5servercheck ]
    then
      echo
      echo 'The checksum for the Bitbucket script has been verified.'
      echo
      update
    else
      errorblank='The checksum for the Bitbucket script has not been verified.'
      restartcommand=md5update
      error
    fi
  else
    errorblank='There was a problem with the md5 checksum generated to tell ig there was an update.'
    restartcommand=md5update
    error
  fi
fi
}





md5local=$(md5sum main.sh | cut -d ' ' -f 1)
md5localcheck=$(md5sum main.sh | cut -d ' ' -f 1)
rm md5server.sh &>> updateremove.txt
curl (RAW MAIN SCRIPT FILE) --output md5server.sh &>> updatecheck.txt
md5server=$(md5sum md5server.sh | cut -d ' ' -f 1)
rm md5servercheck.sh &>> updateremove.txt
curl (RAW MAIN SCRIPT FILE) --output md5servercheck.sh &>> updatecheck.txt
md5servercheck=$(md5sum md5servercheck.sh | cut -d ' ' -f 1)
if [ $md5local == $md5localcheck ]
then
  if [ $md5server == $md5servercheck ]
  then
    if [ $md5local != $md5server ]
    then
      md5update
    else
      echo 'No update available'
    fi
  else
    echo 'Update check failed'
    #return[n]
    exit
  fi
else
  #return[n]
  exit
fi
