#!/bin/bash
# GASSS SSH WEBSOCKET
# ==============================

# Banner / Figlet
read -p "Press Enter For Contitune : GASSS ENTER "

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/wonderfulgo/Gasken1/main/crotlagi.py
chmod +x /usr/local/bin/edu-proxy

# Installing Service
cat > /etc/systemd/system/edu-proxy-nontls.service << END 
[Unit]
Description=Python Proxy SweetieSSH
Documentation=https://t.me/SweetieSSH
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxy 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxy-nontls
systemctl restart edu-proxy-nontls

# Installing Service
cat > /etc/systemd/system/edu-proxy-tls.service << END 
[Unit]
Description=Python Proxy SweetieSSH
Documentation=https://t.me/SweetieSSH
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxy 2096
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxy-tls
systemctl restart edu-proxy-tls

clear
echo done

