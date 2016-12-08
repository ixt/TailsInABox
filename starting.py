#!/usr/bin/env python
import blinkt,sys,time
blinkt.set_clear_on_exit()
blinkt.set_brightness(0.1)

def starting():
	blinkt.clear()
	for j in range(3):
		time.sleep(0.2)
		for i in range(0,8):
			blinkt.set_pixel(i,0,255,0)
		blinkt.show()
		time.sleep(0.2)
		for i in range(0,8):
			blinkt.set_pixel(i,0,0,0)
		blinkt.show()
		
starting()
