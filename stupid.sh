winesetup() {
sudo apt-remove -t winehq-stable
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main' 
sudo apt update
}
maninstall() {
wineask() {
echo 'Would you like to install Wine Stable(Recommended), Wine Development, or Wine Staging?
0) Wine Stable
1) Wine Development
2) Wine Staging'
read wineversion
if [ $wineversion == 0 ]
then
echo 'Installing Wine Stable'
winesetup
sudo apt install --install-recommends winehq-stable
elif [ $wineversion == 1 ]
then
echo 'Installing Wine Development'
winesetup
sudo apt install --install-recommends winehq-devel
elif [ $wineversion == 2 ]
then
echo 'Installing Wine Staging'
winesetup
sudo apt install --install-recommends winehq-staging
else
echo 'Please enter a valid answer'
wineask
fi
}
wineask
echo 'Installing Gamemode'
sudo apt -y install gamemode
echo 'Installing Steam'
sudo apt -y install steam
gamehub() {
echo 'Would you like to install Gamehub to organize all of your games and game launchers into one place?
Yes or No'
read gamehubinstall
if [ $gamehubinstall == yes ] || [ $gamehubinstall == y ]
then
echo 'Installing Gamehub'
elif [ $gamehubinstall == no ] || [ $gamehubinstall n ]
then
echo 'Skipping Gamehub install'
else
gamehub
fi
}
gamehub
installgamehub() {
sudo apt install --no-install-recommends software-properties-common
sudo add-apt-repository ppa:tkashkin/gamehub
sudo apt update
sudo apt install com.github.tkashkin.gamehub
}
gamehub
lutris() {
echo 'Would you like to install Lutris to help add support for more games?
Yes or No'
read lutrisinstall
if [ $lutrisinstall == yes ] || [ $lutrisinstall == y ]
then
lutrisinstall
elif [ $lutrisinstall == no ] || [ $lutrisinstall n ]
then
echo 'Skipping Lutris install'
else
echo 'Please enter a valid response'
lutris
fi
}
installlutris() {
echo 'Installing Lutris'
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt -y install lutris
}
lutris
}


autoinstall() {
echo; echo; echo; echo 'Installing wine'; echo; echo; echo
winesetup
sudo apt -y install --install-recommends winehq-stable
echo; echo; echo; echo 'Installing Gamemode'; echo; echo; echo
sudo apt -y install gamemode
echo; echo; echo; echo 'Installing Steam'; echo; echo; echo
sudo apt -y install steam
installgamehub
echo; echo; echo; echo 'Installing Lutris'; echo; echo; echo
lutris
dailyask() {
echo 'Would you like to download daily use apps?'; echo 'Yes or No'
read dailyuse
if [ $dailyuse == yes ] || [ $dailyuse == y ]
then
echo; echo; echo; echo 'Installing Tor'; echo; echo; echo
sudo apt -y install tor
echo; echo; echo; echo 'Installing Snap'; echo; echo; echo
sudo apt -y install snapd
sudo snap install snap-store
echo; echo; echo; echo 'Installing Neofetch'; echo; echo; echo
sudo apt -y install neofetch
echo; echo; echo; echo 'Installing Spotify'; echo; echo; echo
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
echo; echo; echo; echo 'Installing CMatrix'; echo; echo; echo
sudo apt -y install cmatrix
echo; echo; echo; echo 'Installing VLC'; echo; echo; echo
sudo apt -y install vlc
echo; echo; echo; echo 'Installing MakeMKV'; echo; echo; echo
sudo snap install makemkv
echo; echo; echo; echo 'Installing Git'; echo; echo; echo
sudo apt -y install git
echo; echo; echo; echo 'Installing Doomsday Engine'; echo; echo; echo
sudo add-apt-repository -y ppa:sjke/doomsday
sudo apt-get update
sudo apt -y install doomsday
echo; echo; echo; echo 'Downloading Doom'; echo; echo; echo
echo 'Installing unzip to unzip the package'
sudo apt -y install unzip
sudo apt -y install p7ip
echo 'Installing aria2c for faster downloads'
sudo apt -y install aria2c
cd Documents
mkdir Doom
cd Doom
echo 'Downloading the games'
aria2c https://file.io/ku0GVczTEAkB
echo 'Unpacking the package'
7za e doom.7z
echo 'Deleting Doom zip'
rm doom.7z
cd ../
cd ../
echo; echo; echo; echo 'Installing Youtube-dl'; echo; echo; echo
sudo apt -y install youtube-dl
echo; echo; echo; echo 'Installing Youtube-dl GUI'; echo; echo; echo
sudo snap install gydl
echo; echo; echo; echo 'Installing Retroarch'; echo; echo; echo
sudo apt -y install retroarch
echo; echo; echo; echo 'Installing MPV'; echo; echo; echo
sudo apt -y install mpv
echo; echo; echo; echo 'Installing FFMPEG'; echo; echo; echo
sudo apt -y install ffmpeg
echo; echo; echo; echo 'Installing Audacity'; echo; echo; echo
sudo apt -y install audacity
echo; echo; echo; echo 'Installing Clementine'; echo; echo; echo
sudo apt -y install clementine
echo; echo; echo; echo 'Installing Vim'; echo; echo; echo
sudo apt -y install vim
echo; echo; echo; echo 'Installing Nano'; echo; echo; echo
sudo apt -y install nano
echo; echo; echo; echo 'Installing Stellarium'; echo; echo; echo
sudo snap install stellarium-plars
echo; echo; echo; echo 'Installing Discord'; echo; echo; echo
sudo apt -y install discord
echo; echo; echo; echo 'Installing Deluge'; echo; echo; echo
sudo apt -y install deluge
echo; echo; echo; echo 'Downloading RetroArch Games'; echo; echo; echo
cd Documents
mkdir Retroarch
cd Retroarch
echo 'Downloading Atari 2600'
curl --header 'Host: ia801409.us.archive.org' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://archive.org/download/no-intro_romsets/no-intro%20romsets/' --cookie 'donation-identifier=993d484b0edc39d511dc5c4fd130271d; abtest-identifier=78e035a4fa1a68714b3ee301e085473f; collections=atari_2600_library%2Csega_genesis_library%2Cconsolelivingroom; test-cookie=1; G_ENABLED_IDPS=google; logged-in-sig=1667870714%201636334714%20wd9SjzMASOL%2BW3MVkZ3JYoQXOiRw%2BGObsF3HbT%2BS74VXBY5fY8kXq2BOVKv%2B5nIqPfcUkjpBUGkzXek%2FhfI594%2BgnPcnntR22ZBu8Oi%2FQ3UI4sJ7sWG5NLKOIjDz7XGCYHZojhyOJzM5ibvO1kNgXTiXEiWn0ybyiRPnc8Yv4hw%3D; logged-in-user=legitnoname420%40gmail.com; http-editor-v3=high-bid-bg-dodson-pepsi-invaders-hack; PHPSESSID=ur7vs7b43e1tk4ghca8idiqr2n' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: document' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: same-site' --header 'Sec-Fetch-User: ?1' 'https://ia801409.us.archive.org/28/items/no-intro_romsets/no-intro%20romsets/Atari%20-%202600%20%2820211016-205407%29.zip' --output 'Atari - 2600 (20211016-205407).zip'
unzip 'Atari - 2600 (20211016-205407).zip'
echo 'Downloading NES'
curl --header 'Host: ia801409.us.archive.org' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://archive.org/download/no-intro_romsets/no-intro%20romsets/' --cookie 'donation-identifier=993d484b0edc39d511dc5c4fd130271d; abtest-identifier=78e035a4fa1a68714b3ee301e085473f; collections=atari_2600_library%2Csega_genesis_library%2Cconsolelivingroom; test-cookie=1; G_ENABLED_IDPS=google; logged-in-sig=1667870714%201636334714%20wd9SjzMASOL%2BW3MVkZ3JYoQXOiRw%2BGObsF3HbT%2BS74VXBY5fY8kXq2BOVKv%2B5nIqPfcUkjpBUGkzXek%2FhfI594%2BgnPcnntR22ZBu8Oi%2FQ3UI4sJ7sWG5NLKOIjDz7XGCYHZojhyOJzM5ibvO1kNgXTiXEiWn0ybyiRPnc8Yv4hw%3D; logged-in-user=legitnoname420%40gmail.com; http-editor-v3=high-bid-bg-dodson-pepsi-invaders-hack; PHPSESSID=ur7vs7b43e1tk4ghca8idiqr2n' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: document' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: same-site' --header 'Sec-Fetch-User: ?1' 'https://ia801409.us.archive.org/28/items/no-intro_romsets/no-intro%20romsets/Nintendo%20-%20Nintendo%20Entertainment%20System%20%2820211105-102659%29%20%5Bheadered_NES2.0%5D.zip' --output 'Nintendo - Nintendo Entertainment System (20211105-102659) [headered_NES2.0].zip'
unzip 'Nintendo - Nintendo Entertainment System (20211105-102659) [headered_NES2.0].zip'
echo 'Downloading Other games'
curl --header 'Host: doc-14-5k-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Alt-Used: doc-14-5k-docs.googleusercontent.com' --cookie 'AUTH_2lqf6c8kihn7steaib5ojhc4oagkvjqf_nonce=9aq4cfjulijqs' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: iframe' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' 'https://doc-14-5k-docs.googleusercontent.com/docs/securesc/lgc9g2nk7uoqpfcs019ssr1ftbpt2k5b/nos4tu6ervme1leprgbvp914o6m5hi8q/1636421400000/11993947310119211391/11993947310119211391/1c_IAS5WQU9GNyw9bx2ipYcRqObiy1X87?e=download&authuser=0&nonce=9aq4cfjulijqs&user=11993947310119211391&hash=5ntao0vsh2cg2fnbrs5gdqig1nj64n9h' --output 'Super Mario All-Stars (USA).sfc'
curl --header 'Host: doc-0o-5k-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --cookie 'AUTH_2lqf6c8kihn7steaib5ojhc4oagkvjqf=11993947310119211391|1636421850000|ckqr6cr4abflp6ii3gdfmqvqg8iov668' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: iframe' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' 'https://doc-0o-5k-docs.googleusercontent.com/docs/securesc/lgc9g2nk7uoqpfcs019ssr1ftbpt2k5b/3sv6c8192qo70nhn2ctkoae8pv83m6kk/1636421850000/11993947310119211391/11993947310119211391/19djqA7qrNGnYm2Wtwl2QaGDmtgH5kfs3?e=download&authuser=0' --output 'Super Mario World (USA).sfc'
curl --header 'Host: doc-14-5k-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Alt-Used: doc-14-5k-docs.googleusercontent.com' --cookie 'AUTH_2lqf6c8kihn7steaib5ojhc4oagkvjqf=11993947310119211391|1636421850000|ckqr6cr4abflp6ii3gdfmqvqg8iov668' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: iframe' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' 'https://doc-14-5k-docs.googleusercontent.com/docs/securesc/lgc9g2nk7uoqpfcs019ssr1ftbpt2k5b/n65o56nop82d3iu4gspj7dp4e6098qqg/1636421925000/11993947310119211391/11993947310119211391/1-dc1ZMqKhiYa2e_n4Y6IWgD48w77Q5pO?e=download&authuser=0' --output 'Sonic The Hedgehog (USA, Europe).zip'
curl --header 'Host: doc-04-5k-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --cookie 'AUTH_2lqf6c8kihn7steaib5ojhc4oagkvjqf=11993947310119211391|1636421850000|ckqr6cr4abflp6ii3gdfmqvqg8iov668' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: iframe' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' 'https://doc-04-5k-docs.googleusercontent.com/docs/securesc/lgc9g2nk7uoqpfcs019ssr1ftbpt2k5b/o8inej4i28pd93d5inmmtplajcvujjqt/1636421925000/11993947310119211391/11993947310119211391/1d7PYhh8r0NjPZNaLOJzDEDHURSXTpH-p?e=download&authuser=0' --output 'Sonic The Hedgehog 2 (World) (Rev B).zip'
curl --header 'Host: doc-14-5k-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Alt-Used: doc-14-5k-docs.googleusercontent.com' --cookie 'AUTH_2lqf6c8kihn7steaib5ojhc4oagkvjqf=11993947310119211391|1636421850000|ckqr6cr4abflp6ii3gdfmqvqg8iov668' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: iframe' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: cross-site' 'https://doc-14-5k-docs.googleusercontent.com/docs/securesc/lgc9g2nk7uoqpfcs019ssr1ftbpt2k5b/bebmdn2f8lrumgg4q8neeat89uup8ci0/1636421925000/11993947310119211391/11993947310119211391/15yikvgsxLJCHApJetZ9rmo3T_fYIJaYr?e=download&authuser=0' --output 'Sonic & Knuckles + Sonic The Hedgehog 3 (USA).zip'
cd ../
cd ../
echo; echo; echo; echo 'Finished Installing'; echo; echo; echo
elif [ $dailyuse == no ] || [ $dailyuse == n ]
then
exit
else
echo; echo 'Please enter a valid answer'; echo
dailyask
fi
}
dailyask
}

echo 'Would you like to auto install everything or chose what to install?
0) Install Everything
1) Choose what to install'
read autoinstall
if [ $autoinstall == 0 ]
then
autoinstall
else
echo 'Starting install'
fi



echo; echo; echo; echo; echo 'First thing you need to do is enable Proton for all games in steam. Navigate to Steam / Settings / Steam Play / Advanced and tick the Enable Steam Play for all other titles, and restart to apply this setting.'; echo; echo; echo 'Now you will need to enable Gamemode for some games. To enable Gamemode for a game, click on the Properties of a game, navigate to SET LAUNCH OPTIONS and type in gamemoderun %command%.'; echo; echo; echo 'To enable it to work with Gamemode, then navigate to Preferences / System options / Command prefix and type in gamemoderun, and once done, click Save.'; echo; echo; echo 'For more information please visit the video link below.'; echo 'https://www.youtube.com/watch?v=AALbVdB9VOU'; echo; echo; echo 'Doomsday Engine needs to be setup. Set the games folder to Doom. This folder can be found in the Documents folder.'; echo; echo; echo 'Please ask Rockpods#0280 on Discord how to can a directory in Retroarch or search it in a search engine. This is how you add the games for Retroarch.'