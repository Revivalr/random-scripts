num='^[0-9]+$'
gitstall() {
echo 'Installing git'; echo
sudo apt install git
}
nodestall() {
echo 'Installing Node.js'; echo
sudo apt install nodejs
sudo apt install npm
}
uppackage() {
sudo apt update
}
vanadium() {
echo 'Installing Vanadium'; echo
uppackage
gitstall
nodestall
git clone https://github.com/titaniumnetwork-dev/Vanadium
cd Vanadium
npm install
npm start
}
holyub() {
echo 'Installing Holy Unblocker'
uppackage
gitstall
nodestall
git clone https://github.com/QuiteAFancyEmerald/HolyUnblockerPublic.git
cd HolyUnblockerPublic
npm install
npm start
port() {
echo 'What port do you want to use? Recomended port is 8080.'
read port
if [ $port == num ]
then
awk 'NR==2 {$0="    "port": "$port""} 1' config.json
else
echo 'Please enter a valid port'
port
fi
}
}
degeneracy() {
echo 'Installing Degeneracy'
}
incognito() {
echo 'Installing Incognito'
}
reborn() {
echo 'Installing Reborn'
}
sysya() {
echo 'Installing Sysya++'
}
tsunami() {
echo 'Installing Tsunami'
}
ask() {
echo 'What proxy site do you want to install?'; echo '0) Vanadium'; echo '1) Holy Unblocker'; echo '2) Incognito'; echo '3) Degeneracy'; echo '4) Reborn'; echo '5) SysYa++'; echo '6) Tsunami'
read proxy
if [ $proxy == 0 ] || [ $proxy == vanadium ]
then
vanadium
elif [ $proxy == 1 ] || [ $proxy == 'Holy Unblocker' ] || [ $proxy == hu ] || [ $proxy == holyub ]
then
holyub
elif [ $proxy == 2 ] || [ $proxy == incognito ] || [ $proxy == in ]
then
incognito
elif [ $proxy == 3 ] || [ $proxy == degeneracy ] || [ $proxy == degen ]
then
degeneracy
elif [ $proxy == 4 ] || [ $proxy == reborn ] || [ $proxy == ml ] || [ $proxy == mikelime ]
then
reborn
elif [ $proxy == 5 ] || [ $proxy == sysya ] || [ $proxy == systemya ] || [ $proxy == sysya++ ] || [ $proxy == systemya++ ]
then
sysya
elif [ $proxy == 6 ] || $proxt == tsunami ]
then
tsunami
else
echo 'Please enter a valid response.'
ask
fi
}
ask
