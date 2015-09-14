# willekeur
Change the wallpaper to a random Google Earth View on Arch Linux with XFCE 4. It works by downloading a random image and using xfce-config. Other environments could be added in next releases.

## Installation

### Using the AUR package manager

	$ yaourt -S --noconfirm willekeur

### Cloning this repository

	$ git clone [URL]
	$ cd willekeur
	$ sudo mv willekeur.sh /usr/bin/willekeur

## Command

This is quite easy, you can just call the script by entering 

	$ willekeur

Now he will try to fetch a Google Earth image and set it as your background

## Run this script at startup

I am assuming you are using a bash shell so just edit your .bashrc by adding a call to /usr/bin/willekeur (or wherever you placed the file)

or do it the easy way and just do

	echo ". /usr/bin/willekeur" >> ~/.bashrc
## Supported desktop managers

- XFCE4 with xconf-query

I am planning to support the other ones as well but at the moment only XFCE4 is supported.