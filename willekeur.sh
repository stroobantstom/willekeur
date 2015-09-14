#!/bin/sh

cd # Stopping the error shell-init

START=1003
END=1089

curl --silent -o ~/.background-image-temp.jpg https://www.gstatic.com/prettyearth/assets/full/$(( RANDOM % ($START - $END + 1) + $START)).jpg

while grep -q "an error" ~/.background-image-temp.jpg
do
	sleep 5
	curl --silent -o ~/.background-image-temp.jpg https://www.gstatic.com/prettyearth/assets/full/$(( RANDOM % ($START - $END + 1) + $START)).jpg
done

mv ~/.background-image-temp.jpg ~/.background-image.jpg	#Only change background image when a valid one has been downloaded

#XFCE4 
case $XDG_CURRENT_DESKTOP in
	"XFCE" )
		for property in $(xfconf-query -c xfce4-desktop -l | grep "last-image")
		do
			xfconf-query -c xfce4-desktop -p $property -s ~/.background-image.jpg
		done
		for imagestyle in $(xfconf-query -c xfce4-desktop -l | grep "image-style")
		do
			xfconf-query -c xfce4-desktop -p $imagestyle -s 5
		done
		;;
esac