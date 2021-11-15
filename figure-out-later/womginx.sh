# assuming you are on Ubuntu/Debian

## Part 1 of installation ##

# update your repo list
sudo apt update

# 1. install nginx
sudo apt install nginx

# 2. install certbot and the nginx plugin
sudo apt install certbot python3-certbot-nginx

# 3. install nodejs (skip if you already have it)
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs

# 4. Get a (sub)domain with an A(AAA) record pointing to your VPS IP

# 5. Get an ssl certificate
sudo certbot --nginx certonly -n -d yourdomain.com

## Part 2 of installation ##

# 1. clone repo and wombat submodule
git clone --recursive https://github.com/binary-person/womginx

# 2. build wombat
cd womginx/public/wombat
npm install
npm run build-prod

# 3. replace 'womginx.arph.org' with 'yourdomain.com' in nginx.conf
cd .. # cd into public folder
sed -i -e 's/womginx.arph.org/yourdomain.com/g' ../nginx.conf

# 4. replace '/home/binary/womginx/public' with your public folder
sed -i -e "s/\/home\/binary\/womginx\/public/$(pwd | sed -e 's/\//\\\//g')/g" ../nginx.conf

# 5. make backup of original nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

# 6. copy womginx nginx.conf to /etc/nginx/nginx.conf
sudo cp ../nginx.conf /etc/nginx/nginx.conf

# 7. restart the nginx server
sudo service nginx restart
