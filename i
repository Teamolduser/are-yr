#!/bin/bash
# Base made through ChatGPT
# FOR NODEJS VERSION REFERS TO https://nodejs.org/en/download

cd $HOME

apt install figlet

clear

figlet STARTING

# Set an environment variable based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Check for specific Linux distributions
    if [[ -f /etc/arch-release ]]; then
        # Install packages on Arch Linux
        echo "Detect OS :- Arch Linux" 
        sleep 3       
        sudo pacman -Syu --noconfirm ffmpeg nodejs-lts-hydrogen git imagemagick npm
        sudo npm install --global yarn
        clear
    elif [[ -f /etc/fedora-release ]]; then
        # Install packages on Fedora
        echo "Detect OS :- Fedora Linux" 
        sleep 3 
        sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install -y ffmpeg nodejs git ImageMagick yarnpkg
        clear
    elif [[ -f /etc/lsb-release && "$(cat /etc/lsb-release | grep DISTRIB_ID)" == *"Ubuntu"* ]]; then
        # Install packages on Ubuntu
        echo "Detect OS :- Ubuntu Linux"
        sleep 3 
        sudo apt-get update
        sudo apt-get install -y ffmpeg git curl imagemagick
        curl -sL https://deb.nodesource.com/setup_19.x | sudo -E bash -
        sudo apt-get install -y nodejs
        sudo npm install --global yarn
        npm install --global yarn
        clear
    elif [[ -f /etc/debian_version ]]; then
        # Install packages on Debian
        echo "Detect OS :- Debian Linux"
        sleep 3 
        sudo apt-get update
        sudo apt-get install -y ffmpeg git curl imagemagick
        curl -sL https://deb.nodesource.com/setup_19.x | sudo -E bash -
        sudo apt-get install -y nodejs
        sudo npm install --global yarn
        npm install --global yarn
        clear
    elif [[ -f /etc/redhat-release ]]; then
        # Install packages on Red Hat
        echo "Detect OS :- RedHat Linux"
        sleep 3 
        sudo yum install -y ffmpeg nodejs git ImageMagick yarnpkg
        clear
    else
        echo "Unknown Linux distribution"
        exit 1
    fi
elif [[ "$OSTYPE" == "linux-android"* ]]; then
    # Install packages on Termux
    apt update
    apt upgrade 
    apt install -y ffmpeg nodejs git imagemagick libwebp yarn
    clear
elif [[ "$OSTYPE" == "linux"* ]]; then
    if [[ -f /etc/os-release && "$(cat /etc/os-release | grep ID_LIKE)" == *"suse"* ]]; then
        # Install packages on openSUSE
        echo "Detect OS :- openSUSE Linux" 
        sleep 3
        sudo zypper install -y ffmpeg-5 nodejs19 git ImageMagick 
        sudo zypper install -y nodejs19 git ImageMagick ffmpeg-4
        sudo npm install --global yarn
        clear
    fi  
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Install packages on macOS
    brew install ffmpeg nodejs git imagemagick yarn
    clear
else
    echo "Unsupported operating system"
    exit 1
fi

clear 

termux-setup-storage

yarn global add yarn

yarn global add npm

apt install zip unzip

cd /sdcard

rm -rf MT2

mkdir MT2

figlet HALF

figlet DONE

director() {

echo " ARE YOU HAVE DOWNLOADED FILES IN YOUR INTERNAL STORAGE IF YES THEN PRESS Y ELSE PRESS N FOR NO"

read ans

if [[ ${ans} =~ ^([Yy])$ ]] then

echo " ENTER DIRECTOR NAME /N 'FOR EXAMPLE :-  /android/media FOR EXAMPLE :- /andriod/media/com.whatsapp' "

read directory

cd ${directory}

echo "ENTER FILE NAME"

read file_name

unzip file_name

else

echo "enter github user name"
read usr
echo "enter github repo name"
read repo

# Clone the Anya repository
echo "Copying github repo Script 🌐"

git clone https://github.com/${usr}/${repo}.git

fi

ls

rm -rf are-yr

ls

# Change into the Nezuko directory
cd ${repo}

# Install dependencies using yarn
yarn install

clear

# Start the  bot
echo "Starting the Bot 💕💕💕💕💕💕💕💕💕"

yarn start