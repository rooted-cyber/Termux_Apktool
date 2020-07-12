fol() {
	cd $PREFIX
	}
	ch() {
		fol
		cd bin
		if [ -e TApktool ];then
		printf "\n Starting command : TApktool \n"
		else
		setup
		fi
		}
	setup() {
		printf "\n\033[1;92m [+] Updating packages \n"
		apt update && apt upgrade
		apt --fix-broken install
		dpkg --configure -a
		clear
		printf "\n Installing python\n"
		apt install python
		clear
		printf "\n Installing figlet & toilet\n"
		apt install figlet toilet
		clear
		printf "\n Installing wget\n"
		apt install wget
		clear
		printf "\n Installing Apksigner\n"
		apt install apksigner
		clear
		printf "\n\033[1;93m Installing Tool requirements\n"
		termux-setup-storage
		mkdir /sdcard/Termux_Apktool
		cd ~/Termux_apktool/deb
		dpkg -i *deb
		ch
		sett
		}
	sett() {
		fol
		cd share/figlet
		if [ -e font.flf ];then
		printf "\n\033[1;92m All requirements installed\n"
		ch
		else
		setup
		fi
		}
		sett