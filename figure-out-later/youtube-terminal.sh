sudo apt install mplayer ffmpeg youtube-dl
echo 'What is the name of the file you want to watch? Please include the file extension.'
read iamjudgingyoureverymove
mplayer -vo  caca -loop 0 $iamjudgingyoureverymove
