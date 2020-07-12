fol() {
	if [ -e /sdcard/Termux_Apktool ];then
	echo
	else
	mkdir /sdcard/Termux_Apktool
	fi
	}
	
	banner() {
	clear
	cd $PREFIX/share/figlet
	if [ -e font.flf ];then
	clear
	else
	printf "\n\n\033[1;97m First install requirements!! \n\n"
	fi
	random
	toilet -f font Termux
	random
	toilet -f font Apktool
	
	printf "\n\033[1;92m[\033[0m::\033[1;92m]	\033[1;96mCreated by : \033[1;97mhttps://github.com/rooted-cyber	\033[1;92m[\033[0m::\033[1;92m]\n"
	}
	copy-apk() {
		printf "\n\n\033[1;93m [*] Enter apk name (\033[1;91m without apk \033[1;93m) %s\033[0m "
		read a
		if [ ! -z $a ];then
		cd ~/Termux_Apktool > /dev/null 2>&1
		cp -rf $a /sdcard/Termux_Apktool
		rm -rf $a
		printf "\n\033[1;93m Copied $a folder in \033[0m /sdcard/Termux_Apktool\n\n"
		fi
		}
	check-apk () {
		if [ -e /sdcard/Termux_Apktool/*apk ];then
		printf "\n\033[1;92m[*] Please wait your apk is decompiling\n\n\033[1;94m"
		cp -f /sdcard/Termux_Apktool/*apk ~/Termux_Apktool
		cd ~/Termux_Apktool
		chmod 700 *apk
		apktool d *apk
		copy-_ # pk
		else
		printf "\n\033[1;91m Copy apk file and try again !!\n\n"
		fi
		}
	decompile () {
		clear
		fol
		printf "\n\033[1;92m Copy Apk file in \033[0m /sdcard/Termux_Apktool\n"
		read
		check-apk
		}
		
	ap() {
		if [ -e $PREFIX/bin/apktool ];then
		sleep 0.7
		printf "\033[1;93m[√]\033[1;96m Installed"
		else
		printf "\033[1;93m[×]\033[1;91m Not install !!"
		fi
		}
		javv() {
			if [ -e $PREFIX/bin/java ];then
		sleep 0.7
		printf "\033[1;93m[√]\033[1;96m Installed"
		else
		printf "\033[1;93m[×]\033[1;91m Not install !!"
		fi
		}
		apktool="$(ap)"
			
	install-apktool () {
		printf "\n\033[1;92m Checking Apktool...\n"
		apk="$(ap)"
		jav="$(javv)"
		printf "\n\033[1;92m Apktool >> $apk\t"
		printf "\033[1;92mjava >> $jav\n\n"
		sleep 1
		cd $PREFIX/bin
		if [ -e apktool ];then
		printf "\n\033[1;93m [√] Apktool is already installed !!! \n\n"
		exit
		else
		sleep 1
		clear
		printf "\n \033[1;91m [×] Apktool not install !!!\n"
		sleep 1
		printf "\n\033[1;92m [+] Now Installing Apktool\n"
		sleep 1
		cd $PREFIX/bin
		printf "\n[*] Downloading apktool\n\n"
		wget https://github.com/rooted-cyber/good/raw/master/apktool/apktool.zip
		unzip apktool.zip
		chmod 777 apktool*
		printf "\n Requirements again checking ....\n"
		apk="$(ap)"
		jav="$(javv)"
		printf "\n\033[1;92m Apktool >> $apk\t"
		printf "\033[1;92mjava >> $jav\n\n"
		printf "\n\033[1;92m [+] Apktool is $apk\n"
		printf "\n\033[1;92m [+] Java is $jav\n\n"
		if [ -e $PREFIX/bin/java ];then
		exit
		fi
		printf "\033[1;92m [+] Now installing java\n"
		installjava
		fi
		}
		apktool-uninstall() {
			if [ -e $PREFIX/bin/apktool ] || [ -e $PREFIX/bin/java ];then
			rm -rf $PREFIX/share/jdk*
			rm -f $PREFIX/bin/java
			rm -f $PREFIX/bin/apktool
			printf "\n\033[1;92m [√] uninstalled apktool!! \n\n"
			exit
			else
			printf "\n\033[1;91m First install apktool !!! \n\n"
			exit
			fi
			}
			recompile() {
				printf "\n \033[1;92m Currently not available\n"
				}
				checking() {
					cd /sdcard/Termux_Apktool
					if [ -e *apk ];then
					cp -f *apk ~/Termux_Apktool
					cd ~/Termux_Apktool
					printf "\n\n\033[1;96m[*] Please wait you apk is signing..\n"
					apksigner -p 12345 keystore *.apk new-signer.apk
					cp -f new-signer.apk /sdcard/Termux_Apktool
					sleep 1
					printf "\n\033[1;92m [√] Succesfully your apk sign\n\n"
					else
					printf "\n\n\033[1;91m First copy apk and try again !!\n\n"
					fi
					}
					
					sign() {	
					fol
					printf "\n\033[1;92m Copy Apk file in \033[0m /sdcard/Termux_Apktool\n"
					read
					checking
					}
				
	menu () {
		banner
		printf "\n\033[1;92m[\033[0m1\033[1;92m]\033[1;93m Apktool Install\033[1;91m [ $apktool\033[1;91m ]\n"
		printf "\033[1;92m[\033[0m2\033[1;92m]\033[1;93m Apktool Uninstall\n"
		printf "\033[1;92m[\033[0m3\033[1;92m]\033[1;93m Decompile apk \033[1;91m [ $apktool\033[1;91m Apktool ]\n"
		printf "\033[1;92m[\033[0m4\033[1;92m]\033[1;93m Recompile apk \033[1;91m [ $apktool\033[1;91m Apktool ]\n"
		printf "\033[1;92m[\033[0m5\033[1;92m]\033[1;93m Sign apk\n"
		printf "\033[1;92m[\033[0m6\033[1;92m]\033[1;93m Exit\n\n\n"
		printf "\033[1;96mTermux\033[0m@\033[1;92mApktool \033[0m%s --> "
		read b
		case $b in
		1)install-apktool ;;
		2)apktool-uninstall ;;
		3)decompile ;;
		4)recompile ;;
		5)sign ;;
		6)exit ;;
		*)menu ;;
		esac
		}
		menu