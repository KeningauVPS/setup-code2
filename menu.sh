#!/bin/bash
# Created by Kang wahid
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "Sepertinya Anda tidak menjalankan installer ini pada sistem Debian, Ubuntu atau CentOS"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "--------------- Selamat Datang Di Vps Anda Boss ---------------"
	echo ""
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
	echo -e "------------------------------------------------------------------------------"
	echo -e "Seputar SSH & OpenVPN"
	echo -e "\e[40;38;5;82m [1]\e[40;38;5;198mBuat akun SSH & OpenVPN\e[40;38;5;226m [user-add]"
	echo -e "\e[40;38;5;82m [2]\e[40;38;5;198mGenerate akun SSH/OpenVPN\e[40;38;5;226m [user-generate]"
	echo -e "\e[40;38;5;82m [3]\e[40;38;5;198mBuat account trial untuk SSH & OpenVPN\e[40;38;5;226m [trial]"
	echo -e "\e[40;38;5;82m [4]\e[40;38;5;198mTambah masa aktif akun SSH & OpenVPN\e[40;38;5;226m [user-aktif]"
	echo -e "\e[40;38;5;82m [5]\e[40;38;5;198mGanti password akun SSH/OpenVPN\e[40;38;5;226m [User-password]"
	echo -e "\e[40;38;5;82m [6]\e[40;38;5;198mBannned user yang melakukan multilogin\e[40;38;5;226m [user-ban]"
	echo -e "\e[40;38;5;82m [7]\e[40;38;5;198mUnbanned user SSH & OpenVPN yang terbanned\e[40;38;5;226m [user-unban]"
	echo -e "\e[40;38;5;82m [8]\e[40;38;5;198mMengunci user SSH & OpenVPN \e[40;38;5;226m [user-lock]"
	echo -e "\e[40;38;5;82m [9]\e[40;38;5;198mMembuka user SSH & OpenVPN yang terkunci\e[40;38;5;226m [user-unlock]"
	echo -e "\e[40;38;5;82m[10]\e[40;38;5;198mHapus Akun SSH & OpenVPN\e[40;38;5;226m [user-delete]"
	echo -e "\e[40;38;5;82m[12]\e[40;38;5;198mLihat detail user SSH & OpenVPN\e[40;38;5;226m [user-detail]"
	echo -e "\e[40;38;5;82m[13]\e[40;38;5;198mTampilkan daftar user SSH & OpenVPN\e[40;38;5;226m [user-list]"
	echo -e "\e[40;38;5;82m[14]\e[40;38;5;198mCek login Dropbear, OpenSSH, dan OpenVPN\e[40;38;5;226m [user-login]"
	echo -e "\e[40;38;5;82m[15]\e[40;38;5;198mLihat log login Dropbear & OpenSSH\e[40;38;5;226m [user-log]"
	echo -e "\e[40;38;5;82m[16]\e[40;38;5;198mKill Multi Login\e[40;38;5;226m [user-limit]"
	echo -e "\e[40;38;5;82m[17]\e[40;38;5;198mTampilkan user yang akan expired dalam waktu dekat\e[40;38;5;226m [infouser]"
	echo -e "\e[40;38;5;82m[18]\e[40;38;5;198mTampilkan user yang telah expired\e[40;38;5;226m [expireduser]"
	echo -e "\e[40;38;5;82m[19]\e[40;38;5;198mHapus user SSH & OpenVPN yang telah expired\e[40;38;5;226m [user-delete-expired]"
	echo -e "\e[40;38;5;82m[20]\e[40;38;5;198mKunci user SSH & OpenVPN yang telah expired\e[40;38;5;226m [user-expire]"
	echo -e "\e[40;38;5;82m[21]\e[40;38;5;198mLihat daftar user yang terkick\e[40;38;5;226m [log-limit]"
	echo -e "\e[40;38;5;82m[22]\e[40;38;5;198mLihat daftar user yang terbanned\e[40;38;5;226m [log-ban]"
	echo -e "\e[40;38;5;82m[23]\e[40;38;5;198mBuat akun PPTP VPN\e[40;38;5;226m [user-add-pptp]"
	echo -e "\e[40;38;5;82m[24]\e[40;38;5;198mHapus akun PPTP VPN\e[40;38;5;226m [user-delete-pptp]"
	echo -e "\e[40;38;5;82m[25]\e[40;38;5;198mLihat detail akun PPTP VPN\e[40;38;5;226m [user-detail-pptp]"
	echo -e "\e[40;38;5;82m[26]\e[40;38;5;198mCek login PPTP VPN\e[40;38;5;226m [user-login-pptp]"
	echo -e "\e[40;38;5;82m[27]\e[40;38;5;198mLihat daftar user PPTP VPN\e[40;38;5;226m [alluser-pptp]"
	echo -e "\e[40;38;5;82m[28]\e[40;38;5;198mSpeedtest server\e[40;38;5;226mspeedtest --share"
	echo -e "\e[40;38;5;82m[29]\e[40;38;5;198mBenchmark server\e[40;38;5;226m [bench-network]"
	echo -e "\e[40;38;5;82m[30]\e[40;38;5;198mLihat penggunaan RAM server\e[40;38;5;226m [ram]"
if [[ "$OS" = 'debian' ]]; then 
	echo -e "\e[40;38;5;82m[31]\e[40;38;5;198mRestart OpenSSH\e[40;38;5;226m [service ssh restart]"
	echo -e "\e[40;38;5;82m[32]\e[40;38;5;198mRestart Dropbear\e[40;38;5;226m [service dropbear restart]"
	echo -e "\e[40;38;5;82m[33]\e[40;38;5;198mRestart OpenVPN\e[40;38;5;226m [service openvpn restart]"
	echo -e "\e[40;38;5;82m[34]\e[40;38;5;198m Restart PPTP VPN\e[40;38;5;226m [service pptpd restart]"
	echo -e "\e[40;38;5;82m[35]\e[40;38;5;198mRestart Webmin e[40;38;5;226m [service webmin restart]"
	echo -e "\e[40;38;5;82m[36]\e[40;38;5;198mRestart Squid Proxy\e[40;38;5;226m [service squid3 restart]"
else
	echo -e "\e[40;38;5;82m[31]\e[40;38;5;198mRestart OpenSSH\e[40;38;5;226m [service sshd restart]"
	echo -e "\e[40;38;5;82m[32]\e[40;38;5;198mRestart Dropbear\e[40;38;5;226m [service dropbear restart]"
	echo -e "\e[40;38;5;82m[33]\e[40;38;5;198mRestart OpenVPN\e[40;38;5;226m [service openvpn restart]"
	echo -e "\e[40;38;5;82m[34]\e[40;38;5;198mRestart PPTP VPN\e[40;38;5;226m [service pptpd restart]"
	echo -e "\e[40;38;5;83m[35]\e[40;38;5;198mRestart Webmin\e[40;38;5;226m [service webmin restart]"
	echo -e "\e[40;38;5;82m[36]\e[40;38;5;198mRestart Squid Proxy\e[40;38;5;226m [service squid restart]"
fi
echo -e "\e[40;38;5;82m[37]\e[40;38;5;198mEdit Port Server\e[40;38;5;226 [medit-port]"
echo -e "\e[40;38;5;82m[38]\e[40;38;5;198mSet auto reboot pada server\e[40;38;5;226m [auto-reboot]"
echo -e "\e[40;38;5;82m[39]\e[40;38;5;198mReboot server\e[40;38;5;226m [reboot]"
echo -e "\e[40;38;5;82m[40]\e[40;38;5;198mGanti Password Server\e[40;38;5;226m [passwd]"
echo -e "\e[40;38;5;82m[41]\e[40;38;5;198mLihat log instalasi\e[40;38;5;226m [log-install]"
echo -e "\e[40;38;5;82m[42]\e[40;38;5;198mUpdate now\e[40;38;5;226m [Coming soon]"
echo -e "\e[38;5;33m@orangkuatsabahanterkini"
read -p "Tulis Pilihan Anda (angka): " x
if test $x -eq 1; then
user-add
elif test $x -eq 2; then
user-generate
elif test $x -eq 3; then
trial
elif test $x -eq 4; then
user-aktif
elif test $x -eq 5; then
user-password
elif test $x -eq 6; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-ban $MULTILOGIN
elif test $x -eq 7; then
user-unban
elif test $x -eq 8; then
user-lock
elif test $x -eq 9; then
user-unlock
elif test $x -eq 10; then
user-delete
elif test $x -eq 11; then
user-detail
elif test $x -eq 12; then
user-list
elif test $x -eq 13; then
user-login
elif test $x -eq 14; then
user-log
elif test $x -eq 15; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-limit $MULTILOGIN
elif test $x -eq 16; then
infouser
elif test $x -eq 17; then
expireduser
elif test $x -eq 18; then
user-delete-expired
elif test $x -eq 19; then
clear
echo "Script ini berjalan secara otomatis setiap jam 12 malam"
echo "Anda tidak perlu menjalankannya secara manual"
echo "Jika anda tetap ingin menjalankan script ini, ketik user-expire"
elif test $x -eq 20; then
log-limit
elif test $x -eq 21; then
log-ban
elif test $x -eq 22; then
user-add-pptp
elif test $x -eq 23; then
user-delete-pptp
elif test $x -eq 24; then
user-detail-pptp
elif test $x -eq 25; then
user-login-pptp
elif test $x -eq 26; then
alluser-pptp
elif test $x -eq 27; then
speedtest --share
elif test $x -eq 28; then
bench-network
elif test $x -eq 29; then
ram
elif test $x -eq 30; then
	if [[ "$OS" = 'debian' ]]; then 
		service ssh restart 
	else 
		service sshd restart 
	fi
elif test $x -eq 31; then
service dropbear restart
elif test $x -eq 32; then
service openvpn restart
elif test $x -eq 33; then
	if [[ "$OS" = 'debian' ]]; then 
		service pptpd restart 
	else 
		service pptpd restart 
	fi
elif test $x -eq 34; then
service webmin restart
elif test $x -eq 35; then
	if [[ "$OS" = 'debian' ]]; then 
		service squid3 restart 
	else 
		service squid restart 
	fi
elif test $x -eq 36; then
edit-port
elif test $x -eq 37; then
auto-reboot
elif test $x -eq 38; then
reboot
elif test $x -eq 39; then
passwd
elif test $x -eq 40; then
log-install
elif test $x -eq 41; then
wget https://raw.githubusercontent.com/ehomecore91/setup-code2/master/hide/and/setup -O - -o /dev/null|sh
else
echo "Pilihan Tidak Terdapat Di Menu."
exit
fi
