sudo apt-get update && sudo apt-get install zram-tools -y

sudo service zramswap stop

echo 'ALGO=lz4' 'PERCENT=100' 'PERCENT=100' 'SIZE=1000' 'PRIORITY=100' | sudo tee -a /etc/default/zramswap
sudo systemctl daemon-reload

sudo service zramswap start
echo "[x] Zram has beed added ..."
