#!/bin/bash
# Function: modify the configuration of touch screen's resolution.
# Author: Jacky.li
# Date: 2017-04-26
#
# clear screen.
clear
#install dialog package
sudo apt-get install dialog

#Remove the puple line on the left of the screen.
remove_puple_line(){
  cd /home/pi
  wget http://wiki.52pi.com/images/a/af/Edid.dat.zip
  unzip /home/pi/Edid.dat.zip
  sudo mv -f /home/pi/edid.dat /boot/
}

# Funciton greeting.
greeting(){
dialog --backtitle "GeeekPi Touch Screen Resolution Configure Panel" \
--msgbox "Welcome to GeeekPi Touch Screen Resolution Configure Panel, please select your screen's resolution and press OK to continue.It supports 5inch 800x480 USB touch screen and 5inch 800x480 GPIO touch screen, 7inch 1024x600 touch screen, 7inch 1280x800 touch screen,more information please access http://wiki.52pi.com/. Thanks" \
20 80 --begin 20 10
}

# Function yesno
yesno(){
dialog --backtitle "GeeekPi Touch Screen Resolution Configure Panel" \
--title "Configure /boot/config.txt file" \
--clear \
--yesno "Do you agree to modify /boot/config.txt file?" 20 80
result=$?
if [ $result -eq 0 ]; then
  change_resolution;
elif [ $result -eq 255 ]; then
 exit 255;
fi
}

change_resolution(){
dialog --clear --backtitle "GeeekPi Touch Screen Resolution Configure Panel" \
--title "Resolution select" \
--radiolist "Please select resolution of your screen" 20 80 30 R1 "5inch 800x480" on R2 "7inch 800x480" off R3 "7inch 1024x600" off R4 "7inch 1280x800" off R5 "5inch 800x480 Capacitive" off R6 "7inch 1024x600 Capacitive with USB HOST" off 2>.select
RES_NUM=$(cat .select)
case $RES_NUM in
R1)
  remove_puple_line
  sudo sed -i '/^#.*framebuffer.*/s/^#//' /boot/config.txt
  sudo sed -i '/^framebuffer_width.*/s/framebuffer_width.*/framebuffer_width=800/' /boot/config.txt
  sudo sed -i '/^framebuffer_height.*/s/framebuffer_height.*/framebuffer_height=480/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_cvt.*/d' /boot/config.txt
  sudo sed -i '/hdmi_edid_file.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=87' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_cvt 800 480 60 6 0 0 0' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_edid_file=1' /boot/config.txt
   ;;
R2)
  sudo sed -i '/^#.*framebuffer.*/s/^#//' /boot/config.txt
  sudo sed -i '/^framebuffer_width.*/s/framebuffer_width.*/framebuffer_width=800/' /boot/config.txt
  sudo sed -i '/^framebuffer_height.*/s/framebuffer_height.*/framebuffer_height=480/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_cvt.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=87' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_cvt 800 480 60 6 0 0 0' /boot/config.txt
   ;;
R3)
  sudo sed -i '/^#.*framebuffer.*/s/^#//' /boot/config.txt
  sudo sed -i '/^framebuffer_width.*/s/framebuffer_width.*/framebuffer_width=1024/' /boot/config.txt
  sudo sed -i '/^framebuffer_height.*/s/framebuffer_height.*/framebuffer_height=600/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_cvt.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=87' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_cvt 1024 600 60 3 0 0 0' /boot/config.txt
   ;;
R4)
  sudo sed -i '/disable_overscan/s/^#//' /boot/config.txt
  sudo sed -i '/^disable_overscan/s/disable_overscan.*/disable_overscan=1/' /boot/config.txt
  sudo sed -i '/hdmi_drive.*/s/^#//' /boot/config.txt
  sudo sed -i '/^hdmi_drive/s/hdmi_drive.*/hdmi_drive=1/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=28' /boot/config.txt
   ;;
R5)
  remove_puple_line
  sudo sed -i '/^#.*framebuffer.*/s/^#//' /boot/config.txt
  sudo sed -i '/^framebuffer_width.*/s/framebuffer_width.*/framebuffer_width=800/' /boot/config.txt
  sudo sed -i '/^framebuffer_height.*/s/framebuffer_height.*/framebuffer_height=480/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_cvt.*/d' /boot/config.txt
  sudo sed -i '/hdmi_edid_file.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=87' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_cvt 800 480 60 6 0 0 0' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_edid_file=1' /boot/config.txt
   ;;
   R6)
  sudo sed -i '/^#.*framebuffer.*/s/^#//' /boot/config.txt
  sudo sed -i '/^framebuffer_width.*/s/framebuffer_width.*/framebuffer_width=1024/' /boot/config.txt
  sudo sed -i '/^framebuffer_height.*/s/framebuffer_height.*/framebuffer_height=600/' /boot/config.txt
  sudo sed -i '/hdmi_force_hotplug/s/^#//' /boot/config.txt
  sudo sed -i '/hdmi_group.*/d' /boot/config.txt
  sudo sed -i '/hdmi_mode.*/d' /boot/config.txt
  sudo sed -i '/hdmi_cvt.*/d' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_group=2' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_mode=87' /boot/config.txt
  sudo sed -i '/hdmi_force/a\hdmi_cvt 1024 600 60 3 0 0 0' /boot/config.txt
   ;;
*)
exit 255
esac
}

show_details(){
dialog --backtitle "GeeekPi Touch Screen Resolution Configure Panel" --textbox "/boot/config.txt" 20 80
}

clear_window(){
dialog --msgbox "Configuration is compelete!" 20 80 --begin 10 70 --yesno "Do you want to reboot your system?" 20 60
if [ $? -eq 0 ];then
   sudo sync && sudo reboot
elif [ $? -eq 255 ];then
   exit 255
fi
dialog --clear
}
# Call greeting and yesno.
greeting
yesno
show_details
clear_window
rm -rf .select
sudo rm -rf /home/pi/Edid.*
sudo rm -rf /home/pi/__MAC*
clear
##End of file##
