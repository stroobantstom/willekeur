#!/bin/sh

START=1003
END=1089

curl --silent -o ~/.background-image.jpg https://www.gstatic.com/prettyearth/assets/full/$(( RANDOM % ($START - $END + 1) + $START)).jpg

while grep -q "an error" ~/.background-image.jpg
do
	sleep 5
	curl --silent -o ~/.background-image.jpg https://www.gstatic.com/prettyearth/assets/full/$(( RANDOM % ($START - $END + 1) + $START)).jpg
done

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