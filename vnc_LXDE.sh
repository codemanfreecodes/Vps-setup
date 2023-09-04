sudo apt update
sudo apt upgrade

sudo apt install tightvncserver -y

vncserver && vncserver -kill :1
echo "[x]  Setup is done ..."

echo "{x] Starting vnc ..."

echo "[x] Configure VNC Startup:"
sed -i 's|/etc/X11/Xsession|export XKL_XMODMAP_DISABLE=1; exec /usr/bin/lxsession -s LXDE -e LXDE\n\n/etc/X11/Xsession|' ~/.vnc/xstartup

nano ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup


echo "[x] VNC Startup: 100% "
