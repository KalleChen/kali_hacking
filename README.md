# kali linux for Ethical Hacking

## setup for 2020.1 version

### source

[kali linux virtualbox images](https://www.offensive-security.com/kali-linux-vm-vmware-virtualbox-image-download/#1572305786534-030ce714-cc3b)

default login/password

```bash
“kali/kali”
sudo apt update && apt upgrade
```

### root setting

```bash
sudo -i
passwd
```

### ssh setting

```bash
sudo apt install openssh-server
```

setting port number in

```bash
/etc/ssh/sshd_config
```

```bash
sudo service ssh restart
```

usage

```bash
ssh kali@xxx.xxx.xxx.xxx -p xx
```

### usb wifi adapter setting for TL-WN722N/v3 (unnecessary and it crash sometimes)([use the recommended adapter](https://www.wirelesshack.org/best-kali-linux-compatible-usb-adapter-dongles.html))

dirver setting

<https://github.com/aircrack-ng/rtl8188eus.git>

```bash
git clone https://github.com/aircrack-ng/rtl8188eus.git
sudo echo "blacklist r8188eu" > /etc/modprobe.d/realtek.conf
cd rtl8188eus
sudo make && make install
```

reaver setting

<https://github.com/t6x/reaver-wps-fork-t6x>

```bash
sudo apt -y install build-essential libpcap-dev
git clone https://github.com/t6x/reaver-wps-fork-t6x
cd reaver-wps-fork-t6x/src
sudo ./configure
sudo make && make install
```

### tor & proxychain settings

```bash
/etc/proxychains.conf
comment strict_chain
uncomment dynamic_chain
add socks5 127.0.0.1 9050
or
serach "free socks5 proxy"
and add socksx xxx.xxx.xxx x
```

usage

```bash
sudo service tor start
proxychains [tool]
ex:
proxychains firefox dnsleaktest.com
```

### vpn settings

setting

<https://use.opendns.com>

```bash
cat /etc/resolv.conf
vim /etc/dhcp/dhclient.conf
uncomment prepend and add 208.67.222.222, 208.67.220.220
sudo service NetworkManager restart
cat /etc/resolv.conf
```

#### debug

due to the bug of dhclient in the 2020.1 version of kali,
you have to edit /etc/resolv.conf every time when you use vpn

source

<https://www.vpnbook.com/freevpn>

browser setting

```bash
go to "about:config"
set "media.peerconnection.enable" to false
```

download a openvpn client and unzip it

usage

```bash
sudo openvpn vpnbook-xxxxx-tcp443.ovpn
```

## Tools

### macchanger

setting scripts every reboot

```bash
crontab -e
@reboot ...
```

### nmap

- scan network

<https://nmap.org/nsedoc/>

<https://www.nirsoft.net/countryip/>

to check ip

```bash
nslookup
curl ipinfo.io/ip address
```

### airmon-ng

- open monitor mode

```bash
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
sudo airmon-ng check kill
```

### airodump-ng

- scan wifi

```bash
sudo airodump-ng wlan0
sudo airodump-ng -c [chanel] -w [file] --bssid [bssid]
```

### aireplay-ng

```bash
sudo aireplay-ng -0 0 -a [bssid] [interface]
```

### aircrack-ng

```bash
sudo airecrack-ng -w - [file].cap -e [wifi]
```

### crunch

```bash
sudo crunch [length] [length] | airecrack-ng ...
```

### wash

- before use

```bash
mkdir /etc/reaver
```

```bash
sudo wash -i [interface]
```

### reaver

```bash
sudo reaver -b [mac] -i [interface] -r [times] -vv
```