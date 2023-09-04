sudo  apt-get update && sudo apt-get upgrade -y
sudo apt-get install cpufrequtils -y

echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils

sudo update-rc.d ondemand disable
