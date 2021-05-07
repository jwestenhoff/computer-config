# purpose:  installs signal
# source:   https://itsfoss.com/install-signal-ubuntu/

wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update
sudo apt install signal-desktop