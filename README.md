# Tails in a Box

Very rough proof of concept in the form of some scripts that automatically dd's a copy of Tails onto any inserted pendrive and gives a status via blinkt.

Requirements:
* Rasbian (updated to take testing repos/updated coreutils)
* Pi (I used a zero)
* Blinkt (and their libraries)
* USB drives to flash
[Optional for shutting down]
* I have it set so that if a yubikey is inserted it autoshuts down this could be adjusted for other manufacturers of usb devices.

# NOTE: you will lose your data. it may not work, this is a proof of concept and works on my side, i may pull the image off it if i get it to an acceptable stage
