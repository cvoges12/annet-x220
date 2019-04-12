Annet x220
==========
**System configuration for [NixOS](https://nixos.org/) on the ThinkPad x220**

Features
--------
* Network Automation
* Security Automation
* Service Automaton
* User Automation
* Hardware Automation
* Package Automation
* Misc Config Automation
  
Install
-------
```
curl https://0x0.st/zPgc.sh > install.sh
chmod +x install.sh
bash install.sh
```

Start Wireless
--------------
```
systemctl restart wpa_supplicant.service
systemctl restart dhcpcd.service
wpa_supplicant -B -i wlp3s0 -c <(wpa_passphrase "<SSID>" "<PASSPHRASE>") 2
iwlist wlp3s0 scan
```

Diagnose Wireless
-----------------
`strace wpa_supplicant -i <WIFIINTERFACE> -c <(wpa_passphrase <SSID> <PASSPHRASE>) 2>&1 | less`
