sudo apt -y install neofetch
sudo apt -y install youtube-dl
sudo apt -y install ffmpeg
sudo apt -y install aplay
echo 'Enter a youtube link to a sound file to play.'
read ytlink
youtube-dl $ytlink -o nicesounds
ffmpeg -i "nicesounds.mkv" -vn -ar 44100 -ac 2 -ab 128k -f mp3 "nicesounds.mp3"
echo
echo
echo
echo
echo 'Really really good script please believe'
function ts()
{
  date=$((`date +%s` + $1));
  while [ "$date" -ne `date +%s` ]; do
    echo -ne "  $(date -u --date @$(($date - `date +%s`)) +%H:%M:%S)\r";
    sleep 1
  done
  play_sound ~/nicesounds.mp3
#thanks to this tutorial for the timer https://johnjago.com/blog/timer/
}
function play_sound()
{
  cat $1 | aplay
}
neofetchrun() {
clear
neofetch
ts 5
neofetchrun
}
neofetchrun
