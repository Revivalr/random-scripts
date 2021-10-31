rm updatescripterror.txt &>> updatecheck.txt
echo
echo 'Downloading updated script'
echo
update() {
curl (RAW MAIN SCRIPT FILE) --output mainupdate.sh &>> updatescripterror.txt
md5update=$(md5sum mainupdate.sh | cut -d ' ' -f 1)
curl (RAW MAIN SCRIPT FILE) --output mainupdatecheck.sh &>> updatescripterror.txt
md5update1=$(md5sum mainupdatecheck.sh | cut -d ' ' -f 1)
curl (RAW MAIN SCRIPT FILE) --output mainupdatedoublecheck.sh &>> updatescripterror.txt
md5update2=$(md5sum mainupdatedoublecheck.sh | cut -d ' ' -f 1)
echo
echo 'Verifying integrity of update.' 
echo
if [ $md5update == $md5update1 ]
then
    if [ $md5update1 == $md5update2 ]
    then
        echo
        echo 'Integrity of update has been verified.'
        echo
    else
        echo
        echo "!!!READ!!! There has been an error making it so that the update can not be verified. This is usually just a corrupted download which can be fixed by restarting which will redownload the update.
        
If you keep getting errors if it probably a problem with the updater. This can be fixed by manually download the new version from Bitbucket. To manually update type in 'curl (RAW MAIN SCRIPT FILE) --output main.sh' in the terminal. Once that is finished open it using by typing 'bash main.sh'"
        echo
        echo
        echo 'Would you like to restart the update or cancel it?
    0) Restart
    1) Cancel'
        read download1
        if [ $download1 == 0 ] || [ $download1 == restart ]
        then
            echo 'Restarting update'
            update
        else
            echo 'Are you sure you want to cancel the update?
            
Yes or No'
            read downloadverify2
            if [ $downloadverify2 == yes ] || [ $downloadverify2 == y] || [ $downloadverify2 == yea ]
            then
                echo 'Canceling update'
                rm mainupdate.sh
                rm mainupdatecheck.sh
                rm mainupdatedoublecheck.sh
                rm updatescript.sh
            else
                echo 'Would you like to restart the update?
                
                Yes or No'
                read downloadverify3
                if [ $downloadverify3 == yes ] || [ $downloadverify3 == y ] || [ $downloadveryify3 == yea ]
                then 
                    echo 'Restarting the update'
                else
                    echo 'Undoing anything done during the update.'
                    rm mainupdate.sh
                    rm mainupdatecheck.sh
                    rm mainupdatedoublecheck.sh
                    rm updatescript.sh
                fi
            fi
        fi
    fi
else
    echo
    echo "!!!READ!!! There has been an error making it so that the update can not be verified. This is usually just a corrupted download which can be fixed by restarting which will redownload the update.
        
If you keep getting errors if it probably a problem with the updater. This can be fixed by manually download the new version from Bitbucket. To manually update type in 'curl (RAW MAIN SCRIPT FILE) --output main.sh' in the terminal. Once that is finished open it using by typing 'bash main.sh'"
    echo 'Would you like to restart the update or cancel it?
0) Restart
1) Cancel'
    read download
    if [ $download == 0 ] || [ $download == restart ]
    then
        echo 'Restarting update'
        update
    else
        echo 'Are you sure you want to cancel the update?
        
Yes or No'
        read downloadverify
        if [ $downloadverify == yes ] || [ $downloadverify == y] || [ $downloadverify == yea ]
        then
            echo 'Canceling update'
            exit
        else
            echo 'Would you like to restart the update?
            
            Yes or No'
            read downloadverify1
            if [ $downloadverify1 == yes ] || [ $downloadverify1 == y ] || [ $downloadveryify1 == yea ]
            then 
                echo 'Restarting the update'
            else
                echo 'Undoing anything done during the update.'
                rm mainupdate.sh
                rm mainupdatecheck.sh
                rm mainupdatedoublecheck.sh
            fi
        fi
    fi
fi
}
update
echo 'Deleting the original script.'
rm main.sh
echo 'Moving the updated script to the place where the original script was.'
mv mainupdate.sh main.sh
verifyfinal=$(md5sum main.sh | cut -d ' ' -f 1)
echo 'Verifying that everything has worked properly.'
if [ $verifyfinal == $md5update == $md5update1 == $md5update2 ]
then
    echo 'Everything has worked properly and there are no errors'
else
    echo
    echo "!!!READ!!! There has been an error making it so that the update can not be verified. This is usually just a corrupted download which can be fixed by restarting which will redownload the update.
        
If you keep getting errors if it probably a problem with the updater. This can be fixed by manually download the new version from Bitbucket. To manually update type in 'curl (RAW MAIN SCRIPT FILE) --output main.sh' in the terminal. Once that is finished open it using by typing 'bash main.sh'"
    echo 'Would you like to restart the update or cancel it?
    0) Restart
    1) Cancel'
    read download4
    if [ $download4 == 0 ] || [ $download4 == restart ]
    then
        echo 'Restarting update'
        update
    else
        echo 'Are you sure you want to cancel the update?
            
Yes or No'
        read downloadverify5
        if [ $downloadverify5 == yes ] || [ $downloadverify5 == y] || [ $downloadverify5 == yea ]
        then
            echo 'Canceling update'
            rm mainupdate.sh
            rm mainupdatecheck.sh
            rm mainupdatedoublecheck.sh
            rm main.sh
            exit
        else
            echo 'Would you like to restart the update?
              
Yes or No'
            read downloadverify6
            if [ $downloadverify6 == yes ] || [ $downloadverify6 == y ] || [ $downloadveryify6 == yea ]
            then 
                echo 'Restarting the update'
            else
                echo 'Undoing anything done during the update.'
                rm mainupdate.sh
                rm mainupdatecheck.sh
                rm mainupdatedoublecheck.sh
                exit
            fi
        fi
    fi
fi
echo 'Opening script'
bash main.sh
exit 1
echo '!!!You should never see this!!! If you do press ctrl+c to exit the program and then retry. If this is your third time seeing this please submit a bug report to the Bitbucket.'
