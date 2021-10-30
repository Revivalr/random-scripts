#!/bin/bash
sudo apt -y install youtube-dl
sudo apt -y install ffmpeg
askagain() {
echo 'Would you like to download another video/playlist?
Yes or No'
read downloadagain
if [ $downloadagain == yes ] || [ $downloadagain == yea ] || [ $downloadagain  == y ]
then
   echo 'Restarting'
elif [ $downloadagain == no ] || [ $downloadagain == n ]
then
   exit
else
   echo 'Please enter a valid answer.'
   askagain
fi
}
main() {
echo 'What YouTube video/playlist do you want to download?'
read download
echo 'What do you want to call the file?'
read filename
youtube-dl $download -o $filename.mkv
}
main
convert() {
echo 'Do you want to convert the video into an mp3?
Yes or No'
read convert
if [ $convert == yes ] || [ $convert == yea ] || [ $convert == y ]
then
   echo 'What would you like to call the audio file?'
   read audioname
   ffmpeg -i "$filename.mkv" -vn -ar 44100 -ac 2 -ab 128k -f mp3 "$audioname.mp3"
elif [ $convert == no ] || [ $convert == n]
then
   exit
else
   echo 'Please enter a valid answer.'
   convert
fi
}
convert
deleteoriginal() {
   echo 'Do you want to delete the original video file?
Yes or No'
   read deleteoriginal
   if [ $deleteoriginal == yes ] || [ $deleteoriginal == yea ] || [ $deleteforiginal == y ]
   then
      rm $filename.mkv
      echo 'Original file deleted'
      askagain
         elif [ $deleteoriginal == no ] || [ $deleteoriginal == n ]
   then
      askagain
   else
      deleteoriginal
   fi
}
deleteoriginal
