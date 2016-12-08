#!/usr/bin/env python
import blinkt
import sys

progress=0
blinkt.set_clear_on_exit()

while True:
        # line = sys.stderr.read()
        # if line == '':
        #         break
        # try:
	# 	progress=int(line)
	# 	print string(line)
        # except:
        #         pass
	f = open('.log','r')
	if f.read() == '':
		break;
	else:
		progress=int(f.read())
		print progress
	blinkt.clear()
	if progress > 0:
		blinkt.set_pixel(0,0,255,0)
	if progress > 13:
		blinkt.set_pixel(1,0,255,0)
	if progress > 26:
		blinkt.set_pixel(2,0,255,0)
	if progress > 39:
		blinkt.set_pixel(3,0,255,0)
	if progress > 52:
		blinkt.set_pixel(4,0,255,0)
	if progress > 65:
		blinkt.set_pixel(5,0,255,0)
	if progress > 78:
		blinkt.set_pixel(6,0,255,0)
	if progress > 91:
		blinkt.set_pixel(7,0,255,0)
	blinkt.show()


