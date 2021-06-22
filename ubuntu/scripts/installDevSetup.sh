# add bin bash line

echo "### INSTALL VIM ###"
sudo apt install vim -y

echo "### INSTALL VSCode ###"
sudo snap install --classic code

for filePath in ./dev/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done
