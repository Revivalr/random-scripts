sudo apt -y install youtube-dl ffmpeg
sudo pacman -S youtube-dl ffmpeg

main() {

echo 'What youtube video/playlist do you want to download?'

read ytlink

echo 'What do you want to call the file?'

read ytfile

youtube-dl -o '$ytfile' $ytlink
}

ytmp3() {

echo 'Do you want to convert the youtube video to an mp3?

Yes or No'

read ytmp3

if [ $ytmp3 == yes ] || [ $ytmp3 == yea ] || [ $ytmp3 == y ]
then
   echo 'What do you want to call the converted file?'
   read ytmp3file
   ffmpeg -i $ytfile.mkv -vn -acodec copy $ytmp3file.mp3
   echo 'Conversion finished'
elif [ $ytmp3 == no ] || [ $ytmp3 == n ]
then
   echo 'You are good for not trying to pirate music.'
else
   echo 'WHY... WHY... Just type in a valid response.'
   ytmp3
fi
}

ytagainish() {
   echo
   echo 'Do you want convert another video/playlist?

Yes or No'
   read ytagain
   if [ $ytagain == yes ] || [ $ytagain == yea ] || [ $ytagain == y ]
   then
      echo 'If I fucking exit my nano again trying to redo I am going to lose it.'
      main
   elif [ $ytagain == no ] || [ $ytagain == n ]
   then
      echo 'Fuck you I hate nano but I am too lazy to change so I will just not change this. But still call the U-Haul CEO for any questions.'
   else
      echo 'Just enter a valid response and make sure to buy roblox stock.'
      echo 'I swear its a better investment than the arch linux neofetch shirt you bought.

- This is not legal advice.'
      ytagainsh
   fi
}
main
ytmp3
ytagainish
